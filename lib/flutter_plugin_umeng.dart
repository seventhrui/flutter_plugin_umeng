
import 'flutter_plugin_umeng_platform_interface.dart';

class FlutterPluginUmeng {
  Future<int?> preInit({
    required String appKey,
    required String channel,
  }) {
    return FlutterPluginUmengPlatform.instance.preInit(
      appKey: appKey,
      channel: channel,
    );
  }
}
