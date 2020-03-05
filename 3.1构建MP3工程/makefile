#3.1构建MP3工程

#伪目标
.PHONY:all clean
#wildcard函数扫描当前目录下所有.c文件
SRCS = $(wildcard *.c)
#字符串替换
OBJS = $(SRCS:.c=.o)
BIN  = mp3
#伪目标可以生成多个目标
all: $(BIN)

$(BIN):$(OBJS)
	@echo "SRCS =$(SRCS)"
	@echo "OBJS =$(OBJS)"
	gcc -o $@ $^
%.o:%.c
	gcc -o $@ -c $^
clean:
	rm -f  $(BIN) $(OBJS)
