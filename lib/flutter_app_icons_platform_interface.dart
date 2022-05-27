import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_app_icons_method_channel.dart';

abstract class FlutterAppIconsPlatform extends PlatformInterface {
  /// Constructs a FlutterAppIconsPlatform.
  FlutterAppIconsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAppIconsPlatform _instance = MethodChannelFlutterAppIcons();

  /// The default instance of [FlutterAppIconsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAppIcons].
  static FlutterAppIconsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAppIconsPlatform] when
  /// they register themselves.
  static set instance(FlutterAppIconsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> setIcon(
      {required String icon, String oldIcon = '', String appleTouchIcon = ''}) {
    throw UnimplementedError('setIcon() has not been implemented.');
  }
}
