import 'package:flutter/material.dart';
import 'package:videoplayer_app/helper/constant/widget/text_widget.dart';

class PopUpDialog {
  // details dialog
  static void detailsDialog(BuildContext context, videoFile) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: SingleLineText(title: videoFile['menuItem'].name),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MultiLineText(title: "Title: " + videoFile['title']),
              SizedBox(
                height: 5,
              ),
              MultiLineText(title: "Duration: " + videoFile['duration']),
              SizedBox(
                height: 5,
              ),
              MultiLineText(title: "Path: " + videoFile['path']),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: ButtonText(buttonName: "OK"),
          ),
        ],
      ),
    );
  }

 }
