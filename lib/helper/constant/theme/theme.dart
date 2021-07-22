import 'package:flutter/material.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColor.primaryAppColor,
  buttonColor: AppColor.highLightColor,
  indicatorColor: AppColor.highLightColor,
  splashColor: AppColor.subTitleColor,
  scaffoldBackgroundColor: AppColor.secondaryAppColor,
  appBarTheme: appBarTheme,
  brightness: Brightness.light,
);

AppBarTheme appBarTheme = AppBarTheme(
  titleTextStyle: TextStyle(
    color: Colors.green,
  ),
);
