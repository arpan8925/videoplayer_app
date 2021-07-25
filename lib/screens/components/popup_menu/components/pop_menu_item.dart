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
  static MenuItem renameMenu = MenuItem(icon: Icons.edit_road, name: "Rename");
  static MenuItem deleteMenu =
      MenuItem(icon: Icons.delete_outline, name: "Delete");
  static MenuItem sendMenu = MenuItem(icon: Icons.share, name: "Send to...");
  static MenuItem detailsMenu = MenuItem(icon: Icons.info, name: "Details");

  static List<MenuItem> allMenuItems = [
    renameMenu,
    deleteMenu,
    sendMenu,
    detailsMenu,
  ];

  static void onSelected(
      BuildContext context, MenuItem item, Medium videoFile) async {
    if (item == MenuItems.renameMenu) {
      print(videoFile);
      PopUpDialog.renameFileDialog(context, videoFile, item);
    } else if (item == MenuItems.deleteMenu) {
      print(item.name);
      PopUpDialog.deleteFileDialog(context, videoFile, item);
    } else if (item == MenuItems.sendMenu) {
      print(item.name);
    } else if (item == MenuItems.detailsMenu) {
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
