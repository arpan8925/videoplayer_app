

import 'package:flutter/widgets.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/config/permission_settings.dart';

class AlbumsProvider with ChangeNotifier {
  // all albums will store in _albums
  List<Album> _albums = [];
  bool? _isPermit;

  // getting permission from config/permission
  AlbumsProvider() {
    print("Provider initit");
    getPermission();
  }

  void getPermission() async {
    _isPermit = await PermissionSettings.promptPermissionSetting();
    print("Permit: $_isPermit");
    initAlbums();
  }

  // initializing albums 
  void initAlbums() async {
    if (_isPermit == true) {
      _albums = await PhotoGallery.listAlbums(mediumType: MediumType.video);
      notifyListeners();
    }
  }

  // return albums
  List<Album>? get getAlbums => this._albums;

  // return storage permission true or false
  bool? get getStoragePermission => _isPermit;
}
