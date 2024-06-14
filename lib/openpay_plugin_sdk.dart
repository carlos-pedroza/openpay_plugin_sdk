import 'openpay_plugin_sdk_platform_interface.dart';

class OpenpayPluginSdk {
  Future<String?> getPlatformVersion() {
    return OpenpayPluginSdkPlatform.instance.getPlatformVersion();
  }

  Future<String?> createDeviceSessionId(
    String merchantId,
    String publicKey,
    bool isProductionMode,
  ) {
    return OpenpayPluginSdkPlatform.instance.createDeviceSessionId(
      merchantId,
      publicKey,
      isProductionMode,
    );
  }
}
