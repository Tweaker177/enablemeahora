ARCHS = arm64 armv7
TARGET = iphone:clang:11.2:9.0
#CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = EnableMeAhora
EnableMeAhora_FILES = EMARootListController.m
EnableMeAhora_INSTALL_PATH = /Library/PreferenceBundles
EnableMeAhora_FRAMEWORKS = UIKit Foundation 
EnableMeAhora_PRIVATE_FRAMEWORKS = Preferences
EnableMeAhora_CFLAGS = -fobjc-arc
EnableMeAhora_LDFLAGS += -lCSColorPicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/EnableMeAhora.plist$(ECHO_END)
