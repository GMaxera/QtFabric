
INCLUDEPATH += $$PWD

SOURCES += \
	$$PWD/qtwitter.cpp

HEADERS += \
	$$PWD/qtwitter.h

android {
	QT += androidextras
	SOURCES += $$PWD/qtwitter_android.cpp

	JAVASRC.path = /src/com/redberry/qtwitter
	JAVASRC.files += $$files($$PWD/Android/src/org/gmaxera/qtfacebook/*)
	INSTALLS += JAVASRC
} else:ios {
	## the objective sources should be put in this variable
	OBJECTIVE_SOURCES += \
		$$PWD/qtwitter_ios.mm
}

OTHER_FILES += \
	$$PWD/README.md

