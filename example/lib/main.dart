import 'dart:async';

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
  String icon = 'favicon.png';
  @override
  void initState() {
    super.initState();
    //_flutterAppIconsPlugin.setIcon(icon: 'favicon-failure.png');
  }

  @override
  Widget build(BuildContext context) {
    //Auto icon change every 5 seconds, just for testing.
    // Timer.periodic(const Duration(seconds: 5), (Timer timer) {
    //   String oldIcon = icon;
    //   if (icon == 'favicon.png') {
    //     icon = 'favicon-failure.png';
    //   } else {
    //     icon = 'favicon.png';
    //   }
    //   _flutterAppIconsPlugin.setIcon(icon: icon, oldIcon: oldIcon);
    // });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SizedBox(
            width: 140,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: Column(
                children: [
                  Text('Change favicon here:'),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          _flutterAppIconsPlugin.setIcon(
                            icon: 'favicon-failure.png',
                            oldIcon: 'favicon.png',
                          );
                        },
                        child: const Text(
                          'Red',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _flutterAppIconsPlugin.setIcon(
                            icon: 'favicon.png',
                            oldIcon: 'favicon-failure.png',
                          );
                        },
                        child: const Text(
                          'Blue',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
