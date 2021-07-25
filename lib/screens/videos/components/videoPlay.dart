import 'dart:io';
import 'package:flutter/material.dart';

import 'package:better_player/better_player.dart';

class PlayVideo extends StatelessWidget {
  final File path;
  const PlayVideo({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.file(
          path.path,
          betterPlayerConfiguration: BetterPlayerConfiguration(
              fullScreenByDefault: true,
              looping: true,
              aspectRatio: 16 / 9,
              autoPlay: true,
              fit: BoxFit.contain),
        ));
  }
}
