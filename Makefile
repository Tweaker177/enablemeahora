ARCHS = arm64 armv7
TARGET = iphone:clang:11.2:9.0
#CFLAGS = -fobjc-arc
DEBUG = 0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = EnableMeAhora
EnableMeAhora_FILES = Tweak.xm
EnableMeAhora_FRAMEWORKS = UIKit Foundation
EnableMeAhora_CFLAGS = -fobjc-arc
EnableMeAhora_LDFLAGS += -lCSColorPicker

include $(THEOS_MAKE_PATH)/tweak.mk
after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += EnableMeAhora
include $(THEOS_MAKE_PATH)/aggregate.mk