import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/helper/constant/widget/text_widget.dart';
import 'package:videoplayer_app/screens/videos/components/videoPlay.dart';

class VideoTile extends StatelessWidget {
  final Medium? video;
  const VideoTile({required this.video, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = Duration(milliseconds: video!.duration);
    File? videoPath;

    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      onTap: () {
        Navigator.pushNamed(context, '/play', arguments: videoPath);
      },
      tileColor: AppColor.secondaryAppColor,
      leading: Container(
        width: 100.0,
        child: Stack(
          children: [
            Container(
              width: 100.0,
              color: AppColor.thumbnailDefaultColor,
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: ThumbnailProvider(
                  mediumId: video!.id,
                  mediumType: video!.mediumType,
                  highQuality: true,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.play_arrow,
                color: AppColor.primaryIconColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 39.0,
                height: 18.0,
                alignment: Alignment.center,
                child: SingleLineText(
                  title: duration.toString().split('.').first,
                  isThumbnail: true,
                ),
                decoration: BoxDecoration(color: AppColor.blackColor),
              ),
            )
          ],
        ),
      ),
      title: FutureBuilder<File>(
        future: video!.getFile(),
        builder: (context, videoFile) {
          if (videoFile.hasData) {
            // getting video name
            videoPath = videoFile.data;
            return SingleLineText(
              // title: videoPath.path.split('/').last,
              title: videoPath!.path.split('/').last,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      subtitle: SingleLineText(
        title: video!.width.toString() + "x" + video!.height.toString(),
        isTitle: false,
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.more_vert,
          color: AppColor.primaryIconColor,
        ),
      ),
    );
  }
}
