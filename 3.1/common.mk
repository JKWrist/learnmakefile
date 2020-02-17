.PHONY:clean
#源文件 当前目录下所有.c文件
SRCS = $(wildcard *.c)

#目标文件 将.c换成.o
OBJS = $(SRCS:.c=.o)

#依赖文件 将.c换成.d
DEPS = $(SRCS:.c=.d)

#链接目标文件路径
LINK_OBJ_DIR = /home/harrytc/Downloads/makefile/3.1/app/link_obj
#如果没有这个路径则递归创建这个路径
$(shell mkdir -p $(LINK_OBJ_DIR))
#目标文件不只是*.o还是带有路径的
OBJS := $(addprefix $(LINK_OBJ_DIR)/,$(OBJS))

LINK_OBJ = $(wildcard $(LINK_OBJ_DIR)/*.o)

#target
all:$(BIN) $(DEPS) $(OBJS)
#若当前目录下没有.d文件则不包含
ifneq ("$(wildcard $(DEPS))","")
include $(DEPS)
endif
#我们的BIN是在每个路径下面定义的
$(BIN):$(LINK_OBJ)
	gcc -o $@ $^ 
#将.c编译成带有绝对路径的.o文件
$(LINK_OBJ_DIR)/%.o:%.c
	gcc -o $@ -c $(filter %.c,$^)
#将.c文件的依赖重定向到.d文件中
%.d:%.c
	gcc -MM $^ > $@
clean:
	rm -rf $(BIN) $(OBJS) $(DEPS)
