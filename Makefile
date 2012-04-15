GO_EASY_ON_ME = 1
export THEOS_DEVICE_IP = localhost

include theos/makefiles/common.mk

AGGREGATE_NAME = LockAssistant
SUBPROJECTS = PreferencesFMR TweakFMR LockAssistantCamFMR CamHooksFMR

include $(THEOS_MAKE_PATH)/aggregate.mk