#根目录下自动化编译
.PHONY:all clean

all:
#到每个路径下去编译
	make -C lcd
	make -C usb
	make -C media
	make -C app

clean:
	rm -fr app/player.o app/player.d app/mp3
#两个文件都需要写路径
	rm -fr usb/usb.o usb/usb.d
	rm -fr lcd/lcd.o lcd/lcd.d
	rm -fr media/media.o media/media.d
