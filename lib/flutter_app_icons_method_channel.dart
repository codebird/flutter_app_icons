import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_app_icons_platform_interface.dart';

/// An implementation of [FlutterAppIconsPlatform] that uses method channels.
class MethodChannelFlutterAppIcons extends FlutterAppIconsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_app_icons');

  @override
  Future<String?> setIcon({required String icon}) async {
    await methodChannel.invokeMethod<String>('setIcon', <String, String>{
      'icon': icon,
    });
    return '';
  }
}
