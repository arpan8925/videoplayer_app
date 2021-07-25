import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/screens/components/popup_menu/components/build_menu_items.dart';
import 'package:videoplayer_app/screens/components/popup_menu/components/pop_menu_item.dart';

class MainPopUpMenu extends StatelessWidget {
  // video info from list
  final Medium? video;
  const MainPopUpMenu({required this.video, Key? key}) : super(key: key);
  // pop up menu
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItem>(
      icon: Icon(
        Icons.more_vert,
        color: AppColor.primaryIconColor,
      ),
      itemBuilder: (context) =>
          MenuItems.allMenuItems.map(BuildMenuItems.buildItem).toList(),
      onSelected: (item) {
        MenuItems.onSelected(context, item, video!);
      },
    );
  }
}
