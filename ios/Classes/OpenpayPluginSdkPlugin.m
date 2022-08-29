#import "OpenpayPluginSdkPlugin.h"
#if __has_include(<openpay_plugin_sdk/openpay_plugin_sdk-Swift.h>)
#import <openpay_plugin_sdk/openpay_plugin_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "openpay_plugin_sdk-Swift.h"
#endif

@implementation OpenpayPluginSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOpenpayPluginSdkPlugin registerWithRegistrar:registrar];
}
@end
