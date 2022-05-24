# flutter_app_icons

Dynamic App Icon, with flutter. You can use this plugin to change your favicon programatically from your flutter code.
You can also use it to change your Android application icon during runtime.

## Web Version

Web version is pretty simple, just create FlutterAppIcons object.

```dart
final _flutterAppIconsPlugin = FlutterAppIcons();
```

Then wherever you want to change favicon, call the function

```dart
_flutterAppIconsPlugin.setIcon(icon: 'favicon.png');
```

## Android version

Android is a bit more complicated here are the steps:

### Step 1: 

Update AndroidManifest.xml main activity:

```
<category android:name="android.intent.category.LEANBACK_LAUNCHER"/> <!-- remove LAUNCHER, make it LEANBACK_LAUNCHER -->
```

### Step 2: 

Add activity-alias for the icons you want to use:

Notice, that favicon-failure.png was replaced by favicon.failure.png, because this should be a correct 
java class name, you just have to worry about this in the AndroidManifest.xml


```
    <activity-alias android:label="flutter_app_icons_example"
           android:icon="@mipmap/ic_launcher_f_round"
           android:name=".favicon.png"
           android:exported="true"
           android:enabled="false"
           android:targetActivity=".MainActivity">
           <intent-filter>
               <action android:name="android.intent.action.MAIN" />
               <category android:name="android.intent.category.LAUNCHER" />
           </intent-filter>
       </activity-alias>
       <activity-alias android:label="flutter_app_icons_example"
           android:icon="@mipmap/ic_launcher"
           android:name=".favicon.failure.png"
           android:exported="true"
           android:enabled="true"
           android:targetActivity=".MainActivity">
           <intent-filter>
               <action android:name="android.intent.action.MAIN" />
               <category android:name="android.intent.category.LAUNCHER" />
           </intent-filter>
       </activity-alias>
```

### Step 3: 

Now like the web version, you create a FlutterAppIcons object.

```dart
final _flutterAppIconsPlugin = FlutterAppIcons();
```

Then wherever you want to change your android application icon, call the function, with 1 difference,
you have to tell the function which one was activated as follows

```dart
_flutterAppIconsPlugin.setIcon(icon: 'favicon.png', oldIcon: 'favicon-failure.png');
```

### Step 4:

Now this is the most complicated, Flutter doesn't see activity-alias, and since we remove LAUNCHER
from the main activity, flutter won't accept running your code. What you have to do is open 
android/src/main/(java OR kotlin)/your_package_name/ClassName. Once you open this in your android studio,
you will see a notification at the top "Open for Editing In Android Studio", click it and then from there
run / publish  do whatever you want with your app.

I am still in the process of finding a workaround for this, but for the time being I didn't find it.
