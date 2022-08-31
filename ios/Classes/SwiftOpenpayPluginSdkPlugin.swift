import Flutter
import UIKit
import OpenpayKit

public class SwiftOpenpayPluginSdkPlugin: NSObject, FlutterPlugin {
  var openpay : Openpay!

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "openpay_plugin_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftOpenpayPluginSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
      case "createDeviceSessionId":
      guard let args = call.arguments as? [String : Any] else {return}
      let merchantId = args["merchantId"] as! String
      let publicKey = args["publicKey"] as! String
      let isProductionMode = args["isProductionMode"] as! Bool
      openpay = Openpay(withMerchantId: merchantId, andApiKey: publicKey, isProductionMode: isProductionMode, isDebug: false)
      openpay.createDeviceSessionId(successFunction: successSessionID, failureFunction: failSessionID)
      default:
        result("unknow")
    }
    func successSessionID(sessionID: String) {
      result(sessionID)
    }
    func failSessionID(error: NSError) {
      result("Error")
    }
  }
}
