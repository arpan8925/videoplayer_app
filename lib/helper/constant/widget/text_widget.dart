import 'package:flutter/cupertino.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';

//signgle line text

class SingleLineText extends StatelessWidget {
  final String? title;
  final bool isTitle;
  final bool isThumbnail;
  final double fontSize;
  const SingleLineText(
      {required this.title,
      this.isTitle = true,
      this.isThumbnail = false,
      this.fontSize = 17,
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
                ? fontSize
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


//multiline line text

class MultiLineText extends StatelessWidget {
  final String? title;
  const MultiLineText(
      {required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      style: TextStyle(
        color: AppColor.primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}


// button text

class ButtonText extends StatelessWidget {
  final String buttonName;
  const ButtonText({required this.buttonName, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonName,
      style: TextStyle(
        color: AppColor.buttonTextColor,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

