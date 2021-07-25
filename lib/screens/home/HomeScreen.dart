// this is final
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer_app/helper/common_methods/common_methods.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/providers/albums_provider.dart';
import 'package:videoplayer_app/screens/videos/components/video_listview.dart';
import 'package:videoplayer_app/screens/directories/directories_screen.dart';
import 'package:videoplayer_app/screens/home/components/tab_bar_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Build home");
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Video plyer"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: AppColor.primaryTextColor,
            labelColor: Theme.of(context).indicatorColor,
            tabs: [
              Tab(
                child: TabBarText(
                  text: "Videos",
                ),
              ),
              Tab(
                child: TabBarText(
                  text: "Folder",
                ),
              ),
              Tab(
                child: TabBarText(
                  text: "History",
                ),
              ),
            ],
          ),
        ),
        body: Consumer<AlbumsProvider>(
          builder: (context, albumProvider, child) {
            if (CommonMethods.isUpdate == true) {
              albumProvider.initAlbums();
              print("Rename successfull");
              CommonMethods.isUpdate = false;
            }

            return TabBarView(
              children: [
                // all video tab
                VideoListView(videos: albumProvider.getAllVideo),
                // directory tab
                DirectoriesScreen(),
                // history tab
                Center(
                  child: Text(
                    "History",
                    style: TextStyle(
                      color: AppColor.primaryTextColor,
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        // body: TabBarView(
        //   children: [
        //     // all video tab
        //     Consumer<AlbumsProvider>(
        //       builder: (context, albumProvider, child) {
        //         albumProvider.initAlbums();
        //         return VideoListView(videos: albumProvider.getAllVideo);
        //       },
        //     ),

        //     // directory tab
        //     DirectoriesScreen(),
        //     // history tab
        //     Center(
        //       child: Text(
        //         "History",
        //         style: TextStyle(
        //           color: AppColor.primaryTextColor,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        drawer: Drawer(),
      ),
    );
  }
}
