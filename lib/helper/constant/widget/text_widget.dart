import 'package:flutter/cupertino.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';

//signgle line text

class SingleLineText extends StatelessWidget {
  final String? title;
  final bool isTitle;
  final bool isThumbnail;
  const SingleLineText(
      {required this.title,
      this.isTitle = true,
      this.isThumbnail = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: isThumbnail
            ? AppColor.primaryTextColor
            : isTitle
                ? AppColor.primaryTextColor
                : AppColor.subTitleColor,
        fontSize: isThumbnail
            ? 10.0
            : isTitle
                ? 17.0
                : 12.0,
        fontWeight: isThumbnail
            ? FontWeight.normal
            : isTitle
                ? FontWeight.w500
                : FontWeight.normal,
      ),
    );
  }
}

// Widget sText(String title, Color? color, double size, FontWeight fontWeight) {
//   return Text(title,
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//       style: TextStyle(
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight,
//       ));
// }

//limit line text
class LimitLineText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? line;
  const LimitLineText(
      {required this.title,
      required this.color,
      required this.size,
      required this.fontWeight,
      required this.line,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      maxLines: line,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

// Widget lText(
//     String title, Color color, double size, FontWeight fontWeight, int line) {
//   return Text(title,
//       maxLines: line,
//       overflow: TextOverflow.ellipsis,
//       style: TextStyle(
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight,
//       ));
// }

//multiline line text

class MultiLineText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  const MultiLineText(
      {required this.title,
      required this.color,
      required this.size,
      required this.fontWeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}

// Widget mText(String title, Color color, double size, FontWeight fontWeight) {
//   return Text(title,
//       style: TextStyle(
//         color: color,
//         fontSize: size,
//         fontWeight: fontWeight,
//       ));
// }
