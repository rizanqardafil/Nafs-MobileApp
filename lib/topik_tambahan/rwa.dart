import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RWA extends StatefulWidget {
  const RWA({Key? key}) : super(key: key);

  @override
  _RWAState createState() => _RWAState();
}

class _RWAState extends State<RWA> with SingleTickerProviderStateMixin {
  late AudioPlayer player1;
  late AudioPlayer player2;
  late AudioPlayer player3;
  late AudioPlayer player4;
  late AudioPlayer player5;
  late bool active1;
  late bool active2;
  late bool active3;
  late bool active4;
  late bool active5;
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
    player5 = AudioPlayer();
    active1 = false;
    active2 = false;
    active3 = false;
    active4 = false;
    active5 = false;
  }

  @override
  void dispose() {
    player1.dispose();
    player2.dispose();
    player3.dispose();
    player4.dispose();
    player5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // player1.playerStateStream.listen((playerState) {
    //   final isPlaying = playerState.playing;
    //   if (isPlaying) {
    //     setState(() {
    //       active1 = true;
    //     });
    //   } else {
    //     setState(() {
    //       active1 = false;
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
                      color: Colors.green[600],
                      height: size.height / 3,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/vector.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLXOVSt_1q2VKE34uEbs1iRLE-yscgh9QkCV_KFkHRRtaDkcvfRtdFJ6Epg5mkEDXkUUucWfefB6d2G5NwBhk8VcknzebiW5n2SZBQRfXj_o1GyQIDAgTLC0zDEjESvb8tXnUiwf-eplJ_3AwZDvbkWf=s947-no",
                      fit: BoxFit.contain,
                      height: size.height / 3,
                    ),
                    // Image.asset(
                    //   "assets/RWA.png",
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
                      "Hubungan dengan Allah",
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
                      "Gimana sih sebenarnya hubungan manusia dengan Allah itu?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Sifat dari hubungan antara manusia dengan Allah SWT dalam ajaran Islam bersifat timbal-balik, berarti bahwa manusia melakukan hubungan dengan Tuhan dan Tuhan juga melakukan hubungan dengan manusia. Tujuan hubungan manusia dengan Allah adalah dalam rangka pengabdian atau ibadah. Dengan kata lain, tugas manusia di dunia ini adalah beribadah. Ibadah dibagi menjadi dua, yaitu Ibadah Mahdhah dan Ibadah Ghairu Mahdhah.",
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
                                "Apa sih perbedaan antara keduanya?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Pertama, Ibadah Mahdhah adalah ibadah yang khusus berbentuk praktik atau perbuatan yang menghubungkan antara hamba dan Allah melalui cara yang telah ditentukan dan diatur atau dicontohkan oleh Rasulullah saw. Sedangkan Ibadah ghairu mahdhah adalah ibadah umum berbentuk hubungan sesama manusia dan manusia dengan alam yang memiliki nilai ibadah. Ibadah ini tidak ditentukan cara dan syarat secara detail, diserahkan kepada manusia sendiri. Islam hanya memberi perintah atau anjuran, dan prinsip-prinsip umum saja.",
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
                                "Syed Muhammad Naquib al-Attas (Ahli Filosof Muslim Malaysia) Relasi Tuhan dan manusia dalam pandangan Al-Attas sangat berhubungan dengan konsepnya mengenai ketuhanan yang membedakan konsep Tuhan sebagai Rabb dan Tuhan sebagai Ilah artinya tidak menyekutukan-Nya dan tunduk serta taat kepada-Nya dengan cara, metode serta jalan yang telah ditunjukkan dan disetujui oleh-Nya. Sedangkan Tuhan sebagai Rabb didapatkan dari konsep tauhid rububiyah, yang meyakini Allah sebagai Sang Pencipta, Yang Memiliki dan Yang Mengatur. Ditinjau dari tauhid uluhiyah manusia adalah seorang hamba Allah yang tujuan awal dari penciptaan dan eksistensi manusia untuk mengabdi kepada Allah dengan penuh kesadaran dan keinginan karena Allah semata dan sesuai dengan syari’at-Nya. Sedangkan dilihat dari konsep tauhid rububiyah manusia memiliki amanah sosial sebagai khalifah Allah di bumi Sebagai khalifah di bumi yang harus menjadikan Al-Qur’an dan Al-Hadist sebagai pedoman utama.",
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
                                leading: IconButton(
                                  icon: Icon(
                                    (active1) ? Icons.pause_circle_filled : Icons.play_circle_outlined,
                                    size: 40,
                                    color: Colors.purple[300],
                                  ),
                                  onPressed: () async {
                                    await player1.setAsset('assets/audio/Az-Zariyat ayat 56.mp3');
                                    player3.stop();
                                    player2.stop();
                                    player4.stop();
                                    player5.stop();
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
                                        active5 = false;
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
                                                  "\"Dan aku tidak menciptakan jin dan manusia melainkan supaya mereka mengabdi kepada-Ku.\"",
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
                                  "Az-Zariyat ayat 56",
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
                                      await player2.setAsset('assets/audio/An-Nisa ayat 48.mp3');
                                      player1.stop();
                                      player3.stop();
                                      player4.stop();
                                      player5.stop();
                                      if (active2) {
                                        setState(() {
                                          active2 = false;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            active2 = true;
                                            active1 = false;
                                            active3 = false;
                                            active4 = false;
                                            active5 = false;
                                          },
                                        );
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
                                                  "\"Sesungguhnya Allah tidak akan mengampuni dosa syirik, dan Dia mengampuni segala dosa yang selain dari (syirik) itu, bagi siapa yang dikehendaki-Nya. Barangsiapa yang mempersekutukan Allah, maka sungguh ia telah berbuat dosa yang besar.\"",
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
                                          },
                                        );
                                        player2.play();
                                      } else {
                                        player2.stop();
                                      }
                                    }),
                                title: Text(
                                  "An-Nisa’ ayat 48",
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
                                    await player3.setAsset('assets/audio/Al-Baqarah ayat 30.mp3');
                                    player1.stop();
                                    player2.stop();
                                    player4.stop();
                                    player5.stop();
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
                                        active5 = false;
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
                                                  "Ingatlah ketika Tuhanmu berfirman kepada para Malaikat: \"Sesungguhnya Aku hendak menjadikan seorang khalifah di muka bumi\". Mereka berkata: \"Mengapa Engkau hendak menjadikan (khalifah) di bumi itu orang yang akan membuat kerusakan padanya dan menumpahkan darah, padahal kami senantiasa bertasbih dengan memuji Engkau dan mensucikan Engkau?\" Tuhan berfirman: \"Sesungguhnya Aku mengetahui apa yang tidak kamu ketahui.\"",
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
                                  "Al-Baqarah ayat 30",
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
                          Column(
                            children: <Widget>[
                              ListTile(
                                leading: IconButton(
                                  icon: Icon(
                                    (active4) ? Icons.pause_circle_filled : Icons.play_circle_outlined,
                                    size: 40,
                                    color: Colors.purple[300],
                                  ),
                                  onPressed: () async {
                                    await player4.setAsset('assets/audio/rwa.mp3');
                                    player1.stop();
                                    player2.stop();
                                    player3.stop();
                                    player5.stop();
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
                                        active5 = false;
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
                              Divider(
                                thickness: 0.25,
                                color: Colors.grey,
                              ),
                              ListTile(
                                leading: IconButton(
                                  icon: Icon(
                                    (active5) ? Icons.pause_circle_filled : Icons.play_circle_outlined,
                                    size: 40,
                                    color: Colors.purple[300],
                                  ),
                                  onPressed: () async {
                                    await player5.setAsset('assets/audio/rwa2.mp3');
                                    player1.stop();
                                    player2.stop();
                                    player3.stop();
                                    player4.stop();
                                    if (active5) {
                                      setState(() {
                                        active5 = false;
                                      });
                                    } else {
                                      setState(() {
                                        active5 = true;
                                        active1 = false;
                                        active2 = false;
                                        active3 = false;
                                        active4 = false;
                                      });
                                    }
                                    (active5) ? player5.play() : player5.stop();
                                  },
                                ),
                                title: Text(
                                  "Sesi 2",
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
                                "\"Kecerdasan yang paling cerdas adalah takwa, dan kebodohan yang paling bodoh adalah maksiat.\"\n\n- Abu Bakar As-Shidiq",
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
                                "\"Jangan tertipu oleh orang yang membaca Alquran. Tapi lihatlah kepada mereka yang perilakunya sesuai dengan Alquran itu.\"\n\n- Umar bin Khattab",
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
                                "\"Aku lebih senang dipandang Allah SWT sebagai hamba yang berbuat baik daripada sebagai orang yang berbuat kerusakan.\"\n\n- Utsman bin Affan",
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
