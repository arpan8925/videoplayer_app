import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/screens/components/pop_up_dialog/pop_up_dialog.dart';

// menu item
class MenuItem {
  IconData? icon;
  String? name;

  MenuItem({
    required this.icon,
    required this.name,
  });
}

// list of menu items
class MenuItems {
  static MenuItem detailsMenu = MenuItem(icon: Icons.info, name: "Details");

  static List<MenuItem> allMenuItems = [
    detailsMenu,
  ];

  static void onSelected(
      BuildContext context, MenuItem item, Medium videoFile) async {
    if (item == MenuItems.detailsMenu) {
      var file = await videoFile.getFile();

      Map<String, dynamic> videoDetails = {
        'title': file.path.split('/').last,
        'duration': Duration(milliseconds: videoFile.duration)
            .toString()
            .split('.')
            .first,
        'path': file.path,
        'menuItem': item,
      };

      PopUpDialog.detailsDialog(context, videoDetails);
    }
  }
}
