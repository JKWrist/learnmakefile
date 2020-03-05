#---------------------------------
# Common_MAKEFILE
# Description: a project makefile demo
# Author     : ddblog@qq.com
# Date	     : 2016.12.23
#---------------------------------
# build root directory
export BUILD_ROOT = $(shell pwd)

# Head files PATH
export HEAD_PATH = $(BUILD_ROOT)/inc

#build directory
#when you add a module,you need add you directory
# here
#编译目录
BUILD_DIR = $(BUILD_ROOT)/lcd/ \
	    $(BUILD_ROOT)/usb/ \
	    $(BUILD_ROOT)/media/ \
	    $(BUILD_ROOT)/math/ \
	    $(BUILD_ROOT)/app/

#添加新功能debug版本，release版本
#跨平台版本x86 arm MIPS PowerPC
#生成elf文件很bin文件
#用户链接脚本
#子目录启动make进程能力
#并行编译
DEBUG = true
ARCH  = arm
