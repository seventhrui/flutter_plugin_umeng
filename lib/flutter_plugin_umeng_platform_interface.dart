import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_plugin_umeng_method_channel.dart';

abstract class FlutterPluginUmengPlatform extends PlatformInterface {
  /// Constructs a FlutterPluginUmengPlatform.
  FlutterPluginUmengPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPluginUmengPlatform _instance = MethodChannelFlutterPluginUmeng();

  /// The default instance of [FlutterPluginUmengPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPluginUmeng].
  static FlutterPluginUmengPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPluginUmengPlatform] when
  /// they register themselves.
  static set instance(FlutterPluginUmengPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> preInit({
    required String appKey,
    required String channel,
    bool isDebug = false
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
