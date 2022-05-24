import 'flutter_app_icons_platform_interface.dart';

class FlutterAppIcons {
  Future<String?> setIcon({required String icon, String oldIcon = ''}) {
    return FlutterAppIconsPlatform.instance
        .setIcon(icon: icon, oldIcon: oldIcon);
  }
}
