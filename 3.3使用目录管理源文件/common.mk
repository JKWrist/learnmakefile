.PHONY:all clean

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)
 
all: $(DEPS) $(OBJS) $(BIN)
ifneq ("$(wildcard $(DEPS))","")	
include $(DEPS)
endif

#添加目标文件路径
$(BIN):$(OBJS)
	gcc -o $@ $^ ../lcd/lcd.o ../usb/usb.o ../media/media.o
%.o:%.c
	gcc -o $@ -c $(filter %.c,$^)
%.d:%.c
	gcc -MM $^ > $@
clean:
	rm -f  $(BIN) $(OBJS) $(DEPS)
