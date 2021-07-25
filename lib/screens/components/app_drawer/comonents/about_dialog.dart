import 'package:flutter/material.dart';
import 'package:videoplayer_app/helper/constant/widget/text_widget.dart';

class DrawerDialog {
  static aboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: SingleLineText(title: "About"),
        content: SingleLineText(
          title: "Version: 0.0.1",
          fontSize: 14,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: ButtonText(
              buttonName: "OK",
            ),
          ),
        ],
      ),
    );
  }
}
