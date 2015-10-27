
#include "qtwitter.h"
#include <QtAndroid>
#include <QtAndroidExtras>

void QTwitter::authenticate() {
	if ( consumerKey.isEmpty() || consumerSecret.isEmpty() ) {
		// Do Nothing
		return;
	}
	QAndroidJniObject activity = QtAndroid::androidActivity();
	QAndroidJniObject key = QAndroidJniObject::fromString(consumerKey);
	QAndroidJniObject secret = QAndroidJniObject::fromString(consumerSecret);
	QAndroidJniObject::callStaticMethod<void>(
		"com/redberrydigital/qtwitter/QTwitterBinding",
		"authenticate",
		"(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V",
		activity.object<jobject>(),
		key.object<jstring>(),
		secret.object<jstring>()
	);

	QAndroidJniEnvironment env;
	if (env->ExceptionCheck()) {
		// Handle exception here.
		env->ExceptionClear();
	}
}

void QTwitter::compose( QString message, QUrl link, QUrl localImage ) {
	QAndroidJniObject activity = QtAndroid::androidActivity();
	QAndroidJniObject msg = QAndroidJniObject::fromString(message);
	QAndroidJniObject url = QAndroidJniObject::fromString(link.toString());
	QAndroidJniObject image = QAndroidJniObject::fromString(localImage.toString());
	QAndroidJniObject::callStaticMethod<void>(
		"com/redberrydigital/qtwitter/QTwitterBinding",
		"compose",
		"(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
		activity.object<jobject>(),
		msg.object<jstring>(),
		url.object<jstring>(),
		image.object<jstring>()
	);

	QAndroidJniEnvironment env;
	if (env->ExceptionCheck()) {
		// Handle exception here.
		env->ExceptionClear();
	}
}
