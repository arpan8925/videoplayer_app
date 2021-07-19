import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:videoplayer_app/constant/theme/theme.dart';
import 'package:videoplayer_app/screen/splash/Splash_Screen.dart';

void main() {
  runApp(MyApp());

  //always portrait mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player',
      theme: appTheme,
      home: SplashScreen(),
    );
  }
}
