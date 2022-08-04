import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class TujuanHidup extends StatefulWidget {
  const TujuanHidup({Key? key}) : super(key: key);

  @override
  _TujuanHidupState createState() => _TujuanHidupState();
}

class _TujuanHidupState extends State<TujuanHidup> with SingleTickerProviderStateMixin {
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
                      color: Colors.red[600],
                      height: size.height / 3,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/vector3.png",
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLX4NyGKTr709bxjFALiBMO82pZcUMx7TdDy7OEbOTgNqQ0L3_Tgaot3UU_ESaMf1CyyAuNW4yACrZxH5m-J3KMkSTUjOM6L1fOp5oDT5Ks8XEu-C1pMihF1nzhHWj2tEUV3h7tF2N7hk5k4ApC7O9NP=s947-no",
                      fit: BoxFit.contain,
                      height: size.height / 3,
                    ),
                    // Image.asset(
                    //   "assets/tujuan_hidup.png",
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
                      "Tujuan Hidup ",
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
                      "Apa sih tujuan kita hidup?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Membahas soal tujuan hidup merupakan hal yang mungkin terdengar klise, masih banyak orang yang tidak tau dan sering berpikir \“Sebenarnya tujuan hidup ku apa?\”. Jawaban yang berbeda-beda akan muncul dari setiap individu. Biar sejalan dan tidak salah kaprah dalam menentukan tujuan hidup, mari kita selaraskan pemahaman tentang apa itu tujuan hidup dan bagaimana cara membuat tujuan hidup yang baik.",
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
                                "Tujuan Hidup sendiri diartikan sebagai suatu panduan bagi diri Kamu dalam menjalani kehidupan\u00B9. Hal ini berguna untuk memandu, membentuk cita-cita, serta menemukan makna dibalik Kamu menjalani hidup. Kalau soal tujuan hidup setiap orang beda-beda, semua itu tentu gak ada yang salah kok, sebab itu menjadi motivasi bagi Kita untuk melanjutkan hidup.",
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
                                "Menurut Islam tujuan hidup bagi manusia adalah menunaikan penghambaan dan pengabdian (dalam makna yang luas) kepada Allah Ta'ala\u00B2. Sedangkan perannya di muka bumi adalah sebagai khalifah (pemimpin) di alam semesta ini\u00B2.",
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
                                "Menurut David B. Feldman (psikolog dari Amerika Serikat) ada beberapa hal untuk merencanakan tujuan hidup, diantaranya\u00B9:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "1.	Tentukan hal yang penting dalam hidup\n2.	Tentukan apa yang menjadi prinsip hidup\n3.	Tentukan secara jelas\n4.	Realistis dalam menciptakan tujuan\n5.	Ciptakan tujuan untuk dicapai, bukan dihindari",
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
                                      text:
                                          "1.	Satu persen. (2020). Memahami Tujuan Hidup: Cara Merencanakan dan Bagaimana Mencapainya. Diakses 31 Agustus 2021. https://satupersen.net/blog/tujuan-hidup-memahami-dan-merencanakannya",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "\n2.	Bafadhol, I. (2017). Lembaga pendidikan islam di Indonesia. Jurnal Pendidikan Islam, 6(11), 59-72",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Jurnal Ilmiah Psikologi, 3",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "(1), 139-152",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
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
                                leading: IconButton(
                                  icon: Icon(
                                    (active1) ? Icons.pause_circle_filled : Icons.play_circle_outlined,
                                    size: 40,
                                    color: Colors.purple[300],
                                  ),
                                  onPressed: () async {
                                    await player1.setAsset('assets/audio/Al-Bayyinah Ayat 5.mp3');
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
                                                  "\"Padahal mereka hanya diperintah menyembah Allah dengan ikhlas menaati-Nya semata-mata karena (menjalankan) agama, dan juga agar melaksanakan salat dan menunaikan zakat; dan yang demikian itulah agama yang lurus (benar).\"",
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
                                  "Al-Bayyinah Ayat 5",
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
                                      await player2.setAsset('assets/audio/An-Nahl ayat 97.mp3');
                                      player1.stop();
                                      player3.stop();
                                      player4.stop();
                                      player5.stop();
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
                                          active5 = false;
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
                                                    "\"Barangsiapa yang mengerjakan amal saleh, baik laki-laki maupun perempuan dalam keadaan beriman, maka sesungguhnya akan Kami berikan kepadanya kehidupan yang baik dan sesungguhnya Kami beri balasan kepada mereka dengan pahala yang lebih baik dari apa yang telah mereka kerjakan.\"",
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
                                  "An-Nahl ayat 97",
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
                                    await player3.setAsset('assets/audio/Al-Kahf ayat 107.mp3');
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
                                                  "\"Sesungguhnya orang orang yang beriman dan beramal saleh, bagi mereka adalah surga Firdaus menjadi tempat tinggal.\"",
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
                                  "Al-Kahf ayat 107",
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
                                    await player4.setAsset('assets/audio/tujuan_hidup.mp3');
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
                                    await player5.setAsset('assets/audio/tujuan_hidup2.mp3');
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
                                "\"Ada kebesaran dalam rasa takut akan Allah, kepuasan dalam beriman kepada Allah, dan kehormatan dalam kerendahan hati.\"\n\n- Abu Bakar As-Shidiq",
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
                              color: Colors.blue,
                            ),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.6,
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "\"Tidak ada jalinan hubungan antara Allah dengan siapapun kecuali melalui ketaatan kepada-Nya.\"\n\n- Umar bin Khattab",
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
                                "\"Buatlah tujuan untuk hidup, kemudian gunakan segenap kekuatan untuk mencapainya, kamu pasti berhasil.\"\n\n- Utsman bin Affan",
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
