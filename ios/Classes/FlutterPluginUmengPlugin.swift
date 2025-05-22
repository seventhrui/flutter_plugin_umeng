import Flutter
import UIKit
import UMCommon

public class FlutterPluginUmengPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_plugin_umeng", binaryMessenger: registrar.messenger())
    let instance = FlutterPluginUmengPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "preInit":
      handlePreInit(call, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func handlePreInit(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? [String: Any] else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Arguments must be a map", details: nil))
    }

    guard let appKey = call.arguments as? [String: Any] else {
        result(FlutterError(code: "MISSING_APP_KEY", message: "appKey is required", details: nil))
    }

    let channel = args["channel"] as? String

    UMConfigure.initWithAppkey(appKey, channel: channel)
    result(1)
  }
}
