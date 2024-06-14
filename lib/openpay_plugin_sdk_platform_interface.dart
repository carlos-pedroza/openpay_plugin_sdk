import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'openpay_plugin_sdk_method_channel.dart';

abstract class OpenpayPluginSdkPlatform extends PlatformInterface {
  /// Constructs a OpenpayPluginSdkPlatform.
  OpenpayPluginSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenpayPluginSdkPlatform _instance = MethodChannelOpenpayPluginSdk();

  /// The default instance of [OpenpayPluginSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpenpayPluginSdk].
  static OpenpayPluginSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpenpayPluginSdkPlatform] when
  /// they register themselves.
  static set instance(OpenpayPluginSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();

  Future<String?> createDeviceSessionId(
      String merchantId, String publicKey, bool isProductionMode);
}
