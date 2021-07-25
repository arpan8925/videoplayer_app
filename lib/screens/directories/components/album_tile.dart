import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';
import 'package:videoplayer_app/helper/constant/widget/text_widget.dart';

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
      title: SingleLineText(
        title: album.name,
        isTitle: true,
      ),
      subtitle: SingleLineText(
        title: album.count.toString() + " videos",
        isTitle: false,
      ),
    );
  }
}
