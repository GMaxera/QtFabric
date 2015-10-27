package com.redberrydigital.qtwitter;

import java.net.URL;
import java.io.File;
import android.net.Uri;
import android.util.Log;
import android.content.Context;
import android.content.Intent;
import io.fabric.sdk.android.Fabric;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.tweetcomposer.TweetComposer;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.tweetcomposer.ComposerActivity;
import com.twitter.sdk.android.tweetcomposer.Card;

/*! Java class for bind the C++ method of QTwitter to the
 *  java implementation using the native Twitter SDK for Android
 *
 *  This class is a singleton because it's a binding of a singleton C++ object
 *  All the methods are static, and they use the private singleton instance
 */
public class QTwitterBinding {

	//! Authenticate to the Twitter APP with consumerKey and consumerSecret specified
	static public void authenticate(Context context, String consumerKey, String consumerSecret) {
		Log.i("QTwitter", String.format("AUTHENTICATE WITH: %s - %s", consumerKey, consumerSecret));
		TwitterAuthConfig authConfig =  new TwitterAuthConfig(consumerKey, consumerSecret);
		Fabric.with(context, new TwitterCore(authConfig));
	}

	//! Create the Intent for composing a Tweet
	static public void compose(Context context, String message, String link, String imageUri) {
		try {
			Log.i("QTwitter", String.format("STARTING THE COMPOSER: %s", Uri.parse(imageUri).toString()) );
			TweetComposer.Builder builder = new TweetComposer.Builder(context)
				.text(message)
				.url(new URL(link))
				.image(Uri.parse(imageUri));
			builder.show();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
