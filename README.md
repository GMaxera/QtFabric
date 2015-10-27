QtTwitter
==========

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
