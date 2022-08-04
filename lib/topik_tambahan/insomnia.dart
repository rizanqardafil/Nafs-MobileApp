import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Insomnia extends StatefulWidget {
  const Insomnia({Key? key}) : super(key: key);

  @override
  _InsomniaState createState() => _InsomniaState();
}

class _InsomniaState extends State<Insomnia> with SingleTickerProviderStateMixin {
  late AudioPlayer player1;
  late AudioPlayer player2;
  late AudioPlayer player3;
  late AudioPlayer player4;
  late bool active1;
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
                      color: Colors.grey[600],
                      height: size.height / 3,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLWieom9EYst2dLN_ZfvlE7cHIhQ99T69LxdJs2m5bqpRknCZSdxnzuq_r3SjVgTxrtOdlMD9JGl28pXNKkgFEKc9Wd7zndaS7NSz2bxo9DrYUqjJlHirqxPPLebeJPf0OMHv3MW_GFrA7UkQZc_SNc-=s947-no",
                      fit: BoxFit.contain,
                      height: size.height / 3,
                    ),
                    // Image.asset(
                    //   "assets/insom.png",
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
                      "Insomnia ",
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
                      "Apa Sih Insomnia Itu?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Insomnia merupakan kelainan saat tidur yang berupa kesulitan berulang untuk tidur atau mempertahankan tidur walaupun ada kesempatan untuk itu, dan gejalanya biasanya diikuti gangguan fungsional saat bangun dan beraktivitas pada siang hari\u00B9. Menurut penelitian, sepertiga orang dewasa mengalami kesulitan memulai tidur dan mempertahankan tidur dalam setahun, dengan 17% diantaranya mengganggu kualitas hidup\u00B9.",
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
                                "NSF (National Sleep Foundation) menjelaskan bahwa insomnia dapat menimbulkan beberapa efek seperti menyebabkan berpikir dan bekerja lebih lambat, membuat banyak kesalahan, dan  sulit untuk mengingat sesuatu, cepat marah, tidak sabar, gelisah dan depresi\u00B9.",
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
                                "Apa Saja Sih Faktornya?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Insomnia disebabkan oleh berbagai macam faktor. Menurut penelitian Nurdin dkk. tahun 2018 yang dilakukan pada 215 mahasiswa, ditemukan bahwa perilaku merokok, konsumsi kafein dan aktivitas fisik menjadi faktor pengaruh terhadap terhadap tingkat insomnia\u00B9.",
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
                                "Bagaimana Ciri-Cirinya?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Diagnostic and Statistical Manual of Mental Disorder, Fifth  Edition (DSM-V) telah menetukan kriteria insomnia yang dapat dijadikan penentu apakah seseorang mengalami insomnia\u00B2.",
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
                                "a.	 Dasar keluhan ketidakpuasan dengan kualitas dan kuantitas tidur, berhubungan dengan salah satu (atau lebih) gejala-gejala berikut:\n\t1.	Kesulitan untuk memulai tidur\n\t2.	Kesulitan untuk mempertahankan tidur, yang ditandai dengan sering terjaga atau sulit kembali tidur setelah terjaga\n\t3.	Terbangun pada dini hari dan tidak bisa kembali tidur\n\nb.	Gangguan tidur menyebabkan distress yang signifikan secara klinis atau gangguan dalam fungsi sosial, pekerjaan, pendidikan, akademik, perilaku, atau area fungsi lainnya\nc.	Kesulitan tidur dialami setidaknya 3 kali seminggu\nd.	Kesulitan tidur dialami selama setidaknya 3 bulan\ne.	Kesulitan tidur dialami meskipun mempunyai kesempatan yang cukup untuk tidur\nf.	Insomnia yang terjadi tidak bisa dijelaskan dan tidak muncul selama gangguan tidur lainnya\ng.	Insomnia yang terjadi bukan akibat fisiologis dari penggunan zat\nh.	Adanya gangguan psikiatri atau medis komorbid tidak bisa menerangkan predominasi keluhan insomnia",
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
                                          "1.	Nurdin, M. A., dkk. (2018). Quality of life of patients with insomnia to students. Junal MKMI, 14(2), 128-138",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\n2.	American Psychiatric Association. (2013). ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Diagnostic and Statistical Manual of Mental Disorder Edition (DSM-V). ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Washington : American Psychiatric Publishing.",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
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
                                    await player1.setAsset('assets/audio/Al-Fatihah ayat 5.mp3');
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
                                                  "Allah, tidak ada tuhan selain Dia. Yang Mahahidup, Yang terus menerus mengurus (makhluk-Nya), tidak mengantuk dan tidak tidur. Milik-Nya apa yang ada di langit dan apa yang ada di bumi. Tidak ada yang dapat memberi syafaat di sisi-Nya tanpa izin-Nya. Dia mengetahui apa yang di hadapan mereka dan apa yang di belakang mereka, dan mereka tidak mengetahui sesuatu apa pun tentang ilmu-Nya melainkan apa yang Dia kehendaki.",
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
                                  "Al-Baqarah: 255 ",
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
                                      await player2.setAsset('assets/audio/Ar-Rad ayat 28.mp3');
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
                                                    "1. Katakanlah, Aku berlindung kepada Tuhannya manusia,\n2. Raja manusia,\n3. sembahan manusia,\n4. dari kejahatan (bisikan) setan yang bersembunyi,\n5. yang membisikkan (kejahatan) ke dalam dada manusia,\n6. dari (golongan) jin dan manusia.",
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
                                  "An-Nas: 1-6 ",
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
                                    await player3.setAsset('assets/audio/At-Taubah ayat 40.mp3');
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
                                                  "1. Katakanlah, Aku berlindung kepada Tuhan yang menguasai subuh (fajar),\n2. dari kejahatan (makhluk yang) Dia ciptakan,\n3. dan dari kejahatan malam apabila telah gelap gulita,\n4. dan dari kejahatan (perempuan-perempuan) penyihir yang meniup pada buhul-buhul (talinya),\n5. dan dari kejahatan orang yang dengki apabila dia dengki",
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
                                  "Al-Falaq: 1-5 ",
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
                                await player4.setAsset('assets/audio/tujuan_hidup.mp3');
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
