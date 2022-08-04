import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nafs/home.dart';
import 'package:nafs/riwayat_services.dart';
import 'package:nafs/screening/screening.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class StartScreening extends StatefulWidget {
  const StartScreening({Key? key}) : super(key: key);

  @override
  _StartScreeningState createState() => _StartScreeningState();
}

class _StartScreeningState extends State<StartScreening> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => new CupertinoAlertDialog(
          title: new Text("Pesan"),
          content: new Text(
              "Ayo periksa tingkat depresi, stres, dan cemas mu! Jawablah pertanyaan sesuai kondisimu saat ini ya! Jangan khawatir! Hanya kamu yang dapat melihat hasilnya"),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: new Text("Tutup"),
              onPressed: () => Navigator.pop(context, "Tutup"),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(142, 151, 253, 1),
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 40, right: 20),
              child: Text(
                "Lewati",
                textAlign: TextAlign.end,
                style: TextStyle(fontFamily: "Baloo Da", color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              Get.off(() => Home(2));
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset("assets/lottie/animasi.json",
                    width: MediaQuery.of(context).size.width * 0.75, height: MediaQuery.of(context).size.height * 0.5),
              ),
              Text(
                "Ayo Periksakan Dirimu !",
                style: TextStyle(fontFamily: "Baloo Da", color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width / 3,
                child: ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      "Perhatian",
                      "Jawaban Yang Sudah Terpilih Tidak Bisa Diubah Lagi",
                      snackPosition: SnackPosition.BOTTOM,
                      isDismissible: false,
                      backgroundColor: Colors.white.withOpacity(0.75),
                      duration: Duration(seconds: 3),
                      margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                      colorText: Colors.black,
                      borderRadius: 0,
                    );
                    Future.delayed(Duration(seconds: 3), () {
                      Get.to(() => Screening());
                    });
                  },
                  child: Text(
                    "Mulai",
                    style: TextStyle(fontFamily: "Baloo Da", fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[200],
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
