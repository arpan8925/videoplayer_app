import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/screens/components/app_bar.dart';
import 'package:videoplayer_app/screens/videos/components/video_listview.dart';
import 'package:videoplayer_app/screens/loading/loading_screen.dart';

class VideoFileScreen extends StatelessWidget {
  // this album variable will have the info of tapped folder
  final Album album;
  const VideoFileScreen({required this.album, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("video screen");
    return Scaffold(
      appBar: AllAppBar.secondaryAppBar(context, album.name),
      body: FutureBuilder<MediaPage>(
        // here extructs the containt into tapped folder
        // and pass that info to VideoListView
        future: album.listMedia(),
        builder: (context, media) {
          if (media.hasData) {
            return VideoListView(videos: media.data!.items);
          } else {
            return LoadingScreen();
          }
        },
      ),
    );
  }
}
