import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_icons/flutter_app_icons_method_channel.dart';

void main() {
  MethodChannelFlutterAppIcons platform = MethodChannelFlutterAppIcons();
  const MethodChannel channel = MethodChannel('flutter_app_icons');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'test';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.setIcon(icon: 'test', oldIcon: 'test'), 'test');
  });
}
