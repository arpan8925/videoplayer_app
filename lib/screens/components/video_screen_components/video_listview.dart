import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/screens/components/video_screen_components/video_tile.dart';

class VideoListView extends StatelessWidget {
  final List<Medium>? videos;
  const VideoListView({required this.videos, Key? key}) : super(key: key);

  // passing video to list tile
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: videos!.length,
      itemBuilder: (context, index) => Center(
        child: VideoTile(
          video: videos![index],
        ),
      ),
      separatorBuilder: (context, index) {
        return Divider(
          color: AppColor.primaryColor,
        );
      },
    );
  }
}
