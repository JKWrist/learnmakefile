.PHONY:all clean install uninstall

#把配置文件包含进来
include config.mk

all:
#循环 shell脚本
	@for dir in $(BUILD_DIR); \
	do \
		make -C $$dir; \
	done
clean:
	rm -rf app/link_obj app/dep app/lib_obj mp3
	rm -rf lib/*.a
	rm -rf lib/*.so
install:
	cp mp3 /usr/bin
	cp lib/libmath.so /usr/lib
	cp lib/ext_lib/librmvb.so /usr/lib
uninstall:
	rm -f /usr/bin/mp3
	rm /usr/lib/libmath.so
	rm /usr/lib/librmvb.so
