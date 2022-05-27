import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_icons/flutter_app_icons.dart';
import 'package:flutter_app_icons/flutter_app_icons_platform_interface.dart';
import 'package:flutter_app_icons/flutter_app_icons_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAppIconsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAppIconsPlatform {
  @override
  Future<String?> setIcon(
          {required String icon,
          String oldIcon = '',
          String appleTouchIcon = ''}) =>
      Future.value(icon);
}

void main() {
  final FlutterAppIconsPlatform initialPlatform =
      FlutterAppIconsPlatform.instance;

  test('$MethodChannelFlutterAppIcons is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAppIcons>());
  });

  test('setIcon', () async {
    FlutterAppIcons flutterAppIconsPlugin = FlutterAppIcons();
    MockFlutterAppIconsPlatform fakePlatform = MockFlutterAppIconsPlatform();
    FlutterAppIconsPlatform.instance = fakePlatform;

    expect(await flutterAppIconsPlugin.setIcon(icon: 'favicon'), 'favicon');
  });
}
