package com.globalhitss.openpay.openpay_plugin_sdk;

import androidx.annotation.NonNull;
import android.app.Activity;
import android.content.Context;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import mx.openpay.android.Openpay;
import java.util.HashMap;

/** OpenpayPluginSdkPlugin */
public class OpenpayPluginSdkPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  Activity activity;
  Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "openpay_plugin_sdk");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
      if (call.method.equals("getPlatformVersion")) {
        result.success("Android " + android.os.Build.VERSION.RELEASE);
      } else if (call.method.equals("createDeviceSessionId")) {
        HashMap args = (HashMap) call.arguments;
        if(args!=null) {
          String merchantId = (String) args.get("merchantId");
          String publicKey = (String) args.get("publicKey");
          Boolean isProductionMode = (Boolean) args.get("isProductionMode");
          Openpay openpay = new Openpay(merchantId, publicKey, isProductionMode);
          String deviceSessionId = openpay.getDeviceCollectorDefaultImpl().setup(this.activity);
          
          result.success(deviceSessionId);
        } 
        else {
          result.notImplemented();
        }
      } else {
        result.notImplemented();
      }
  }

  @Override 
  public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override 
  public void onDetachedFromActivity() {}

  @Override 
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    onAttachedToActivity(binding);
  }

  @Override 
  public void onAttachedToActivity(ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }

  @Override 
  public void onDetachedFromActivityForConfigChanges() {}
}
