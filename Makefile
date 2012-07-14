include theos/makefiles/common.mk

BUNDLE_NAME = SiLight
SiLight_BUNDLE_EXTENSION = assistantExtension
SiLight_FILES = AESiLight.mm AESiLightCommands.mm AESiLightSnippet.mm
SiLight_INSTALL_PATH = /Library/AssistantExtensions/
SiLight_FRAMEWORKS = UIKit CoreGraphics AVFoundation

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
