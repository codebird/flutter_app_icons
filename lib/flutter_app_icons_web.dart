// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

import 'flutter_app_icons_platform_interface.dart';

/// A web implementation of the FlutterAppIconsPlatform of the FlutterAppIcons plugin.
class FlutterAppIconsWeb extends FlutterAppIconsPlatform {
  /// Constructs a FlutterAppIconsWeb
  FlutterAppIconsWeb();

  static void registerWith(Registrar registrar) {
    FlutterAppIconsPlatform.instance = FlutterAppIconsWeb();
  }

  /// Sets favicon of webpage to [icon].
  ///
  /// If [appleTouchIcon] is provided, sets it to a `link[rel=apple-touch-icon]`.
  @override
  Future<String> setIcon({
    required String icon,
    String oldIcon = '',
    String appleTouchIcon = '',
  }) async {
    if (appleTouchIcon != '') {
      _getLinkWithRel('apple-touch-icon').href = appleTouchIcon;
    }
    _getLinkWithRel('icon').href = icon;
    return icon;
  }

  // This function returns a link with `rel` from the page.
  //
  // If the link[rel] does not exist, it adds it to the head.
  web.HTMLLinkElement _getLinkWithRel(String rel) {
    web.Element? link = web.document.querySelector('link[rel="$rel"]');
    if (link == null) {
      link = web.document.createElement('link');
      (link as web.HTMLLinkElement).rel = rel;
      web.document.head?.appendChild(link);
    }
    return link as web.HTMLLinkElement;
  }
}
