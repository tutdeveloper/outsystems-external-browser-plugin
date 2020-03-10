package com.cordova.LaunchExternalBrowser;

import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import java.net.MalformedURLException;
import java.net.URL;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;

/**
 * This class echoes a string called from JavaScript.
 * Based on code from https://github.com/OutSystemsExperts/outsystems-app-store-launcher-plugin/
 */
public class LaunchExternalBrowser extends CordovaPlugin {

  @Override public boolean execute(String action, JSONArray args, CallbackContext callbackContext)
      throws JSONException {
    if (action.equals("openExternalBrowser")) {
      final String siteURL = args.getString(0);
		if (siteURL != null && siteURL.length() > 0) {
			cordova.getActivity().runOnUiThread(new Runnable() {
			  @Override public void run() {
//				String webViewUrl = webView.getUrl();

//				if (webViewUrl != null) {
				  try {
					  
//					URL url = new URL(webViewUrl);
//					String baseUrl = url.getProtocol() + "://" + url.getHost();

//					String buildAppStoreUrl = baseUrl + "/NativeAppBuilder/App?AppKey=" + applicationKeyName;
					Intent i = new Intent(Intent.ACTION_VIEW);
					i.setData(Uri.parse(siteURL));
					cordova.getActivity().startActivity(i);
				  } catch (MalformedURLException e) {
					Log.e("LaunchIntent", e.toString());
				  }
//				}
			  }
			});
		  } else {
			callbackContext.error("No valid parameters");
		  }
      callbackContext.success();

      return true;
    }
    return false;
  }
}