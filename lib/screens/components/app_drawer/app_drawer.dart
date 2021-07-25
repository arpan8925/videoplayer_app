import 'package:flutter/material.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/helper/constant/default_size.dart';
import 'package:videoplayer_app/helper/constant/widget/text_widget.dart';
import 'package:videoplayer_app/screens/components/app_drawer/comonents/drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: DefaultSize.getWidth(context),
        height: DefaultSize.getHeight(context),
        decoration: BoxDecoration(
          color: AppColor.primaryAppColor,
        ),
        child: Column(
          children: [
            Material(
              color: AppColor.primaryAppColor,
              elevation: 10.0,
              // header section
              child: DrawerHeader(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Image.asset("assets/images/01.png"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleLineText(title: "Video Player"),
                  ],
                ),
              ),
            ),
            // list of buttons 
            Expanded(
              child: Material(
                color: AppColor.secondaryAppColor,
                child: ListView(
                  children: [
                    DrawerTile(
                        icon: Icons.video_library_outlined, title: "Video"),
                    SizedBox(
                      height: 5,
                    ),
                    DrawerTile(icon: Icons.info_outline, title: "About"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
