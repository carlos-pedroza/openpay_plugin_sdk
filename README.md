# openpay_plugin_sdk

Openpay sdk get devicesessionid

## Android

Add in android/build.gradle

this:

android {
    compileSdkVersion 31
    ...

    packagingOptions {
        exclude 'META-INF/DEPENDENCIES'
        exclude 'META-INF/LICENSE'
        exclude 'META-INF/LICENSE.txt'
        exclude 'META-INF/license.txt'
        exclude 'META-INF/NOTICE'
        exclude 'META-INF/NOTICE.txt'
        exclude 'META-INF/notice.txt'
        exclude 'META-INF/ASL2.0'
    }
}

add: example/android/app/src/main/AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="...">
    <uses-permission android:name="android.permission.INTERNET"></uses-permission>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" ></uses-permission>
     <activity ...

## IOS

## Implement

```Dart
final _openpayPluginSdkPlugin = OpenpayPluginSdk();
String merchantId = 'mf...';
String publicKey = 'pk_...';

String platformVersion;
String deviceSessionId;
platformVersion = await _openpayPluginSdkPlugin.getPlatformVersion() ?? 'Unknown platform version';
deviceSessionId = await _openpayPluginSdkPlugin.createDeviceSessionId(merchantId, publicKey, false) ?? '-';
```