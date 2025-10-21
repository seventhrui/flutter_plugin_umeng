
import 'flutter_plugin_umeng_platform_interface.dart';

class FlutterPluginUmeng {
  Future<int?> preInit({
    required String appKey,
    required String channel,
    bool isDebug = false
  }) {
    return FlutterPluginUmengPlatform.instance.preInit(
      appKey: appKey,
      channel: channel,
      isDebug: isDebug
    );
  }
}
