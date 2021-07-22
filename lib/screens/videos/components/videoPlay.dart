import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:videoplayer_app/helper/constant/color/app_color.dart';

class PlayVideo extends StatelessWidget {
  final File videoPath;
  const PlayVideo({required this.videoPath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("video path: " + videoPath.toString());
    return VideoPlaySceen(
        videoPlayController: VideoPlayerController.file(videoPath));
  }
}

class VideoPlaySceen extends StatefulWidget {
  final VideoPlayerController videoPlayController;
  final bool? loop;
  const VideoPlaySceen({required this.videoPlayController, this.loop, Key? key})
      : super(key: key);

  @override
  _VideoPlaySceenState createState() => _VideoPlaySceenState();
}

class _VideoPlaySceenState extends State<VideoPlaySceen> {
  ChewieController? chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
        videoPlayerController: widget.videoPlayController,
        looping: true,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        autoPlay: true,
        allowFullScreen: true,
        allowMuting: true,
        allowPlaybackSpeedChanging: true,
        showControls: true,
        showControlsOnInitialize: true,
        //fullScreenByDefault: true,

        showOptions: true,
        systemOverlaysAfterFullScreen: SystemUiOverlay.values);

    super.initState();
  }

  @override
  void dispose() {
    widget.videoPlayController.dispose();
    chewieController!.dispose();
    if (chewieController!.isPlaying) {
      chewieController!.pause();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryAppColor,
      body: Chewie(
        controller: chewieController!,
      ),
    );
  }
}
