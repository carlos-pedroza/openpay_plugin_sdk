import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openpay_plugin_sdk/openpay_plugin_sdk_method_channel.dart';

void main() {
  MethodChannelOpenpayPluginSdk platform = MethodChannelOpenpayPluginSdk();
  const MethodChannel channel = MethodChannel('openpay_plugin_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
