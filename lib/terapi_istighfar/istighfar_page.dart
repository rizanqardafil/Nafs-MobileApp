import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nafs/sud.dart';
import 'package:nafs/terapi_istighfar/istighfar_audio1_.dart';
import 'package:nafs/terapi_istighfar/istighfar_audio1.dart';
import 'package:nafs/terapi_istighfar/istighfar_audio2_.dart';
import 'package:nafs/terapi_istighfar/istighfar_audio2.dart';
import 'package:nafs/terapi_istighfar/istighfar_video1.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class IstighfarPage extends StatefulWidget {
  const IstighfarPage({Key? key}) : super(key: key);

  @override
  _IstighfarPageState createState() => _IstighfarPageState();
}

class _IstighfarPageState extends State<IstighfarPage> with SingleTickerProviderStateMixin {
  bool isSelected = false;
  bool isSelected2 = false;
  String text = "";
  int num = 0;
  String text2 = "";
  int num2 = 0;
  double val = 0;
  Color color = Color(0xffFCB887);
  Color color2 = Color(0xffFCB887);
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
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
                      color: Color(0xffFCB887).withOpacity(0.5),
                      height: size.height / 3,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/vector3-2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 3.25,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/stresilus.png",
                        fit: BoxFit.cover,
                        height: size.height / 3.75,
                      ),
                    ),
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
                      "Istighfar Untuk Tenang",
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
                      "Dzikir istighfar, memiliki pengaruh pada penurunan tingkat stress jika dilakukan dengan penuh penghayatan serta mempraktikkannya secara mandiri dan rutin. Istighfar akan memberikan ketenangan hati, dan menggerakkan diri untuk menyadari atas kesalahan yang pernah dibuat di masa lalu, meyakini bahwa permasalahan yang dialami merupakan takdir dari Allah, sehingga gejala dalam stress dapat berkurang.",
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
                    Container(
                      padding: EdgeInsets.all(18),
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(15, 15),
                            blurRadius: 1,
                            color: Color(0xffFCB887).withOpacity(0.5),
                          ),
                        ],
                        // color: Colors.green[300],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.announcement,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1. Anda tidak bisa mempercepat Audio, mohon diikuti setiap sesinya ya, Fellas!\n2. Lakukan setiap hari selama 2 minggu agar mendapatkan hasil yang lebih maksimal.\n3. Semangat ya Fellas! Karena hanya dirimu sendiri yang dapat mengelola kondisi mentalmu.",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Baloo Da",
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Color(0xffFCB887).withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: (isSelected)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Sebelum Melakukan Terapi",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Baloo Da",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 0.25,
                                ),
                                SUD(
                                  context,
                                  num,
                                  text,
                                  color,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Setelah Melakukan Terapi",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Baloo Da",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 0.25,
                                ),
                                (isSelected2)
                                    ? Column(
                                        children: [
                                          SUD2(
                                            context,
                                            num2,
                                            text2,
                                            color2,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          (num > num2)
                                              ? Text(
                                                  "Selamat!!!, Anda sudah merasa lebih baik dari sebelumnya",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Baloo Da",
                                                    // fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )
                                              : SizedBox(),
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Setelah menyelesaikan semua sesi terapinya, yuk pilih lagi apa yang kamu rasakan saat ini",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Baloo Da",
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              final value =
                                                  await Navigator.push(context, MaterialPageRoute(builder: (context) => SliderWidget()));

                                              setState(() {
                                                if (value == 0) {
                                                  color2 = Colors.green.shade300;
                                                  text2 = "Sangat tenang dan tidak merasa tertekan sama sekali";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 1) {
                                                  color2 = Colors.green.shade400;
                                                  text2 = "Perasaan pada dasarnya baik, masih fokus dan tidak ada distress yang parah";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 2) {
                                                  color2 = Colors.green.shade500;
                                                  text2 = "Sedikit merasa sedih /distress, namun tidak begitu disadari";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 3) {
                                                  color2 = Colors.green.shade600;
                                                  text2 = "Agak khawatir/ kesal, namun masih bisa diatasi dengan baik";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 4) {
                                                  color2 = Colors.yellow.shade600;
                                                  text2 = "Merasa cemas dan khawatir ringan hingga sedang";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 5) {
                                                  color2 = Colors.yellow.shade700;
                                                  text2 = "Merasa kesal dan tidak nyaman, namun masih bisa diatasi dengan baik";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 6) {
                                                  color2 = Colors.yellow.shade800;
                                                  text2 = "Merasa tidak nyaman dalam rentang sedang hingga kuat";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 7) {
                                                  color2 = Colors.yellow.shade900;
                                                  text2 =
                                                      "Ketidaknyamanan mendominasi pikiran, berjuang untuk bisa mengatasinya hingga kembali normal";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 8) {
                                                  color2 = Colors.red.shade500;
                                                  text2 = "Khawatir dan panik, kehilangan fokus dan merasa cemas di tubuh";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 9) {
                                                  color2 = Colors.red.shade700;
                                                  text2 = "Sangat cemas, putus asa, tidak berdaya dan tidak mampu menanganinya";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                } else if (value == 10) {
                                                  color2 = Colors.red.shade900;
                                                  text2 =
                                                      "Sangat distress sampai tidak dapat berfungsi secara normal dan mungkin merasa berada di ambang kehancuran";
                                                  num2 = value;
                                                  isSelected2 = true;
                                                }
                                              });
                                            },
                                            splashColor: Colors.grey,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.transparent,
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(1, 1),
                                                    blurRadius: 1,
                                                    color: Color(0xffFCB887),
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                "Mulai",
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
                              ],
                            )
                          : Column(
                              children: <Widget>[
                                Text(
                                  "Sebelum memulai sesi terapi, yuk pilih apa yang kamu rasakan saat ini",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Baloo Da",
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                InkWell(
                                  onTap: () async {
                                    final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => SliderWidget()));

                                    setState(() {
                                      if (value == 0) {
                                        color = Colors.green.shade300;
                                        text = "Sangat tenang dan tidak merasa tertekan sama sekali";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 1) {
                                        color = Colors.green.shade400;
                                        text = "Perasaan pada dasarnya baik, masih fokus dan tidak ada distress yang parah";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 2) {
                                        color = Colors.green.shade500;
                                        text = "Sedikit merasa sedih /distress, namun tidak begitu disadari";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 3) {
                                        color = Colors.green.shade600;
                                        text = "Agak khawatir/ kesal, namun masih bisa diatasi dengan baik";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 4) {
                                        color = Colors.yellow.shade600;
                                        text = "Merasa cemas dan khawatir ringan hingga sedang";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 5) {
                                        color = Colors.yellow.shade700;
                                        text = "Merasa kesal dan tidak nyaman, namun masih bisa diatasi dengan baik";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 6) {
                                        color = Colors.yellow.shade800;
                                        text = "Merasa tidak nyaman dalam rentang sedang hingga kuat";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 7) {
                                        color = Colors.yellow.shade900;
                                        text =
                                            "Ketidaknyamanan mendominasi pikiran, berjuang untuk bisa mengatasinya hingga kembali normal";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 8) {
                                        color = Colors.red.shade500;
                                        text = "Khawatir dan panik, kehilangan fokus dan merasa cemas di tubuh";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 9) {
                                        color = Colors.red.shade700;
                                        text = "Sangat cemas, putus asa, tidak berdaya dan tidak mampu menanganinya";
                                        num = value;
                                        isSelected = true;
                                      } else if (value == 10) {
                                        color = Colors.red.shade900;
                                        text =
                                            "Sangat distress sampai tidak dapat berfungsi secara normal dan mungkin merasa berada di ambang kehancuran";
                                        num = value;
                                        isSelected = true;
                                      }
                                    });
                                  },
                                  splashColor: Colors.grey,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 1,
                                          color: Color(0xffFCB887),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "Mulai",
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
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Audio",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        TabBar(
                          controller: controller,
                          indicatorColor: Color(0xffFCB887),
                          labelColor: Color(0xffFCB887),
                          unselectedLabelColor: Colors.grey,
                          tabs: <Widget>[
                            new Tab(
                              text: "Laki-laki",
                            ),
                            new Tab(
                              text: "Perempuan",
                            ),
                          ],
                        ),
                        Container(
                          height: 150,
                          child: TabBarView(
                            controller: controller,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => IstighfarAudio1());
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.play_circle_outlined,
                                        size: 40,
                                        color: Color(0xffFCB887),
                                      ),
                                      title: Text(
                                        "Istighfar Untuk Tenang Sesi 1",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Baloo Da",
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 0.25,
                                    color: Colors.grey,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => IstighfarAudio2());
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.play_circle_outlined,
                                        size: 40,
                                        color: Color(0xffFCB887),
                                      ),
                                      title: Text(
                                        "Istighfar Untuk Tenang Sesi 2",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Baloo Da",
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 0.25,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => IstighfarAudio1_());
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.play_circle_outlined,
                                        size: 40,
                                        color: Color(0xffFCB887),
                                      ),
                                      title: Text(
                                        "Istighfar Untuk Tenang Sesi 1",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Baloo Da",
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 0.25,
                                    color: Colors.grey,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => IstighfarAudio2_());
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.play_circle_outlined,
                                        size: 40,
                                        color: Color(0xffFCB887),
                                      ),
                                      title: Text(
                                        "Istighfar Untuk Tenang Sesi 2",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Baloo Da",
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 0.25,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Video",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Baloo Da",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 0.25,
                          color: Colors.grey,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => IstighfarVideo1());
                          },
                          child: ListTile(
                            leading: Image.asset(
                              "assets/video1.png",
                              fit: BoxFit.contain,
                            ),
                            title: Text(
                              "Istighfar Untuk Tenang Sesi 1",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Baloo Da",
                                // fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset("assets/terapi1.png"),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector SUD(BuildContext context, int num, String text, Color color) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          setState(() {
            isSelected = true;
            text = this.text;
            num = this.num;
          });
          Navigator.pop(context);
        }
      },
      child: ListTile(
        leading: Container(
          height: 30,
          width: 30,
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Text(
              num.toString(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Baloo Da",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Baloo Da",
            // fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  GestureDetector SUD2(BuildContext context, int num, String text, Color color) {
    return GestureDetector(
      onTap: () {
        if (!isSelected2) {
          setState(() {
            isSelected2 = true;
            text2 = text;
            num2 = num;
          });
          Navigator.pop(context);
        }
      },
      child: ListTile(
        leading: Container(
          height: 30,
          width: 30,
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Text(
              num.toString(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Baloo Da",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Baloo Da",
            // fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// showDialog(
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return StatefulBuilder(
                                    //       builder: (context, setState) {
                                    //         return Dialog(
                                    //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    //           elevation: 16,
                                    //           child: SingleChildScrollView(
                                    //             child: Container(
                                    //               padding: EdgeInsets.all(20),
                                    //               child: Column(
                                    //                 children: [
                                    //                   SliderWidget(
                                    //                     value: val,
                                    //                   ),
                                    //                   SizedBox(
                                    //                     height: 20,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     0,
                                    //                     "Sangat tenang dan tidak merasa tertekan sama sekali",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     1,
                                    //                     "Perasaan pada dasarnya baik, masih fokus dan tidak ada distress yang parah",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     2,
                                    //                     "Sedikit merasa sedih /distress, namun tidak begitu disadari",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     3,
                                    //                     "Agak khawatir/ kesal, namun masih bisa diatasi dengan baik",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     4,
                                    //                     "Merasa cemas dan khawatir ringan hingga sedang",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     5,
                                    //                     "Merasa kesal dan tidak nyaman, namun masih bisa diatasi dengan baik",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     6,
                                    //                     "Merasa tidak nyaman dalam rentang sedang hingga kuat",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     7,
                                    //                     "Ketidaknyamanan mendominasi pikiran, berjuang untuk bisa mengatasinya hingga kembali normal",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     8,
                                    //                     "Khawatir dan panik, kehilangan fokus dan merasa cemas di tubuh",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     9,
                                    //                     "Sangat cemas, putus asa, tidak berdaya dan tidak mampu menanganinya",
                                    //                   ),
                                    //                   Divider(
                                    //                     color: Colors.grey,
                                    //                     thickness: 0.25,
                                    //                   ),
                                    //                   SUD(
                                    //                     context,
                                    //                     10,
                                    //                     "Sangat distress sampai tidak dapat berfungsi secara normal dan mungkin merasa berada di ambang kehancuran",
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         );
                                    //       },
                                    //     );
                                    //   },
                                    // );