import 'package:flutter/material.dart';

// AppColor class will contain all the colors that app used
class AppColor {
  static MaterialColor? primaryColor = Colors.purple;
  static MaterialColor? secondaryColor = Colors.deepPurple;

  // app color
  static Color? primaryAppColor = Colors.purple.shade900;
  static Color? secondaryAppColor = Colors.purpleAccent[400];

  static Color? unselectLabelColor = Colors.white;

  // text color
  static Color? primaryTextColor = Colors.white;
  static Color? secondaryTextColor = Colors.purpleAccent[400];

  // icon color
  static Color? primaryIconColor = Colors.white;

  // thumbnail default color
  static Color? thumbnailDefaultColor = Colors.grey[300];
}
