import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';

class AlbumTile extends StatelessWidget {
  final IconData icon;
  final Album album;
  const AlbumTile({required this.album, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // navigating to video file screen
        Navigator.pushNamed(context, '/videos', arguments: album);
      },
      leading: Icon(
        this.icon,
        size: 45,
        color: AppColor.primaryIconColor,
      ),
      title: Text(
        this.album.name,
        style: TextStyle(
          fontSize: 16.4,
          color: AppColor.primaryTextColor,
        ),
      ),
      subtitle: Text(
        this.album.count.toString() + " videos",
        style: TextStyle(
          color: AppColor.secondaryTextColor,
        ),
      ),
    );
  }
}
