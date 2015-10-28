
#include "qtwitter.h"
#include <QQuickView>
#include <QDebug>
#include <QGuiApplication>
#include <qpa/qplatformnativeinterface.h>
#import <TwitterKit/TwitterKit.h>
#import <Fabric/Fabric.h>

void QTwitter::authenticate() {
	[[Twitter sharedInstance] startWithConsumerKey:(consumerKey.toNSString()) consumerSecret:consumerSecret.toNSString()];
	[Fabric with:@[[Twitter sharedInstance]]];
}

void QTwitter::compose( QString message, QUrl link, QUrl localImage ) {

	UIView *view = static_cast<UIView *>(QGuiApplication::platformNativeInterface()->nativeResourceForWindow("uiview",mainView));
	UIViewController *qtController = [[view window] rootViewController];

	TWTRComposer *composer = [[TWTRComposer alloc] init];

	[composer setText:(message.toNSString())];
	[composer setURL:(link.toNSURL())];
	//[composer setImage:[UIImage imageNamed:@"fabric"]];

	// Called from a UIViewController
	[composer showFromViewController:qtController completion:^(TWTRComposerResult result) {
		if (result == TWTRComposerResultCancelled) {
			NSLog(@"Tweet composition cancelled");
		}
		else {
			NSLog(@"Sending Tweet!");
		}
	}];
}
