###############################
# a simple Makefile demo
# Author: wit.wang@qq.com
# Date:   2016.12.20
##############################
.PONHY:all clean
ifeq ($(DEBUG),"true")
CC = gcc -g
else
CC = gcc
endif
all:test1
all:test2
test1:
	@echo "Just for test:$@"
test2:
	@echo "hello test2"
hello:lcd.o player.o
	$(CC) -o hello lcd.o player.o
player.o:player.c
	$(CC) -o player.o -c player.c
lcd.o:lcd.c
	$(CC) -o lcd.o -c lcd.c
clean:
	rm -f lcd.o hello player.o
