import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  VideoItems({
    required this.videoPlayerController,
    required this.looping,
    required this.autoplay,
  });

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      // fullScreenByDefault: true,

      allowMuting: true,
      allowPlaybackSpeedChanging: false,
      // showControls: false,
      allowFullScreen: true,
      showOptions: false,
      autoInitialize: true,
      

      showControlsOnInitialize: false,
      autoPlay: widget.autoplay,
      // looping: widget.looping,

      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}
