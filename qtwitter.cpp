
#include "qtwitter.h"

QObject* QTwitter::qTwitterProvider(QQmlEngine *engine, QJSEngine *scriptEngine) {
	Q_UNUSED(engine)
	Q_UNUSED(scriptEngine)
	return QTwitter::instance();
}

QTwitter* QTwitter::instance() {
	static QTwitter* twitter = new QTwitter();
	return twitter;
}

QTwitter::QTwitter(QObject *parent )
	: QObject(parent) {
	//qDebug() << "Creating QTwitter singleton Instance";
}

QTwitter::~QTwitter() {
	// nothing to do
}

QString QTwitter::getConsumerKey() {
	return consumerKey;
}

QString QTwitter::getConsumerSecret() {
	return consumerSecret;
}

void QTwitter::setAuthConfig( QString consumerKey, QString consumerSecret ) {
	this->consumerKey = consumerKey;
	this->consumerSecret = consumerSecret;
	emit authConfigChanged();
}
