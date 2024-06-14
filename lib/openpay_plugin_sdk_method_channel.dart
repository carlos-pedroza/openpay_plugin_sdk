import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'openpay_plugin_sdk_platform_interface.dart';

/// An implementation of [OpenpayPluginSdkPlatform] that uses method channels.
class MethodChannelOpenpayPluginSdk extends OpenpayPluginSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('openpay_plugin_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> createDeviceSessionId(
      String merchantId, String publicKey, bool isProductionMode) async {
    final deviceSessionId =
        await methodChannel.invokeMethod<String>('createDeviceSessionId', {
      'merchantId': merchantId,
      'publicKey': publicKey,
      'isProductionMode': isProductionMode,
    });
    return deviceSessionId;
  }
}
