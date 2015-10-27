#ifndef QTWITTER_H
#define QTWITTER_H

#include <QObject>
#include <QtQml>

/*! QTwitter object allow to access a various functionality of Twitter SDK
 *  in a simpler way and on different platform with the same interface.
 *
 *  The supported platform for now are: Android and iOS
 */
class QTwitter : public QObject {
	Q_OBJECT
	//! consumerKey of the Twitter APP to use
	Q_PROPERTY( QString consumerKey READ getConsumerKey NOTIFY authConfigChanged )
	//! consumerSecret of the Twitter APP to use
	Q_PROPERTY( QString consumerSecret READ getConsumerSecret NOTIFY authConfigChanged )
public:
	/*! singleton type provider function for Qt Quick */
	static QObject* qTwitterProvider(QQmlEngine *engine, QJSEngine *scriptEngine);
	/*! singleton object provider for C++ */
	static QTwitter* instance();
public slots:
	//! return the current consumerKey in use
	QString getConsumerKey();
	//! return the current consumerSecret in use
	QString getConsumerSecret();
	//! set the consumerKey and consumerSecret to use for authentication on Twitter
	void setAuthConfig( QString consumerKey, QString consumerSecret );
	//! authenticate the app on twitter and intialize this object for using Twitter operation
	void authenticate();
	/*! start to compose a Tweet
	 *  \param message is the initial message to show on the composer (the user can change it)
	 *  \param link is the link to add to the message (the user can change it)
	 *  \param localImage an Url to a local image file to use into the tweet (cannot be inside the Bundle)
	 */
	void compose( QString message=QString(), QUrl link=QString(), QUrl localImage=QUrl() );
signals:
	//! emitted when the auth configuration changes
	void authConfigChanged();
private:
	/*! singleton object */
	QTwitter( QObject* parent=0 );
	~QTwitter();
	Q_DISABLE_COPY(QTwitter)

	QString consumerKey;
	QString consumerSecret;
};

#endif
