import 'package:flutter/material.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColor.primaryAppColor,
  buttonColor: AppColor.highLightColor,
  indicatorColor: AppColor.highLightColor,
  splashColor: AppColor.subTitleColor,
  scaffoldBackgroundColor: AppColor.secondaryAppColor,
  appBarTheme: appBarTheme,
  popupMenuTheme: popupMenuThemeData,
  dialogTheme: dialogTheme,
  brightness: Brightness.light,
);

AppBarTheme appBarTheme = AppBarTheme(
  titleTextStyle: TextStyle(
    color: Colors.green,
  ),
);

PopupMenuThemeData popupMenuThemeData = PopupMenuThemeData(
  color: AppColor.primaryAppColor,
);

DialogTheme dialogTheme = DialogTheme(
  backgroundColor: AppColor.primaryAppColor,
);
