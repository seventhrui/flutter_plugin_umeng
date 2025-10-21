package com.flutter.flutter_plugin_umeng

import android.content.Context

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import com.umeng.commonsdk.UMConfigure

/** FlutterPluginUmengPlugin */
class FlutterPluginUmengPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_plugin_umeng")
    channel.setMethodCallHandler(this)

    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "preInit") {
      call.arguments<Map<String, Any>>()?.let {
        val appKey = it["appKey"] as String
        val channel = it["channel"] as String
        val isDebug = it["isDebug"] as Boolean
        UMConfigure.setLogEnabled(isDebug)
        UMConfigure.preInit(context, appKey, channel)
        UMConfigure.submitPolicyGrantResult(context, true)
        result.success(1)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
