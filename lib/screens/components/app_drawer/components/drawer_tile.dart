import 'package:flutter/material.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/helper/constant/widget/text_widget.dart';
import 'package:videoplayer_app/screens/components/app_drawer/components/about_dialog.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const DrawerTile({required this.icon, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      onTap: () {
        switch (title) {
          case "Video":
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case "About":
            DrawerDialog.aboutDialog(context);
            break;
        }
      },
      leading: Icon(
        icon,
        color: AppColor.secondaryIconColor,
        size: 30,
      ),
      title: SingleLineText(
        title: title,
        fontSize: 14,
      ),
    );
  }
}
