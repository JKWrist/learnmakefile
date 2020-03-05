#使用目录管理目标文件
.PHONY:all clean

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)
#BIN存放的路径变化
BIN := $(addprefix /home/mp3/,$(BIN))

#存放目标文件目录
LINK_OBJ_DIR =/home/mp3/app/link_obj
#没有的话创建
$(shell mkdir -p $(LINK_OBJ_DIR))

#立即变量，立即生效 加前缀函数
OBJS := $(addprefix $(LINK_OBJ_DIR)/,$(OBJS))

#需要链接的目标文件
LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)
LINK_OBJ +=$(OBJS)

all: $(DEPS) $(OBJS) $(BIN)
ifneq ("$(wildcard $(DEPS))","")	
include $(DEPS)
endif

#依赖修改之后的目标变量
$(BIN):$(LINK_OBJ)
	@echo "LINK_OBJ=$(LINK_OBJ)"
	gcc -o $@ $^ 
	
#.o文件加前缀
$(LINK_OBJ_DIR)/%.o:%.c
	gcc -o $@ -c $(filter %.c,$^)

#解决目标依赖.o文件依赖在当前文件夹下面的问题，因为.o文件在LINK_OBJ_DIR下生成
%.d:%.c
	gcc -MM $^ | sed 's,\(.*\).o[ :]*,$(LINK_OBJ_DIR)/\1.o:,g' > $@
clean:
	rm -f  $(BIN) $(OBJS) $(DEPS)
