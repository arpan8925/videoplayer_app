import 'package:flutter/material.dart';
import 'package:videoplayer_app/constant/color/color.dart';
import 'package:videoplayer_app/screen/video/video.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text('Video'),
          elevation: 15.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          leading: Icon(Icons.menu_open),
          shadowColor: Colors.purple.shade900,
          actions: [
            IconButton(
                onPressed: () {
                  print("Searching Video");
                },
                icon: Icon(Icons.search))
          ],
          bottom: TabBar(
            indicatorColor: highLightColor,
            labelColor: Colors.purpleAccent[400],
            unselectedLabelColor: Colors.white,
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  'Video',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Folder',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'History',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            VideoScreen(),
            // Center(
            //     child: Text(
            //   'All Videos',
            //   style: TextStyle(color: Colors.white),
            // )),
            Center(
                child: Text(
              'All Folders',
              style: TextStyle(color: Colors.white),
            )),
            Center(
                child: Text(
              'All History',
              style: TextStyle(color: Colors.white),
            ))
          ],
        ));
  }
}
