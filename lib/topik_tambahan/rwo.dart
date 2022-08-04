import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';

class RWO extends StatefulWidget {
  const RWO({Key? key}) : super(key: key);

  @override
  _RWOState createState() => _RWOState();
}

class _RWOState extends State<RWO> with SingleTickerProviderStateMixin {
  late AudioPlayer player1;
  late AudioPlayer player2;
  late AudioPlayer player3;
  late AudioPlayer player4;
  late bool active1;
  late bool load1;
  late bool active2;
  late bool active3;
  late bool active4;
  bool selengkapnya = false;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
    player1 = AudioPlayer();
    player2 = AudioPlayer();
    player3 = AudioPlayer();
    player4 = AudioPlayer();
    active1 = false;
    // load1 = false;
    active2 = false;
    active3 = false;
    active4 = false;
  }

  @override
  void dispose() {
    player1.dispose();
    player2.dispose();
    player3.dispose();
    player4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // player1.processingStateStream.listen((event) {
    //   if (event == ProcessingState.loading) {
    //     setState(() {
    //       load1 = true;
    //     });
    //   } else if (event == ProcessingState.completed) {
    //     setState(() {
    //       active1 = false;
    //     });
    //   } else {
    //     setState(() {
    //       load1 = false;
    //     });
    //   }
    // });

    // player1.playerStateStream.listen((playerState) {
    //   final isPlaying = playerState.playing;
    //   final processingState = playerState.processingState;
    //   if (processingState == ProcessingState.loading ||
    //       processingState == ProcessingState.buffering) {
    //     setState(() {
    //       load1 = true;
    //     });

    //     // } else if (processingState != ProcessingState.completed) {
    //     //   print("object");
    //     //   setState(() {
    //     //     load1 = false;
    //     //   });
    //   } else if (isPlaying) {
    //     setState(() {
    //       // player1.stop();
    //       load1 = false;
    //     });
    //   }
    // });

    // player2.playerStateStream.listen((playerState) {
    //   final isPlaying = playerState.playing;
    //   if (isPlaying) {
    //     setState(() {
    //       active2 = true;
    //     });
    //   } else {
    //     setState(() {
    //       active2 = false;
    //     });
    //   }
    // });

    // player3.playerStateStream.listen((playerState) {
    //   final isPlaying = playerState.playing;
    //   if (isPlaying) {
    //     setState(() {
    //       active3 = true;
    //     });
    //   } else {
    //     setState(() {
    //       active3 = false;
    //     });
    //   }
    // });

    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                    child: Container(
                      color: Colors.amber[600],
                      height: size.height / 3,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/vector1.png",
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLUrU8SWV-7oanktalrimUMCUVxeVw3ugX4-ivEMdGtzfEvvlgmRRAlRXPBvkjaUEwg3TSsK0u1g7scr0ZzSEg9ud-omweU9QmwwtoacZCBl-_z4esaGIItFMAifQCqOtcIu1DYEXokeCkKWc3aern8i=s947-no",
                      fit: BoxFit.contain,
                      height: size.height / 3,
                    ),
                    // Image.asset(
                    //   "assets/rwo.png",
                    //   fit: BoxFit.contain,
                    //   height: size.height / 3,
                    // ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
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
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: size.width - 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hubungan dengan Orang Lain",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Gimana sih sebenarnya hubungan dengan orang lain itu?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Kalimat “Manusia adalah makhluk sosial” sudah bukan menjadi hal yang asing lagi, bukan? Maksud dari kalimat itu adalah Manusia itu selalu membutuhkan orang lain dalam menjalankan kehidupan, hal sederhana contohnya seperti saat mengerjakan sebuah projek, mungkin bisa saja dilakukan sendirian atau yang lebih sering dikenal dengan “full-stack”. Tapi kalau dikerjakan bareng-bareng, pasti akan terasa lebih ringan, kan?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        // fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    (selengkapnya)
                        ? SizedBox()
                        : Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 40,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.25)),
                              child: IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                onPressed: () {
                                  setState(() {
                                    selengkapnya = true;
                                  });
                                },
                              ),
                            ),
                          ),
                    (selengkapnya)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Tak peduli apakah Kamu ingin menjalin hubungan dengan orang lain secara sosial, membuat kesan pertama yang baik, dll. Namun, jika Kamu fokus menunjukkan bahwa Kamu benar-benar memedulikan lawan bicara Anda, membuat pembicaraan yang berarti, atau berusaha membuat orang lain merasa nyaman, Kamu akan mampu menjalin hubungan dengan siapa pun tanpa halangan.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Menurut Carol D. Ryff (Professor of Psychology), semakin besar kemampuan individu dalam membina hubungan interpersonal, maka hal ini menunjukan bahwa individu tersebut memiliki perhatian terhadap kesejahteraan orang lain, mampu berempati, menyayangi, memahami konsep memberi dan menerima dalam membangun sebuah hubungan\u00B9.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Ciri-ciri seseorang memiliki hubungan dengan orang lain yang baik adalah\u00B2:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "1.	Saling percaya\n2.	Saling terbuka\n3.	Saling menghargai\n4.	Selalu memberi dukungan\n5.	Mampu menciptakan momen yang menyenangkan.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Daftar Pustaka: \n",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Baloo Da",
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "1.	Ismawati, E. (2013). ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Pengajaran Sastra",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " .Yogyakarta: Ombak",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "\n2.	Halodokter. (2020). Ini loh ciri-ciri hubungan yang sehat. Diakses 31 Agustus 2021. https://www.alodokter.com/ini-lho-ciri-ciri-hubungan-yang-sehat",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              (selengkapnya)
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 40,
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.25)),
                                        child: IconButton(
                                          icon: Icon(Icons.arrow_drop_up),
                                          iconSize: 24,
                                          onPressed: () {
                                            setState(() {
                                              selengkapnya = false;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    TabBar(
                      controller: controller,
                      indicatorColor: Colors.purple,
                      labelColor: Colors.purple,
                      unselectedLabelColor: Colors.grey,
                      tabs: <Widget>[
                        new Tab(
                          text: "Ayat-ayat Pilihan",
                        ),
                        new Tab(
                          text: "Meditasi",
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: TabBarView(
                        children: <Widget>[
                          Column(
                            children: [
                              ListTile(
                                leading:
                                    // ? Container(
                                    //     width: 40,
                                    //     child: Align(
                                    //       alignment: Alignment.center,
                                    //       child: SpinKitFadingCircle(
                                    //         color: Colors.purple,
                                    //         size: 40,
                                    //       ),
                                    //     ),
                                    //   )
                                    IconButton(
                                  icon: Icon(
                                    (active1) ? Icons.pause_circle_filled : Icons.play_circle_outlined,
                                    size: 40,
                                    color: Colors.purple[300],
                                  ),
                                  onPressed: () async {
                                    await player1.setAsset('assets/audio/Al Hujurat ayat 13.mp3');
                                    // player1.setUrl(
                                    //     "https://drive.google.com/uc?export=download&id=12GyuVSGVYy8GWNmlJbfsJo0Sc87LRydI");
                                    player3.stop();
                                    player2.stop();
                                    player4.stop();
                                    if (active1) {
                                      setState(() {
                                        active1 = false;
                                      });
                                    } else {
                                      setState(() {
                                        active1 = true;
                                        active2 = false;
                                        active3 = false;
                                        active4 = false;
                                      });
                                    }
                                    if (active1) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                              elevation: 16,
                                              child: Container(
                                                padding: EdgeInsets.all(20),
                                                child: Text(
                                                  "\"Wahai manusia! Sungguh, Kami telah menciptakan kamu dari seorang laki-laki dan seorang perempuan, kemudian Kami jadikan kamu berbangsa-bangsa dan bersuku-suku agar kamu saling mengenal. Sesungguhnya yang paling mulia di antara kamu di sisi Allah ialah orang yang paling bertakwa. Sungguh, Allah Maha Mengetahui, Mahateliti.\"",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Baloo Da",
                                                    fontStyle: FontStyle.italic,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                      player1.play();
                                    } else {
                                      player1.stop();
                                    }
                                  },
                                ),
                                title: Text(
                                  "Al Hujurat ayat 13",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Baloo Da",
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 0.25,
                                color: Colors.grey,
                              ),
                              ListTile(
                                leading: IconButton(
                                    icon: Icon(
                                      (active2) ? Icons.pause_circle_filled : Icons.play_circle_outlined,
                                      size: 40,
                                      color: Colors.purple[300],
                                    ),
                                    onPressed: () async {
                                      await player2.setAsset('assets/audio/Al-Baqarah ayat 26.mp3');
                                      player1.stop();
                                      player3.stop();
                                      player4.stop();
                                      if (active2) {
                                        setState(() {
                                          active2 = false;
                                        });
                                      } else {
                                        setState(() {
                                          active2 = true;
                                          active1 = false;
                                          active3 = false;
                                          active4 = false;
                                        });
                                      }
                                      if (active2) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                                elevation: 16,
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  child: Text(
                                                    "\"Sesungguhnya Allah tidak segan membuat perumpamaan seekor nyamuk atau yang lebih kecil dari itu. Adapun orang-orang yang beriman, mereka tahu bahwa itu kebenaran dari Tuhan. Tetapi mereka yang kafir berkata, “Apa maksud Allah dengan perumpamaan ini?” Dengan (perumpamaan) itu banyak orang yang dibiarkan-Nya sesat, dan dengan itu banyak (pula) orang yang diberi-Nya petunjuk. Tetapi tidak ada yang Dia sesatkan dengan (perumpamaan) itu selain orang-orang fasik.\"",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Baloo Da",
                                                      fontStyle: FontStyle.italic,
                                                      // fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                        player2.play();
                                      } else {
                                        player2.stop();
                                      }
                                    }),
                                title: Text(
                                  "Al-Baqarah ayat 26",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Baloo Da",
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 0.25,
                                color: Colors.grey,
                              ),
                              ListTile(
                                leading: IconButton(
                                  icon: Icon(
                                    (active3) ? Icons.pause_circle_filled : Icons.play_circle_outlined,
                                    size: 40,
                                    color: Colors.purple[300],
                                  ),
                                  onPressed: () async {
                                    await player3.setAsset('assets/audio/Al-Hasyr ayat 9.mp3');
                                    player1.stop();
                                    player2.stop();
                                    player4.stop();
                                    if (active3) {
                                      setState(() {
                                        active3 = false;
                                      });
                                    } else {
                                      setState(() {
                                        active3 = true;
                                        active1 = false;
                                        active2 = false;
                                        active4 = false;
                                      });
                                    }
                                    if (active3) {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                              elevation: 16,
                                              child: Container(
                                                padding: EdgeInsets.all(20),
                                                child: Text(
                                                  "\"Dan orang-orang (Ansar) yang telah menempati kota Madinah dan telah beriman sebelum (kedatangan) mereka (Muhajirin), mereka mencintai orang yang berhijrah ke tempat mereka. Dan mereka tidak menaruh keinginan dalam hati mereka terhadap apa yang diberikan kepada mereka (Muhajirin); dan mereka mengutamakan (Muhajirin), atas dirinya sendiri, meskipun mereka juga memerlukan. Dan siapa yang dijaga dirinya dari kekikiran, maka mereka itulah orang-orang yang beruntung.\"",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Baloo Da",
                                                    fontStyle: FontStyle.italic,
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                      player3.play();
                                    } else {
                                      player3.stop();
                                    }
                                  },
                                ),
                                title: Text(
                                  "Al-Hasyr ayat 9",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Baloo Da",
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                            leading: IconButton(
                              icon: Icon(
                                (active4) ? Icons.pause_circle_filled : Icons.play_circle_outlined,
                                size: 40,
                                color: Colors.purple[300],
                              ),
                              onPressed: () async {
                                await player4.setAsset('assets/audio/rwo.m4a');
                                player1.stop();
                                player2.stop();
                                player3.stop();
                                if (active4) {
                                  setState(() {
                                    active4 = false;
                                  });
                                } else {
                                  setState(() {
                                    active4 = true;
                                    active1 = false;
                                    active2 = false;
                                    active3 = false;
                                  });
                                }
                                (active4) ? player4.play() : player4.stop();
                              },
                            ),
                            title: Text(
                              "Sesi 1",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Baloo Da",
                                // fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                        controller: controller,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Quotes",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            pauseAutoPlayOnTouch: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.8,
                            onPageChanged: (index, reason) {}),
                        items: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber,
                            ),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.6,
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "\"Sesama muslim seharusnya hidup seperti layaknya saudara.\"\n\n- Abu Bakar As-Shidiq",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue,
                            ),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.6,
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "\"Duduklah bersama orang-orang yang mencintai Allah, karena bergaul bersama orang seperti mereka akan mencerahkan pikiran.\"\n\n- Umar bin Khattab",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.6,
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "\"Jangan membenci siapapun, tidak peduli berapa banyak mereka bersalah padamu.\"\n\n- Ali bin Abi Thalib",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ItemCard extends StatelessWidget {
//   final String title;

//   const ItemCard({Key key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.8,
//       height: MediaQuery.of(context).size.height * 0.6,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color:
//             Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 2),
//         ],
//       ),
//       child: Center(
//         child: Text(title),
//       ),
//     );
//   }
// }
