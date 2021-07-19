import 'package:flutter/material.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/screens/directories/directories_screen.dart';
import 'package:videoplayer_app/screens/home/components/tab_bar_text.dart';
import 'package:videoplayer_app/screens/videos/video.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryAppColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryAppColor,
        title: Text('Video'),
        elevation: 15.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        leading: Icon(Icons.menu_open),
        shadowColor: AppColor.primaryAppColor,
        actions: [
          IconButton(
              onPressed: () {
                print("Searching Video");
              },
              icon: Icon(Icons.search))
        ],
        bottom: TabBar(
          indicatorColor: AppColor.primaryColor,
          labelColor: AppColor.secondaryAppColor,
          unselectedLabelColor: AppColor.unselectLabelColor,
          controller: _tabController,
          tabs: [
            Tab(
              child: TabBarText(text: 'Video'),
            ),
            Tab(
              child: TabBarText(text: 'Folder'),
            ),
            Tab(child: TabBarText(text: 'History')),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Container(
          //   child: Text(
          //     'All Videos Goes Here',
          //     style: TextStyle(color: AppColor.primaryTextColor),
          //   ),
          // ),
          VideoScreen(),
          // all folders panel here
          DirectoriesScreen(),

          Center(
            child: Text(
              'All History Goes Here',
              style: TextStyle(color: AppColor.primaryTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
