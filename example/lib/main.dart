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
  String _icon = 'favicon.png';
  Timer? _autoChange;

  @override
  void initState() {
    super.initState();
  }

  // Periodically changes the icon every 2 seconds.
  void startTimer() {
    // Toggle icon change every 2 seconds, just for testing.
    final Timer timer =
        Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      final String nextIcon = getOldIcon(_icon);
      setIcon(nextIcon);
    });
    setState(() {
      _autoChange = timer;
    });
  }

  // Stops changing the icon every 2 seconds.
  void stopTimer() {
    _autoChange?.cancel();
    setState(() {
      _autoChange = null;
    });
  }

  // Sets the icon with the `_flutterAppIconsPlugin`
  void setIcon(String? nextIcon) {
    if (nextIcon == null) return;
    _flutterAppIconsPlugin.setIcon(
      icon: nextIcon,
      oldIcon: getOldIcon(nextIcon),
    );
    setState(() {
      _icon = nextIcon;
    });
  }

  // Computes the old icon for a given icon.
  String getOldIcon(String icon) {
    if (icon == 'favicon.png') {
      return 'favicon-failure.png';
    }
    return 'favicon.png';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterAppIcons example'),
          surfaceTintColor: Theme.of(context).colorScheme.primary,
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              shrinkWrap: true,
              children: [
                const ListTile(
                  title: Text('Select favicon:'),
                ),
                RadioListTile<String>(
                  value: 'favicon.png',
                  groupValue: _icon,
                  onChanged: _autoChange == null ? setIcon : null,
                  title: const Text(
                    'Blue',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                RadioListTile<String>(
                  value: 'favicon-failure.png',
                  groupValue: _icon,
                  onChanged: _autoChange == null ? setIcon : null,
                  title: const Text(
                    'Red',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const ListTile(
                  title: Text('Automatic mode:'),
                ),
                SwitchListTile(
                  title: const Text('Change every 2 seconds'),
                  value: _autoChange != null,
                  onChanged: (bool value) {
                    if (value) {
                      startTimer();
                    } else {
                      stopTimer();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
