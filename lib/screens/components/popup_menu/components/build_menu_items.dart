import 'package:flutter/material.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/helper/constant/widget/text_widget.dart';
import 'package:videoplayer_app/screens/components/popup_menu/components/pop_menu_item.dart';

class BuildMenuItems {
  // pop up menu design
  
  static PopupMenuItem<MenuItem> buildItem(MenuItem item) {
    return PopupMenuItem(
      value: item,
      child: Container(
        child: Row(
          children: [
            Icon(
              item.icon,
              color: AppColor.secondaryIconColor,
            ),
            SizedBox(
              width: 10,
            ),
            SingleLineText(
              title: item.name,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }

  
}
