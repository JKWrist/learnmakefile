#3.7支持静态库的生成和使用
.PHONY:all clean

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)
BIN := $(addprefix $(BUILD_ROOT)/,$(BIN))

LINK_OBJ_DIR = $(BUILD_ROOT)/app/link_obj
$(shell mkdir -p $(LINK_OBJ_DIR))
DEP_DIR = $(BUILD_ROOT)/app/dep
$(shell mkdir -p $(DEP_DIR))

#库生成的目标文件在此路径下
LIB_OBJ_DIR = $(BUILD_ROOT)/app/lib_obj
$(shell mkdir -p $(LIB_OBJ_DIR))
#库文件件路径
LIB_DIR = $(BUILD_ROOT)/lib


OBJ_DIR = $(LINK_OBJ_DIR)
#LIB变量为空时
ifneq ("$(LIB)","")
OBJ_DIR = $(LIB_OBJ_DIR)
endif

OBJS := $(addprefix $(OBJ_DIR)/,$(OBJS))
DEPS := $(addprefix $(DEP_DIR)/,$(DEPS))

#LIB变量加前缀，生成之后就放到LIB_DIR下面了
LIB  := $(addprefix $(LIB_DIR)/,$(LIB))

LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)
LINK_OBJ +=$(OBJS)

#依赖的库所有.a文件
LIB_DEP = $(wildcard $(LIB_DIR)/*.a)
#链接库的模式处理
LINK_LIB_NAME = $(patsubst lib%,-l%,$(basename $(notdir $(LIB_DEP))))

all: $(DEPS) $(OBJS) $(LIB) $(BIN)
ifneq ("$(wildcard $(DEPS))","")	
include $(DEPS)
endif
$(BIN):$(LINK_OBJ) $(LIB_DEP)
	@echo "LINK_LIB_NAME=$(LINK_LIB_NAME)"
#-L库的路径 -lmedia
	gcc -o $@ $^ -L$(LIB_DIR) $(LINK_LIB_NAME)
	
#生成库
$(LIB):$(OBJS)
	ar rcs $@ $^
$(OBJ_DIR)/%.o:%.c
	gcc -I$(HEAD_PATH) -o $@ -c $(filter %.c,$^)
$(DEP_DIR)/%.d:%.c
	gcc -I$(HEAD_PATH) -MM $(filter %.c,$^) | sed 's,\(.*\)\.o[ :]*,$(OBJ_DIR)/\1.o $@:,g' > $@
clean:
	rm -f  $(BIN) $(OBJS) $(DEPS)
