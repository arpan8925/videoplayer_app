import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer_app/providers/albums_provider.dart';
import 'package:videoplayer_app/screens/directories/components/album_listview.dart';
import 'package:videoplayer_app/screens/loading/loading_screen.dart';

class DirectoriesScreen extends StatelessWidget {
  const DirectoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumsProvider>(
      builder: (context, albumProvider, child) {
        
        if (albumProvider.getAlbums!.isEmpty) {
          return LoadingScreen();
        } else {
          return AlbumListView(albums: albumProvider.getAlbums);
        }
      },
    );
  }
}