.PHONY:all clean
#主makefile
all:
	make -C lcd
	make -C usb
	make -C media
	make -C app
clean:
	rm -rf app/*.o app/*.d app/mp3 app/link_obj/*.o
	rm -rf lcd/*.o lcd/*.d
	rm -rf media/*.o media/*.d
	rm -rf usb/*.o usb/*.d
