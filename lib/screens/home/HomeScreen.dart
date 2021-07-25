// this is final
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer_app/config/ads_service.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/providers/albums_provider.dart';
import 'package:videoplayer_app/screens/components/app_drawer/app_drawer.dart';
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
        drawer: AppDrawer(),
        bottomNavigationBar: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColor.primaryTextColor,
          ),
          // padding: EdgeInsets.all(8.0),
          child: AdWidget(
              key: UniqueKey(), ad: AdManager.createBannerAd()..load()),
        ),
      ),
    );
  }
}
