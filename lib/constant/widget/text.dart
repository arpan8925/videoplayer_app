import 'package:flutter/cupertino.dart';

//signgle line text
Widget sText(String title, Color color, double size, FontWeight fontWeight) {
  return Text(title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ));
}

//limit line text
Widget lText(
    String title, Color color, double size, FontWeight fontWeight, int line) {
  return Text(title,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ));
}

//multiline line text
Widget mText(String title, Color color, double size, FontWeight fontWeight) {
  return Text(title,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ));
}
