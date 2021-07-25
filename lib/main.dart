import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:videoplayer_app/config/ads_service.dart';
import 'package:videoplayer_app/screens/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdManager.initialize();
  // calling wrapper screen. which specify other screens
  runApp(WrapperScreen());

  //  always portrait mood
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
}
