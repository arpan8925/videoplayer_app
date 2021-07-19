import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        backgroundColor: Colors.purple.shade900,
        appBar: AppBar(
          backgroundColor: Colors.purple.shade900,
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
            indicatorColor: Colors.purple,
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
            Center(
                child: Text(
              'All Videos',
              style: TextStyle(color: Colors.white),
            )),
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
        ),
      ),
    );
  }
}
