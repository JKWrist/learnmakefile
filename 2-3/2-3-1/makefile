.PHONY:clean

CC = gcc
hello:player.o lcd.o
	$(CC) -o play player.o lcd.o
player.o:player.c
lcd.o:lcd.c
clean:
	rm -f player.o lcd.o hello
