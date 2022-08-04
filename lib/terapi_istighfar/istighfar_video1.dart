import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nafs/terapi_istighfar/video_items.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class IstighfarVideo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'lBOF9GKQt1A',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        forceHD: true,
        hideThumbnail: true,
        // hideControls: false,
      ),
    );
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          // DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: Material(
        child: YoutubePlayer(
          actionsPadding: EdgeInsets.all(0),
          controller: _controller,
          showVideoProgressIndicator: true,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
