// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'flutter_app_icons_platform_interface.dart';

/// A web implementation of the FlutterAppIconsPlatform of the FlutterAppIcons plugin.
class FlutterAppIconsWeb extends FlutterAppIconsPlatform {
  /// Constructs a FlutterAppIconsWeb
  FlutterAppIconsWeb();

  static void registerWith(Registrar registrar) {
    FlutterAppIconsPlatform.instance = FlutterAppIconsWeb();
  }

  /// sets favicon of webpage
  @override
  Future<String> setIcon(
      {required String icon, String oldIcon = '', String appleTouchIcon = ''}) {
    LinkElement? link = querySelector("link[rel~='icon']") as LinkElement?;

    if (appleTouchIcon != '') {
      LinkElement? linkAppleTouchIcon =
          querySelector("link[rel~='apple-touch-icon']") as LinkElement?;
      if (linkAppleTouchIcon == null) {
        linkAppleTouchIcon = LinkElement()..rel = 'apple-touch-icon';
        querySelector('head')?.children.add(linkAppleTouchIcon);
      }
      linkAppleTouchIcon.href = appleTouchIcon;
    }

    if (link == null) {
      link = LinkElement()..rel = 'icon';
      querySelector('head')?.children.add(link);
      return Future(() => icon);
    }
    link.href = icon;
    return Future(() => icon);
  }
}
