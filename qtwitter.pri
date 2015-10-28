
INCLUDEPATH += $$PWD

SOURCES += \
	$$PWD/qtwitter.cpp

HEADERS += \
	$$PWD/qtwitter.h

android {
	QT += androidextras
	SOURCES += $$PWD/qtwitter_android.cpp

	QTWITTER_JAVASRC.path = /src/com/redberrydigital/qtwitter
	QTWITTER_JAVASRC.files += $$PWD/QTwitterBinding.java
	INSTALLS += QTWITTER_JAVASRC
} else:ios {
	QT += gui-private
	## the objective sources should be put in this variable
	OBJECTIVE_SOURCES += \
		$$PWD/qtwitter_ios.mm

	LIBS += \
		-framework Social -framework Accounts -framework CoreData \
		-F$$FABRIC_FRAMEWORKS_ROOT/Fabric \
		-F$$FABRIC_FRAMEWORKS_ROOT/TwitterCore \
		-F$$FABRIC_FRAMEWORKS_ROOT/TwitterKit \
		-framework Fabric -framework TwitterCore -framework TwitterKit

	TWITTERKIT_BUNDLE.files = $$FABRIC_FRAMEWORKS_ROOT/TwitterKit/TwitterKit.framework/Resources/TwitterKitResources.bundle
	QMAKE_BUNDLE_DATA += TWITTERKIT_BUNDLE

	QMAKE_IOS_DEPLOYMENT_TARGET = 7.0

	QMAKE_XCODE_DEBUG_INFORMATION_FORMAT = dwarf-with-dsym
	#FABRIC_RUN.commands = echo "FABRIC RUN COMMAND"
	#QMAKE_POST_LINK += $$FABRIC_FRAMEWORKS_ROOT/Fabric/Fabric.framework/run $$FABRIC_APIKEY $$FABRIC_APISECRET
}

OTHER_FILES += \
	$$PWD/QTwitterBinding.java \
	$$PWD/README.md

