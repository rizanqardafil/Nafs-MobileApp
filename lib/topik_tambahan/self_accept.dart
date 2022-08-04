import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SelfAccept extends StatefulWidget {
  const SelfAccept({Key? key}) : super(key: key);

  @override
  _SelfAcceptState createState() => _SelfAcceptState();
}

class _SelfAcceptState extends State<SelfAccept> with SingleTickerProviderStateMixin {
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
                      color: Colors.blue[600],
                      height: size.height / 3,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/vector2.png",
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLW-b0c8Vg-sCkORA0Nh3t85OWAa7MLK1EZIspYspUeMFLGFdV3j3w4qHJUYWrKXAN2YVhRGxvIm9SfP_tePTztrzrabRbo6cJbe2FNR3ENKOnOqTlASNJ8WKxfJOCJZQ3UkY7eaqcryJGdA5V7DfjIs=s947-no",
                      fit: BoxFit.contain,
                      height: size.height / 3,
                    ),
                    // Image.asset(
                    //   "assets/self_accept.png",
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
                      "Menerima diri sendiri ",
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
                      "Apa itu menerima diri sendiri?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Akhir-akhir ini sering banget merasa ‘insecure’ dan penyebabnya bermacam-macam, ada yang merasa tidak puas dengan kondisi fisik yang dimiliki, membandingkan kemampuan orang lain dengan kemampuan diri dan masih banyak lagi. Udah tau belum sih apa itu ‘insecure’? Yuk simak penjelasan berikut.",
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
                                "Insecure merupakan istilah untuk menggambarkan perasaan yang kurang nyaman dan membuat seseorang merasa cemas, takut, malu hingga tidak percaya diri\u00B9. Akibatnya, seseorang yang insecure bisa saja merasa cemburu, selalu menanyakan pendapat orang lain tentang dirinya, atau justru berusaha memamerkan kelebihannya. Padahal menerima diri sendiri apa adanya dan bersyukur atas apa yang dimiliki itu penting loh!",
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
                                "Hurlock (1974) mendefinisikan self acceptance sebagai “the degree to which an individual having considered his personal characteristics, is able and willing to live with them” yaitu derajat dimana seseorang telah mempertimbangkan karakteristik personalnya, merasa mampu serta bersedia hidup dengan karakteristiknya tersebut\u00B2. Sedangkan Aderson menyatakan bahwa penerimaan diri berarti kita telah berhasil menerima kelebihan dan kekurangan diri apa adanya\u00B2. Menerima diri berarti kita telah menemukan karakter diri dan dasar yang membentuk kerendahan hati dan intergritas. Bukankah setiap manusia adalah makhluk yang diciptakan paling sempurna?",
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
                                "Ciri-ciri seseorang dapat menerima diri menurut Hurlock adalah\u00B2",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "1. Orang yang menerima dirinya memiliki harapan yang realistis terhadap keadaannya dan menghargai diri-nya sendiri\n2. Yakin akan standar-standar dan pengatahuan terhadap dirinya tanpa terpaku pada pendapat orang lain\n3. Memiliki perhitungan akan keterbatasan dirinya dan tidak melihat pada dirinya sendiri secara irasional\n4. Menyadari asset diri yang dimilikinya dan merasa bebas untuk menarik atau melakukan keinginannya\n5. Menyadari kekurangan tanpa menyalahkan diri sendiri",
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
                                          "1.	Oentarto, A. S. A., Rahmat, F., Hapsari, S., Widiastuti, A. H., Gabriella, E. K. (2020) Cara mengubah insecure dengan teori cognitive behavioral therapy (cbt) dan menggunakan teknik cognitive behavior modification (CBM).",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Bimbingan dan Konseling",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ", 1-15\n",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "2.	Permatasari, V., Gamayanti, W. (2016). Gambaran penerimaan diri (self-acceptance) pada orang yang mengalami skizofrenia.",
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
                                    await player1.setAsset('assets/audio/At-Tin ayat 4.mp3');
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
                                                  "\"Sungguh, Kami telah menciptakan manusia dalam bentuk yang sebaik-baiknya.\"",
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
                                  "At-Tin ayat 4",
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
                                      await player2.setAsset('assets/audio/As-Sajdah ayat 7-9.mp3');
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
                                                    "\"Yang memperindah segala sesuatu yang Dia ciptakan dan yang memulai penciptaan manusia dari tanah, kemudian Dia menjadikan keturunannya dari sari pati air yang hina (air mani). Kemudian Dia menyempurnakannya dan meniupkan roh (ciptaan)-Nya ke dalam (tubuh)nya dan Dia menjadikan pendengaran, penglihatan dan hati bagimu, (tetapi) sedikit sekali kamu bersyukur.\"",
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
                                  "As-Sajdah ayat 7-9",
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
                                    await player3.setAsset('assets/audio/Al-Israa ayat 70.mp3');
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
                                                  "\"Dan sungguh, Kami telah memuliakan anak cucu Adam, dan Kami angkut mereka di darat dan di laut, dan Kami beri mereka rezeki dari yang baik-baik dan Kami lebihkan mereka di atas banyak makhluk yang Kami ciptakan dengan kelebihan yang sempurna.\"",
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
                                  "Al-Israa ayat 70",
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
                                await player4.setAsset('assets/audio/menerima_diri.m4a');
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
                                "\"Siapa yang menjauhkan diri dari sifat suka mengeluh maka berarti ia mengundang kebahagiaan.\"\n\n- Abu Bakar As-Shidiq",
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
                                "\"Jangan bersedih atas apa yang telah berlalu, kecuali kalau itu bisa membuatmu bekerja lebih keras untuk apa yang akan datang.\"\n\n- Umar bin Khattab",
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
                                "\"Aku lebih senang di pandang Allah SWT sebagai hamba yang berbuat baik dari pada sebagai orang yang berbuat kerusakan.\"\n\n- Utsman bin Affan",
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
