import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:openpay_plugin_sdk/openpay_plugin_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _deviceSessionId = '';
  final _openpayPluginSdkPlugin = OpenpayPluginSdk();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String deviceSessionId;
    String merchantId = 'm...';
    String publicKey = 'pk_...';
    // Platform messages may fail, so w e use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _openpayPluginSdkPlugin.getPlatformVersion() ?? 'Unknown platform version';
      deviceSessionId = await _openpayPluginSdkPlugin.createDeviceSessionId(merchantId, publicKey, false) ?? '-';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      deviceSessionId = '';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _deviceSessionId = deviceSessionId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Running on: $_platformVersion'),
              const SizedBox(height: 20),
              Text('[$_deviceSessionId]'),
            ],
          ),
        ),
      ),
    );
  }
}
