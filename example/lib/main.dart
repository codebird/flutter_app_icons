import 'package:flutter/material.dart';
import 'package:flutter_app_icons/flutter_app_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterAppIconsPlugin = FlutterAppIcons();

  @override
  void initState() {
    super.initState();
    _flutterAppIconsPlugin.setIcon(icon: 'favicon-failure.png');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Check favicon\n'),
        ),
      ),
    );
  }
}
