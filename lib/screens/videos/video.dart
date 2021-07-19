import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/helper/constant/color/color.dart';
import 'package:videoplayer_app/helper/constant/widget/text.dart';
import 'package:videoplayer_app/screens/videos/utils/videolist.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  //initilization
  List<Album>? _albums;
  List<Medium>? _media;
  bool _loading = false;
  Album? newAlbmub;
  String? path;
  var myList = [];
  var playList = [];
  bool _isvAvailable = false;
  File? file;

  @override
  void initState() {
    super.initState();
    print("Open");
    _loading = true;
    initAsync();
  }

  //all operation function
  Future<void> initAsync() async {
    // if (await _promptPermissionSetting()) {
    List<Album> albums =
        await PhotoGallery.listAlbums(mediumType: MediumType.video);
    setState(() {
      _albums = albums;

      for (var i = 0; i < _albums!.length; i++) {
        if (_albums![i].name.toLowerCase() == 'all') {
          setState(() {
            newAlbmub = _albums![i];
            _isvAvailable = true;
            initvidolist(newAlbmub);
          });
        }
      }

      Timer(Duration(milliseconds: 500), () {
        setState(() {
          _loading = false;
        });
      });
    });
    // }
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _loading = false;
      });
    });
  }

  //permission
  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
            await Permission.storage.request().isGranted &&
            await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  //ready to get video
  void initvidolist(album) async {
    MediaPage mediaPage = await album.listMedia();
    setState(() {
      _media = mediaPage.items;

      print(_media!.length);

      for (var i = 0; i < _media!.length; i++) {
        _media?[i].getFile().then((value) {
          setState(() {
            playList.add(value);
            myList.add(value.path);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: secendaryColor,
        body: _loading
            ? Center(
                child: CircularProgressIndicator(
                  color: highLightColor,
                ),
              )
            : _isvAvailable
                ? videolist(_media, myList, playList, size)
                : Center(
                    child:
                        sText("No Videos", whitColor, 15.0, FontWeight.normal),
                  ));
  }
}
