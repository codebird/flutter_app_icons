package com.hmallah.flutter_app_icons;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import androidx.annotation.NonNull;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * FlutterAppIconsPlugin
 */
public class FlutterAppIconsPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context context;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_app_icons");
        context = flutterPluginBinding.getApplicationContext();
        channel.setMethodCallHandler(this);
    }


    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("setIcon")) {
            Log.d("Debugging", "We got here.");

            PackageManager pm = context.getPackageManager();
            pm.setComponentEnabledSetting(
                    new ComponentName(context.getApplicationInfo().packageName, context.getApplicationInfo().packageName+".MainActivityRed"),
                    PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP);
            Log.d("Debugging", "We got here 2.");
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}