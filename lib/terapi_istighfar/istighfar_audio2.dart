import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:nafs/components/audio_page_manager_istighfar2.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

class IstighfarAudio2 extends StatefulWidget {
  const IstighfarAudio2({Key? key}) : super(key: key);

  @override
  _IstighfarAudio2State createState() => _IstighfarAudio2State();
}

class _IstighfarAudio2State extends State<IstighfarAudio2> {
  late final PageManagerIstighfar2 _pageManager;

  @override
  void initState() {
    super.initState();
    _pageManager = PageManagerIstighfar2();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffFCB887).withOpacity(0.5),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/vector3-2.png",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  // margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Istighfar Untuk Tenang Sesi 2",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height < 800 ? 24 : 28,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(),
                    Column(
                      children: [
                        ValueListenableBuilder<ProgressBarState>(
                          valueListenable: _pageManager.progressNotifier,
                          builder: (_, value, __) {
                            return ProgressBar(
                              progress: value.current,
                              buffered: value.buffered,
                              total: value.total,
                              progressBarColor: Colors.purple,
                              baseBarColor: Colors.white,
                              bufferedBarColor: Colors.white,
                              thumbColor: Colors.white,
                              // barHeight: 3.0,
                              // thumbRadius: 5.0,
                              // onSeek: _pageManager.seek,
                            );
                          },
                        ),
                        ValueListenableBuilder<ButtonState>(
                          valueListenable: _pageManager.buttonNotifier,
                          builder: (_, value, __) {
                            switch (value) {
                              case ButtonState.loading:
                                return Container(
                                  margin: EdgeInsets.all(8.0),
                                  width: 32.0,
                                  height: 32.0,
                                  child: CircularProgressIndicator(),
                                );
                              case ButtonState.paused:
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.play_arrow),
                                    iconSize: 32.0,
                                    onPressed: _pageManager.play,
                                  ),
                                );
                              case ButtonState.playing:
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.pause),
                                    iconSize: 32.0,
                                    onPressed: _pageManager.pause,
                                  ),
                                );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(child: Lottie.asset("assets/lottie/wave.json", width: 300)),
            ],
          ),
        ),
      ),
    );
  }
}
