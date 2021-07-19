import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/screens/directories/components/widgets/album_tile.dart';

class AlbumListView extends StatelessWidget {
  final List<Album>? albums;

  const AlbumListView({required this.albums, Key? key}) : super(key: key);
  // listing all folder
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums!.length,
      itemBuilder: (context, index) {
        return AlbumTile(album: albums![index], icon: Icons.folder);
      },
    );
  }
}
