# openpay_plugin_sdk

Openpay sdk get devicesessionid

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
