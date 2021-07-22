import 'package:flutter/widgets.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/config/permission_settings.dart';

class AlbumsProvider with ChangeNotifier {
  // all albums will store in _albums
  List<Album> _albums = [];
  MediaPage? _mediaPage;

  bool? _isPermit;
  List<Medium> _allVideo = [];

  // getting permission from config/permission
  AlbumsProvider() {
    getPermission();
  }

  void getPermission() async {
    _isPermit = await PermissionSettings.promptPermissionSetting();
    initAlbums();
  }

  // initializing albums
  void initAlbums() async {
    if (_isPermit == true) {
      // getting all albums
      _albums = await PhotoGallery.listAlbums(mediumType: MediumType.video);
      _mediaPage = await _albums.first.listMedia();
      // getting all videos
      _allVideo = _mediaPage!.items;
      notifyListeners();
    }
  }

  // return albums
  List<Album>? get getAlbums => this._albums;

  List<Medium> get getAllVideo => this._allVideo;

  // return storage permission true or false
  bool? get getStoragePermission => _isPermit;
}
