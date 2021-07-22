import 'package:flutter/material.dart';
import 'package:videoplayer_app/helper/constant/theme/theme.dart';
import 'package:videoplayer_app/routes/route_generator.dart';

// this class will define which screen to route

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Player',
      theme: appTheme,
      // this is initial page of app. which is splash screen
      initialRoute: '/',
      // this is for named route
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}
