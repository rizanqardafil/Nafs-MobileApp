import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RasaTakut extends StatefulWidget {
  const RasaTakut({Key? key}) : super(key: key);

  @override
  _RasaTakutState createState() => _RasaTakutState();
}

class _RasaTakutState extends State<RasaTakut> with SingleTickerProviderStateMixin {
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
                      color: Colors.pink[600],
                      height: size.height / 3,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/vector4.png",
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLUnBKcQbvyrcGh5wbQYW2z7pRmEZxss-a5XzliAfBQlsSuS3Dgd1_k7yonnzhdP0P5gDpbcw-DfQQPHoVurX1aFRc04m_dpm8or2nyimPfGkidDt9GmcEtw1u74Mghae4bdkY8MRWZ3yimDvQ48ZCJq=s947-no",
                      fit: BoxFit.contain,
                      height: size.height / 3,
                    ),
                    // Image.asset(
                    //   "assets/rasa_takut.png",
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
                      "Rasa Takut ",
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
                      "Apa itu rasa takut?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Sering banget kan merasakan hal ini? entah pada saat akan melakukan sesuatu, khawatir terhadap apa yang telah kita lakukan, takut karena hal yang mungkin belum terjadi bahkan sampai berlarut-larut, sering disebut dengan \“overthink\” dan masih banyak lagi.",
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
                                "Takut adalah suatu mekanisme pertahanan hidup dasar yang terjadi sebagai respons terhadap suatu stimulus tertentu, seperti rasa sakit atau ancaman bahaya. Beberapa ahli psikologi juga telah menyebutkan bahwa takut adalah salah satu dari emosi dasar, selain kebahagiaan, kesedihan, dan kemarahan. Rasa takut seharusnya bisa dilawan dengan meyakini bahwa Allah senantiasa akan menolong hambanya yang bertakwa kepada-Nya.",
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
                                "Tahu kah kamu bahwa seharusnya hanya kepada Allah lah kita merasa takut? Rasa takut kepada Allah merupakan amalan hati yang banyak disebutkan di dalam Al-Quran dan hadist Nabi SAW. Jika dipahami bahwa esensi ibadah itu adalah semua perkataan dan perbuatan yang lahir ataupun yang tersembunyi selama ia diridhai dan dicintai Allah sebagaimana didefinisikan oleh banyak ulama, maka rasa takut itu merupakan ibadah agung yang wajib ditujukan kepada Allah semata. Karena ia dipuji dan diperintahkan oleh Allah dan Rasulullah shallallahu alaihi wasalam.",
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
                                "Rasa takut dibagi menjadi dua\u00B9. Pertama, rasa takut yang bernilai ibadah, yakni rasa takut yang ditujukan hanya kepada Allah, dimana dengan rasa takut tersebut menjadikannya tidak berani berbuat maksiat melanggar aturan-aturan Allah dan berusaha untuk tidak melakukan hal yang mendatangkan murka-Nya. Rasa takut yang seperti  ini jika ditujukan kepada selain Allah akan menjadikan orang yang bersangkutan menjadi musyrik. Kedua, rasa takut yang naluriah, seperti takutnya seseorang kepada hewan buas, takut ketinggian,  takut kegelapan, dan takut terhadap  hal-hal yang menimbulkan madarat secara fisik. Rasa takut semacam ini tidak bernilai ibadah dan tidak menjadikan  seseorang  menjadi musyrik.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Baloo Da",
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
                                          "1.	Zulfikar, E. (2019). Takut kepada allah dalam al-qur’an: analisis  tafsir  sufistik  ayat -ayat khasyyatullah. ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Hermeneutik: Jurnal Ilmu Al-Qur’an dan Tafsir, 13",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Baloo Da",
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "(1), 143-161",
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
                                    await player1.setAsset('assets/audio/Al Hujurat ayat 13.mp3');
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
                                                  "\"Ingatlah, hanya dengan mengingat Allah lah hati menjadi tentram.\"",
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
                                  "Al-Mu'minun ayat 62",
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
                                                    "\"Janganlah engkau bersedih, sesungguhnya Allah bersama kita.\"",
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
                                  "At-Taubah ayat 40",
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
                                                  "\"Hanya kepada-Mulah kami menyembah, dan hanya kepada-Mulah kami meminta pertolongan.\"",
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
                                  "Al-Fatihah ayat 5",
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
                                await player4.setAsset('assets/audio/rasa_takut.mp3');
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
                                "\"Tinggalkanlah musuhumu, dan waspadalah terhadap temanmu, kecuali yang terpercaya! Karena orang kepercayaan adalah yang takut kepada Allah.\"\n\n- Abu Bakar As-Shidiq",
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
                                "\"Bila kau cemas dan gelisah akan sesuatu, masuklah ke dalamnya sebab ketakutan menghadapinya lebih menganggu daripada sesuatu yang kau takuti sendiri.\"\n\n- Ali bin Abi Thalib",
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
                                "\"Risau terhadap dunia adalah kegelapan bagi hati, sedangkan risau terhadap akhirat adalah cahaya bagi hati.\"\n\n- Utsman bin Affan",
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
