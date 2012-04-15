include theos/makefiles/common.mk

BUNDLE_NAME = LockAssistant
LockAssistant_FILES = LockAssistant.m
LockAssistant_OBJCFLAGS = -I$(THEOS_PROJECT_DIR) -F$(THEOS_PROJECT_DIR)
LockAssistant_FRAMEWORKS = UIKit
LockAssistant_PRIVATE_FRAMEWORKS = Preferences
LockAssistant_INSTALL_PATH = /Library/PreferenceBundles

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LockAssistant.plist$(ECHO_END)
