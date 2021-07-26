import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/screens/home/HomeScreen.dart';
import 'package:videoplayer_app/screens/splash_screen/Splash_Screen.dart';
import 'package:videoplayer_app/screens/errors/error_screen.dart';
import 'package:videoplayer_app/screens/loading/loading_screen.dart';
import 'package:videoplayer_app/screens/videos/components/videoPlay.dart';
import 'package:videoplayer_app/screens/videos/video_file_screen.dart';

class RouteGenerator {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // this is for splash screen
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      // this is for home screen
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // this is for loading screen
      case '/loading':
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      // this is for videos screen
      case '/videos':
        if (args is Album) {
          return MaterialPageRoute(
              builder: (_) => VideoFileScreen(
                    album: args,
                  ));
        } else {
          // this is for error screen
          return MaterialPageRoute(builder: (_) => ErrorScreen());
        }
      // play video screen
      case '/play':
        if (args is File) {
          return MaterialPageRoute(builder: (_) => PlayVideo(videoPath: args));
        } else {
          // this is for error screen
          return MaterialPageRoute(builder: (_) => ErrorScreen());
        }

      default:
        // this is for error screen
        return MaterialPageRoute(builder: (_) => ErrorScreen());
    }
  }
}
