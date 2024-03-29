import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/helper/common_methods/common_methods.dart';
import 'package:videoplayer_app/providers/albums_provider.dart';
import 'package:videoplayer_app/screens/home/HomeScreen.dart';
import 'package:videoplayer_app/screens/loading/loading_screen.dart';

// Tariqul
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // tariqul
    // splash screen will wait for some second for getSplashTime()
    return FutureBuilder<bool>(
      future: CommonMethods.getSplashTime(),
      builder: (context, isOk) {
        if (isOk.data == true) {
          // initializing Albums provider
          return Consumer<AlbumsProvider>(
              builder: (context, albumProvider, child) {
                // making sure for storage permision
                if (albumProvider.getStoragePermission == true) {
                  return HomeScreen();
                } else {
                  return LoadingScreen();
                }
              },
            );
        } else {
          // arnob
          return Scaffold(
            backgroundColor: AppColor.primaryAppColor,
            body: Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/01.png",
                    width: 130.0,
                  ),
                  Image.asset(
                    "assets/images/load.gif",
                    width: 100.0,
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
 