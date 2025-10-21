import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_plugin_umeng_platform_interface.dart';

/// An implementation of [FlutterPluginUmengPlatform] that uses method channels.
class MethodChannelFlutterPluginUmeng extends FlutterPluginUmengPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_plugin_umeng');

  @override
  Future<int?> preInit({
    required String appKey,
    required String channel,
    bool isDebug = false
  }) async {
    final version = await methodChannel.invokeMethod<int>('preInit', {
      'appKey': appKey,
      'channel': channel,
      'isDebug': isDebug
    });
    return version;
  }
}
