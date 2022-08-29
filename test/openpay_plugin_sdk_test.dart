import 'package:flutter_test/flutter_test.dart';
import 'package:openpay_plugin_sdk/openpay_plugin_sdk.dart';
import 'package:openpay_plugin_sdk/openpay_plugin_sdk_platform_interface.dart';
import 'package:openpay_plugin_sdk/openpay_plugin_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOpenpayPluginSdkPlatform 
    with MockPlatformInterfaceMixin
    implements OpenpayPluginSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<String?> createDeviceSessionId(String merchantId, String publicKey, bool isProductionMode) {
    // TODO: implement createDeviceSessionId
    throw UnimplementedError();
  }
}

void main() {
  final OpenpayPluginSdkPlatform initialPlatform = OpenpayPluginSdkPlatform.instance;

  test('$MethodChannelOpenpayPluginSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOpenpayPluginSdk>());
  });

  test('getPlatformVersion', () async {
    OpenpayPluginSdk openpayPluginSdkPlugin = OpenpayPluginSdk();
    MockOpenpayPluginSdkPlatform fakePlatform = MockOpenpayPluginSdkPlatform();
    OpenpayPluginSdkPlatform.instance = fakePlatform;
  
    expect(await openpayPluginSdkPlugin.getPlatformVersion(), '42');
  });
}
