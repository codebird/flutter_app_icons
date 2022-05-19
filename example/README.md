# icon_plugin

Dynamic App Icon, currently only favicon for web.

## Getting Started

For the time being this only works to update website favicon from inside flutter.

- Place your favicon(s) inside the web directory of your app.
- From anywhere inside your flutter project, initialize iconPlugin
```dart
final _iconPlugin = IconPlugin();
```
- Call setIcon with the name of the icon you want to use
```dart
_iconPlugin.setIcon('favicon-failure.png');
```