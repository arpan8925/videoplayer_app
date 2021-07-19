import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';

class VideoTile extends StatelessWidget {
  final Medium? video;
  const VideoTile({required this.video, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      onTap: () {
        print(video!.width);
      },
      // video thumbnail
      leading: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        color: AppColor.thumbnailDefaultColor,
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: MemoryImage(kTransparentImage),
          image: ThumbnailProvider(
            mediumId: video!.id,
            mediumType: video!.mediumType,
            highQuality: false,
          ),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<File>(
            future: video!.getFile(),
            builder: (context, videoFile) {
              if (videoFile.hasData) {
                // getting video name
                String videoName = videoFile.data!.path.split('/').last;
                return Text(
                  videoName,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColor.primaryTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "${video!.width}x${video!.height}",
              style: TextStyle(
                fontSize: 14,
                color: AppColor.secondaryTextColor,
              ),
            ),
          ),
        ],
      ),
      // options
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
