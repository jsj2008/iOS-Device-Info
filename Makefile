GO_EASY_ON_ME=1
TARGET := iphone:clang

TARGET_SDK_VERSION := 6.1
TARGET_IPHONEOS_DEPLOYMENT_VERSION := 6.1
ARCHS := armv7

export THEOS=/var/theos
include $(THEOS)/makefiles/common.mk

TOOL_NAME = HelloWorld
HelloWorld_FILES = DEMO.mm
HelloWorld_FRAMEWORKS = UIKit Foundation CoreFoundation
include $(THEOS_MAKE_PATH)/tool.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
HelloWorld_LDFLAGS=./libMobileGestalt.dylib
