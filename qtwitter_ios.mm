
#include "qtwitter.h"
#include <QDebug>
#import <TwitterKit/TwitterKit.h>
#import <Fabric/Fabric.h>

void QTwitter::authenticate() {
	qDebug() << "I'm here";
	[[Twitter sharedInstance] startWithConsumerKey:(consumerKey.toNSString()) consumerSecret:consumerSecret.toNSString()];
	[Fabric with:@[[Twitter sharedInstance]]];
	qDebug() << "I'm here";
}

void QTwitter::compose( QString message, QUrl link, QUrl localImage ) {

}
