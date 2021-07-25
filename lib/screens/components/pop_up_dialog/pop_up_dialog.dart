import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/config/permission_settings.dart';
import 'package:videoplayer_app/helper/common_methods/common_methods.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/helper/constant/widget/text_widget.dart';
import 'package:videoplayer_app/screens/components/popup_menu/components/pop_menu_item.dart';

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

  // rename dialog
  static void renameFileDialog(
      BuildContext context, Medium videoFile, MenuItem item) async {
    var file = await videoFile.getFile();
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = file.path.toString().split('/').last;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: SingleLineText(
          title: item.name,
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  style: TextStyle(
                    color: AppColor.primaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: ButtonText(buttonName: "Cancel"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () async {
                        if (await PermissionSettings.getManagePermission()) {
                          CommonMethods.renameFile(
                              file, textEditingController.text);

                          textEditingController.clear();

                          // print(textEditingController.text);
                        } else {
                          print("Permission faild");
                        }
                        Navigator.pop(context);
                      },
                      child: ButtonText(buttonName: "OK"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // delete dialog
  static void deleteFileDialog(
      BuildContext context, Medium videoFile, MenuItem item) async {
    File file = await videoFile.getFile();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: SingleLineText(title: item.name),
        content: MultiLineText(
          title: "Do you want to delete this file?",
        ),
        contentPadding: EdgeInsets.all(20),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: ButtonText(buttonName: "Cancel"),
          ),
          TextButton(
            onPressed: () async {
              if (await PermissionSettings.getManagePermission()) {
                CommonMethods.deleteFileDialog(file);
              }

              Navigator.pushNamed(context, '/home');
            },
            child: ButtonText(buttonName: "OK"),
          ),
        ],
      ),
    );
  }
}
