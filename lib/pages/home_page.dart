import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:nafs/bot/stres_bot copy 2.dart';
import 'package:nafs/models/Users.dart';
import 'package:nafs/riwayat_services.dart';
import 'package:nafs/screening/start_screening.dart';
import 'package:nafs/terapi_alfatihah/alfatihah_page.dart';
import 'package:nafs/terapi_istighfar/istighfar_page.dart';
import 'package:nafs/topik_tambahan/insomnia.dart';
import 'package:nafs/topik_tambahan/rasa_takut.dart';
import 'package:nafs/topik_tambahan/rwa.dart';
import 'package:nafs/topik_tambahan/rwo.dart';
import 'package:nafs/topik_tambahan/self_accept.dart';
import 'package:nafs/topik_tambahan/tujuan_hidup.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nafs/user_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double stresSize = 75;
  double depresiSize = 75;
  double cemasSize = 75;
  String nama = "";
  String text = "Menurut hasil skrining terbaru kamu, kamu sedang mengalami ";
  String text2 = "";
  String text3 = " Silahkan mencoba fitur berbagi cerita sesuai dengan kebutuhan Anda.";
  bool isScreened = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Hasil Skrining Terbaru Kamu",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Baloo Da",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
          //   FutureBuilder(
          //       future: UserServices.getUser(user!.uid),
          //       builder: (_, snapshot) {
          //         if (snapshot.connectionState == ConnectionState.done) {
          //           if (snapshot.hasData) {
          //             Users u = snapshot.data as Users;
          //             nama = "Hai " + u.name + ", ";
          //           }
          //         }
          //         return Text(
          //           nama + "Apakah Yang Kamu Rasakan Hari Ini ?",
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontFamily: "Baloo Da",
          //             fontWeight: FontWeight.bold,
          //             fontSize: 18,
          //           ),
          //         );
          //       }),
          // ),

          Flexible(
            fit: FlexFit.loose,
            child: Container(
              // height: (MediaQuery.of(context).size.height < 700) ? (size.height + 100) / 4 : (size.height + 100) / 5,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    color: Colors.grey.withOpacity(0.25),
                  )
                ],
              ),
              child: FutureBuilder(
                  future: RiwayatServices.getRiwayat(user!.uid),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List riwayat = snapshot.data as List;
                      riwayat.sort((riwayat1, riwayat2) => riwayat1.time.compareTo(riwayat2.time));
                      if (riwayat.isEmpty) {
                        isScreened = false;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Anda Belum Pernah Skrining",
                              style: TextStyle(fontFamily: "Baloo Da", color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(0),
                              width: MediaQuery.of(context).size.width / 2.75,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        elevation: 16,
                                        content: Text(
                                          "1. Skrining hanya bisa dilakukan setelah 2 minggu skrining terakhir anda.\n2. Fitur ini merupakan alat pendeteksi untuk melihat kondisi stres, cemas dan depresi Anda.\n3. Hasil skrining menunjukkan bagaimana kondisi cemas, stres dan depresi Anda hanya pada saat itu dan tidak berlaku jangka panjang.\n4. Hasil skrining tidak bisa dijadikan sebagai bahan diagnosis menyeluruh terhadap diri Anda.\n5. Diagnosis kondisi mental Anda hanya dapat dilakukan oleh psikolog.",
                                          style: TextStyle(
                                            fontFamily: "Baloo Da",
                                          ),
                                        ),
                                        actions: [
                                          Column(
                                            children: [
                                              Divider(
                                                color: Colors.grey,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.all(10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    Get.to(() => StartScreening());
                                                  },
                                                  child: Text(
                                                    'Lanjut',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "Mulai Skrining",
                                  style: TextStyle(fontFamily: "Baloo Da", fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple[200],
                                  onPrimary: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        print(DateTime.now().millisecondsSinceEpoch <=
                            (riwayat[riwayat.length - 1].time.add(Duration(days: 14))).millisecondsSinceEpoch);
                        print((riwayat[riwayat.length - 1].time.add(Duration(days: 14))));
                        if (DateTime.now().millisecondsSinceEpoch <=
                            (riwayat[riwayat.length - 1].time.add(Duration(days: 14))).millisecondsSinceEpoch) {
                          if (riwayat[riwayat.length - 1].kategoristress == "Sangat Berat") {
                            stresSize = 95;
                            text2 = "stres yang sangat berat,";
                            isScreened = true;
                          } else if (riwayat[riwayat.length - 1].kategoristress == "Berat") {
                            stresSize = 90;
                            text2 = "stres yang berat,";
                            isScreened = true;
                          } else if (riwayat[riwayat.length - 1].kategoristress == "Sedang") {
                            stresSize = 85;
                            text2 = "stres yang sedang,";
                            isScreened = true;
                          } else if (riwayat[riwayat.length - 1].kategoristress == "Ringan") {
                            stresSize = 80;
                            text2 = "stres yang ringan,";
                            isScreened = true;
                          }

                          if (riwayat[riwayat.length - 1].kategoricemas == "Sangat Berat") {
                            cemasSize = 95;
                            text2 = text2 + " cemas yang sangat berat,";
                            isScreened = true;
                          } else if (riwayat[riwayat.length - 1].kategoricemas == "Berat") {
                            cemasSize = 90;
                            text2 = text2 + " cemas yang berat,";
                            isScreened = true;
                          } else if (riwayat[riwayat.length - 1].kategoricemas == "Sedang") {
                            cemasSize = 85;
                            text2 = text2 + " cemas yang sedang,";
                            isScreened = true;
                          } else if (riwayat[riwayat.length - 1].kategoricemas == "Ringan") {
                            cemasSize = 80;
                            text2 = text2 + " cemas yang ringan,";
                            isScreened = true;
                          }

                          if (riwayat[riwayat.length - 1].kategoridepresi == "Sangat Berat") {
                            depresiSize = 95;
                            text2 = text2 + " dan depresi yang sangat berat.";
                            isScreened = true;
                          } else if (riwayat[riwayat.length - 1].kategoridepresi == "Berat") {
                            depresiSize = 90;
                            text2 = text2 + " dan depresi yang berat.";
                            isScreened = true;
                          } else if (riwayat[riwayat.length - 1].kategoridepresi == "Sedang") {
                            depresiSize = 85;
                            text2 = text2 + " dan depresi yang sedang.";
                            isScreened = true;
                          } else if (riwayat[riwayat.length - 1].kategoridepresi == "Ringan") {
                            depresiSize = 80;
                            text2 = text2 + " dan depresi yang ringan.";
                            isScreened = true;
                          }

                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Hasil Skrining Pada " +
                                          riwayat[riwayat.length - 1].time.day.toString() +
                                          " " +
                                          DateFormat.yMMMM("id_ID").format(riwayat[riwayat.length - 1].time),
                                      style: TextStyle(
                                        fontFamily: "Baloo Da",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: stresSize,
                                              decoration: BoxDecoration(color: Colors.red[100], borderRadius: BorderRadius.circular(20)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: Image.asset(
                                                  "assets/test1.png",
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Stres",
                                              style: TextStyle(
                                                fontFamily: "Baloo Da",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              riwayat[riwayat.length - 1].kategoristress,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: depresiSize,
                                              decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(20)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: Image.asset(
                                                  "assets/test2.png",
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Depresi",
                                              style: TextStyle(
                                                fontFamily: "Baloo Da",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              riwayat[riwayat.length - 1].kategoridepresi,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: cemasSize,
                                              decoration: BoxDecoration(color: Colors.purple[100], borderRadius: BorderRadius.circular(20)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: Image.asset(
                                                  "assets/test3.png",
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Cemas",
                                              style: TextStyle(
                                                fontFamily: "Baloo Da",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              riwayat[riwayat.length - 1].kategoricemas,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Kamu baru bisa skrining lagi pada " +
                                          (DateTime(
                                                riwayat[riwayat.length - 1].time.year,
                                                riwayat[riwayat.length - 1].time.month,
                                                riwayat[riwayat.length - 1].time.day + 14,
                                              ).day.toString() +
                                              " " +
                                              DateFormat.yMMMM("id_ID").format(
                                                DateTime(
                                                  riwayat[riwayat.length - 1].time.year,
                                                  riwayat[riwayat.length - 1].time.month,
                                                  riwayat[riwayat.length - 1].time.day + 14,
                                                ),
                                              )),
                                      style: TextStyle(
                                        fontFamily: "Baloo Da",
                                        fontWeight: FontWeight.bold,
                                        fontSize: MediaQuery.of(context).size.height < 800 ? 13 : 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              (isScreened)
                                  ? Container(
                                      padding: EdgeInsets.all(18),
                                      margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(15, 15),
                                            blurRadius: 1,
                                            color: Colors.purple.shade100,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(
                                              Icons.lightbulb,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: text,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Baloo Da",
                                                fontSize: 14,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: text2,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Baloo Da",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: text3,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Baloo Da",
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Anda Belum Skrining Hari Ini",
                                style: TextStyle(fontFamily: "Baloo Da", color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(0),
                                width: MediaQuery.of(context).size.width / 2.75,
                                // height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          elevation: 16,
                                          content: Text(
                                            "1. Skrining hanya bisa dilakukan setelah 2 minggu skrining terakhir anda.\n2. Fitur ini merupakan alat pendeteksi untuk melihat kondisi stres, cemas dan depresi Anda.\n3. Hasil skrining menunjukkan bagaimana kondisi cemas, stres dan depresi Anda hanya pada saat itu dan tidak berlaku jangka panjang.\n4. Hasil skrining tidak bisa dijadikan sebagai bahan diagnosis menyeluruh terhadap diri Anda.\n5. Diagnosis kondisi mental Anda hanya dapat dilakukan oleh psikolog.",
                                            style: TextStyle(
                                              fontFamily: "Baloo Da",
                                            ),
                                          ),
                                          actions: [
                                            Column(
                                              children: [
                                                Divider(
                                                  color: Colors.grey,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.all(10),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      Get.to(() => StartScreening());
                                                    },
                                                    child: Text(
                                                      'Lanjut',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.blue,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Mulai Skrining",
                                    style: TextStyle(fontFamily: "Baloo Da", fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purple[200],
                                    onPrimary: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                    } else {
                      return Center(
                        child: SpinKitCircle(
                          color: Colors.purple,
                          size: 50,
                        ),
                      );
                    }
                  }),
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Berbagi Cerita Yuk",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
          ),

          //Stres

          Container(
            height: (size.height + 100) / 6,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  color: Colors.red.withOpacity(0.5),
                ),
              ],
              // color: Colors.red[300],
            ),
            child: InkWell(
              onTap: () {
                Get.to(StresBot());
              },
              splashColor: Colors.grey,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/vector-2.png",
                      // fit: BoxFit.cover,
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Image.asset(
                  //     "assets/stres.png",
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLUBCFeepskBgsPyRBYVbzcouzBvR-lTgd1ax8QI64Y7X-aQYO7-TaR-w8iSukgvnGf7vEPSPPj4FGNKBTvjgwe0S2c80cCgZr9MOIlOfFDiMezmQaV34OHutqqXH8HXT009gFYWcA6I7fZSjARiy6eG=s947-no",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stres",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: (size.height + 100 > 600) ? 20 : 12,
                          ),
                        ),
                        Text(
                          "Ketika kamu merasa tertekan\n dengan berbagai perubahan\n yang terjadi dalam hidupmu",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: (size.height + 100 > 600) ? 10 : 8,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          //Depresi

          Container(
            height: (size.height + 100) / 6,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  color: Colors.green.withOpacity(0.5),
                ),
              ],
              // color: Colors.green[300],
            ),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.grey,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/vector-2.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Image.asset(
                  //     "assets/depresi.png",
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLUbNrW1c-YKsekuKf6URQ2LomX8IboTWZuoxXj183hrQvchqvPEudS--k21t-sJJDMN-MapRBI3HRZSA4kokVOWZLQqZhPuVV-3MKRz0kyFnO31mcdeQzNj6Moubfs8FsbO6OB_S7gTAGmNhGdTWJZJ=s947-no",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Depresi",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: (size.height + 100 > 600) ? 20 : 12,
                          ),
                        ),
                        Text(
                          "Ketika kamu mengalami suasana\n hati yang buruk seperti sedih,\n kecewa, tidak peduli, secara\n mendalam dan terus menerus",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: (size.height + 100 > 600) ? 10 : 8,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          //Cemas

          Container(
            height: (size.height + 100) / 6,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  color: Colors.purple.withOpacity(0.5),
                ),
              ],
              // color: Colors.purple[300],
            ),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.grey,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/vector-2.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: Image.asset(
                  //     "assets/cemas.png",
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLWtVoKGeBNfSKnb5Mf-t7WQkCJp21iqzq00mN5xx9OjihWL_usne4VQvM0ynlXpTbrZ4c2KvqLJL_gXsLtO27ih0hq8Qb1UqT5Xh4szGL7VdwLR_dC4XukuzpknhlEOBnr3QQVwjZrnxdwqj29kIhGa=s947-no",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cemas",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: (size.height + 100 > 600) ? 20 : 12,
                          ),
                        ),
                        Text(
                          "Ketika kamu merasa takut, gugup,\n khawatir, dan prihatin yang\n berkepanjangan terhadap masa\n depanmu",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: (size.height + 100 > 600) ? 10 : 8,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          //Insomnia

          // Container(
          //   height: (size.height + 100) / 6,
          //   margin: EdgeInsets.all(10),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //     boxShadow: [
          //       BoxShadow(
          //         offset: Offset(1, 1),
          //         blurRadius: 1,
          //         color: Colors.pink.withOpacity(0.5),
          //       ),
          //     ],
          //     // color: Colors.pink[300],
          //   ),
          //   child: InkWell(
          //     onTap: () {},
          //     splashColor: Colors.grey,
          //     child: Stack(
          //       children: [
          //         Align(
          //           alignment: Alignment.topRight,
          //           child: Image.asset(
          //             "assets/decoration/card_terapi_decoration.png",
          //             fit: BoxFit.contain,
          //           ),
          //         ),
          //         Align(
          //           alignment: Alignment.topRight,
          //           child: Image.asset(
          //             "assets/insom.png",
          //             fit: BoxFit.contain,
          //           ),
          //         ),
          //         // Align(
          //         //   alignment: Alignment.topRight,
          //         //   child: Image.network(
          //         //     "https://drive.google.com/uc?export=view&id=1JHv-gjWiMMNiX2OjaOuZvO6JwjY3rdbw",
          //         //     fit: BoxFit.contain,
          //         //   ),
          //         // ),
          //         Padding(
          //           padding: EdgeInsets.only(left: 20),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "Insomnia",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontFamily: "Baloo Da",
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: (size.height + 100 > 600) ? 20 : 12,
          //                 ),
          //               ),
          //               Text(
          //                 "Lorem ipsum dolor sit amet,\n adipiscing elit. Phasellus\n bibendum bibendum metus.",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontFamily: "Baloo Da",
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: (size.height + 100 > 600) ? 10 : 8,
          //                 ),
          //               )
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          // Container(
          //   height: (size.height + 100) / 6,
          //   margin: EdgeInsets.all(10),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: Color.fromRGBO(80, 179, 113, 1),
          //     image: DecorationImage(
          //       image:
          //           AssetImage("assets/decoration/card_terapi_decoration.png"),
          //       fit: BoxFit.contain,
          //       alignment: Alignment.topRight,
          //     ),
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   child: NeumorphicButton(
          //     onPressed: () {},
          //     provideHapticFeedback: true,
          //     style: NeumorphicStyle(
          //       shape: NeumorphicShape.concave,
          //       boxShape: NeumorphicBoxShape.roundRect(
          //         BorderRadius.circular(12),
          //       ),
          //       depth: 8,
          //       lightSource: LightSource.topLeft,
          //       color: Colors.transparent,
          //     ),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           "Depresi",
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontFamily: "Baloo Da",
          //             fontWeight: FontWeight.bold,
          //             fontSize: (size.height + 100 > 600) ? 20 : 12,
          //           ),
          //         ),
          //         Text(
          //           "Ketika kamu mengalami suasana\n hati yang buruk seperti sedih,\n kecewa, tidak peduli, secara\n mendalam dan terus menerus",
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontFamily: "Baloo Da",
          //             fontWeight: FontWeight.bold,
          //             fontSize: (size.height + 100 > 600) ? 10 : 8,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // Container(
          //   height: (size.height + 100) / 6,
          //   width: double.infinity,
          //   margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
          //   decoration: BoxDecoration(
          //     color: Color.fromRGBO(51, 50, 66, 1),
          //     image: DecorationImage(
          //       image:
          //           AssetImage("assets/decoration/card_terapi_decoration.png"),
          //       fit: BoxFit.contain,
          //       alignment: Alignment.topRight,
          //     ),
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   child: NeumorphicButton(
          //     onPressed: () {},
          //     provideHapticFeedback: true,
          //     style: NeumorphicStyle(
          //       shape: NeumorphicShape.concave,
          //       boxShape: NeumorphicBoxShape.roundRect(
          //         BorderRadius.circular(12),
          //       ),
          //       depth: 8,
          //       lightSource: LightSource.topLeft,
          //       color: Colors.transparent,
          //     ),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           "Insomnia",
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontFamily: "Baloo Da",
          //             fontWeight: FontWeight.bold,
          //             fontSize: (size.height + 100 > 600) ? 20 : 12,
          //           ),
          //         ),
          //         Text(
          //           "Lorem ipsum dolor sit amet,\n adipiscing elit. Phasellus\n bibendum bibendum metus.",
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontFamily: "Baloo Da",
          //             fontWeight: FontWeight.bold,
          //             fontSize: (size.height + 100 > 600) ? 10 : 8,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Topik Terkait",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 5.5,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/decoration/card_terapi_decoration.png",
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight),
                        color: Colors.green[600],
                        borderRadius: BorderRadius.circular(12)),
                    child: NeumorphicButton(
                      onPressed: () {
                        Get.to(() => RWA());
                      },
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.network(
                              "https://lh3.googleusercontent.com/pw/AM-JKLXOVSt_1q2VKE34uEbs1iRLE-yscgh9QkCV_KFkHRRtaDkcvfRtdFJ6Epg5mkEDXkUUucWfefB6d2G5NwBhk8VcknzebiW5n2SZBQRfXj_o1GyQIDAgTLC0zDEjESvb8tXnUiwf-eplJ_3AwZDvbkWf=s947-no",
                              fit: BoxFit.contain,
                            ),
                            // Image.asset(
                            //   "assets/RWA.png",
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Hubungan Dengan Allah",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Baloo Da",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: size.width / 1.75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/decoration/card_terapi_decoration.png",
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight),
                        color: Colors.amber[600],
                        borderRadius: BorderRadius.circular(12)),
                    child: NeumorphicButton(
                      onPressed: () {
                        Get.to(() => RWO());
                      },
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.network(
                              "https://lh3.googleusercontent.com/pw/AM-JKLUrU8SWV-7oanktalrimUMCUVxeVw3ugX4-ivEMdGtzfEvvlgmRRAlRXPBvkjaUEwg3TSsK0u1g7scr0ZzSEg9ud-omweU9QmwwtoacZCBl-_z4esaGIItFMAifQCqOtcIu1DYEXokeCkKWc3aern8i=s947-no",
                              fit: BoxFit.contain,
                            ),
                            // Image.asset(
                            //   "assets/rwo.png",
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Hubungan Dengan Orang Lain",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Baloo Da",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/decoration/card_terapi_decoration.png",
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight),
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12)),
                    child: NeumorphicButton(
                      onPressed: () {
                        Get.to(() => SelfAccept());
                      },
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.network(
                              "https://lh3.googleusercontent.com/pw/AM-JKLW-b0c8Vg-sCkORA0Nh3t85OWAa7MLK1EZIspYspUeMFLGFdV3j3w4qHJUYWrKXAN2YVhRGxvIm9SfP_tePTztrzrabRbo6cJbe2FNR3ENKOnOqTlASNJ8WKxfJOCJZQ3UkY7eaqcryJGdA5V7DfjIs=s947-no",
                              fit: BoxFit.contain,
                            ),
                            // Image.asset(
                            //   "assets/self_accept.png",
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Menerima Diri Sendiri",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Baloo Da",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: size.width / 1.75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/decoration/card_terapi_decoration.png",
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight),
                        color: Colors.red[600],
                        borderRadius: BorderRadius.circular(12)),
                    child: NeumorphicButton(
                      onPressed: () {
                        Get.to(() => TujuanHidup());
                      },
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topRight,
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.network(
                              "https://lh3.googleusercontent.com/pw/AM-JKLX4NyGKTr709bxjFALiBMO82pZcUMx7TdDy7OEbOTgNqQ0L3_Tgaot3UU_ESaMf1CyyAuNW4yACrZxH5m-J3KMkSTUjOM6L1fOp5oDT5Ks8XEu-C1pMihF1nzhHWj2tEUV3h7tF2N7hk5k4ApC7O9NP=s947-no",
                              fit: BoxFit.contain,
                            ),
                            // Image.asset(
                            //   "assets/tujuan_hidup.png",
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Tujuan Hidup",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Baloo Da",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: size.width / 1.75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/decoration/card_terapi_decoration.png",
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight),
                        color: Colors.pink[600],
                        borderRadius: BorderRadius.circular(12)),
                    child: NeumorphicButton(
                      onPressed: () {
                        Get.to(() => RasaTakut());
                      },
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.network(
                              "https://lh3.googleusercontent.com/pw/AM-JKLUnBKcQbvyrcGh5wbQYW2z7pRmEZxss-a5XzliAfBQlsSuS3Dgd1_k7yonnzhdP0P5gDpbcw-DfQQPHoVurX1aFRc04m_dpm8or2nyimPfGkidDt9GmcEtw1u74Mghae4bdkY8MRWZ3yimDvQ48ZCJq=s947-no",
                              fit: BoxFit.contain,
                            ),
                            // Image.asset(
                            //   "assets/rasa_takut.png",
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Rasa Takut",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Baloo Da",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: size.width / 1.75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/decoration/card_terapi_decoration.png",
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight),
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(12)),
                    child: NeumorphicButton(
                      onPressed: () {
                        Get.to(() => Insomnia());
                      },
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.network(
                              "https://lh3.googleusercontent.com/pw/AM-JKLWieom9EYst2dLN_ZfvlE7cHIhQ99T69LxdJs2m5bqpRknCZSdxnzuq_r3SjVgTxrtOdlMD9JGl28pXNKkgFEKc9Wd7zndaS7NSz2bxo9DrYUqjJlHirqxPPLebeJPf0OMHv3MW_GFrA7UkQZc_SNc-=s947-no",
                              fit: BoxFit.contain,
                            ),
                            // Image.asset(
                            //   "assets/insom.png",
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Insomnia",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Baloo Da",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


// Container(
//   height: (size.height + 100) / 6,
//   margin: EdgeInsets.all(10),
//   decoration: BoxDecoration(
//     color: Color.fromRGBO(100, 50, 50, 1),
//     image: DecorationImage(
//       image: AssetImage(
//           "assets/decoration/card_terapi_decoration.png"),
//       fit: BoxFit.contain,
//       alignment: Alignment.topRight,
//     ),
//     borderRadius: BorderRadius.circular(15),
//   ),
//   child: NeumorphicButton(
//     onPressed: () {},
//     provideHapticFeedback: true,
//     style: NeumorphicStyle(
//       shape: NeumorphicShape.concave,
//       boxShape: NeumorphicBoxShape.roundRect(
//         BorderRadius.circular(12),
//       ),
//       depth: 8,
//       lightSource: LightSource.topLeft,
//       color: Colors.transparent,
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Emosi Negatif",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: "Baloo Da",
//                 fontWeight: FontWeight.bold,
//                 fontSize: (size.height + 100 > 600) ? 20 : 12,
//               ),
//             ),
//             Text(
//               "Ketika kamu mengalami suasana\n hati yang buruk seperti sedih,\n kecewa, tidak peduli, secara\n mendalam dan terus menerus",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: "Baloo Da",
//                 fontWeight: FontWeight.bold,
//                 fontSize: (size.height + 100 > 600) ? 10 : 8,
//               ),
//             )
//           ],
//         ),
//         // SvgPicture.asset("assets/ilustrasinegatif.svg"),
//       ],
//     ),
//   ),
// ),
