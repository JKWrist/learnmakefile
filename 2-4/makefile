.PHONY:all

DEBUG = true 
ifeq ($(DEBUG),true)
VERSION = debug
CC = gcc -g
else
VERSION = release
CC = gcc
endif

hello:hello.c
	@echo "huild $(VERSION) mode"
	$(CC) -o $@ $^
clean:
	rm hello
