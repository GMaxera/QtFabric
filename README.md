QtTwitter
==========

How to use for iOS platform
==========
## Prepare Twitter SDK for iOS

Unfortunately, the official instruction for installing Twitter SDK required the use of Fabric.app and a custom modification of your XCode project. This process it's not suitable for Qt applications where the Xcode project is part of the building process.
A workaround is to passing via CocoaPods using a fake Xcode project:

* Create a directory "CocoaPods"
* Create inside this directory an Xcode project "Empty" (just autogenerate a single view iOS project with Xcode and save here)
* Create a file "Podfile" with the following content:
```
xcodeproj 'Empty/Empty'

pod 'Fabric', '~> 1.5.5'
pod 'TwitterCore', '~> 1.12.0'
pod 'TwitterKit', '~> 1.12'
```
* run "pod install"

At this stage, inside the "CocoaPods" there will be a directory "Pods" with all Frameworks necessary to use the TwitterKit.
It remains to use them into your .pro adding the following lines:
```


How to use for Android platform
==========
## Prepare Twitter SDK for Android

These instructions are only for gradle.

* Modify your build.gradle adding the Fabric twitter repositories and plugins:
```
buildscript {
  repositories {
	jcenter()
	// Add repository
	maven { url 'https://maven.fabric.io/public' }
  }
  dependencies {
	classpath 'com.android.tools.build:gradle:1.0.+'
	// The Fabric Gradle plugin
	classpath 'io.fabric.tools:gradle:1.+'
  }
}

apply plugin: 'com.android.application'
//Put Fabric plugin after Android plugin
apply plugin: 'io.fabric'

repositories {
	jcenter()
	// Add repository
	maven { url 'https://maven.fabric.io/public' }
}
```

* Add a file 'fabric.properties' into your Android source directory and fill it with the Fabric ApiKey and Secret:
```
apiSecret=YOUR_BUILD_SECRET
apiKey=YOUR_API_KEY
```

* Add the Twitter Core to the compile section of your build.gradle
```
dependencies {
	compile('com.twitter.sdk.android:twitter-core:1.6.0@aar') {
		transitive = true;
	}
	compile('com.twitter.sdk.android:tweet-composer:1.0.0@aar') {
		transitive = true;
	}
}
```

How to use in Qt Quick
==========

* in your main.cpp (or more appropriate point depending on the structure of your app) register the QTwitter object as Singleton (you cannot use more instances of QTwitter) with the following code:
```
#include "qtwitter.h"
...
qmlRegisterSingletonType<QTwitter>("com.yourcompany.yourapp", 1, 0, "Twitter", QTwitter::qTwitterProvider);
```
* in Qt Quick 2 source, use the QTwitter with the following code:
```
import com.yourcompany.yourapp 1.0
MouseArea {
	onClicked: Twitter.compose()
}
```
