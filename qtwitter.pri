
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
}

OTHER_FILES += \
	$$PWD/QTwitterBinding.java \
	$$PWD/README.md

