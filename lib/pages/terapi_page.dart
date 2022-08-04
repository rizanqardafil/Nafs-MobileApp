import 'package:flutter/material.dart';
import 'package:nafs/terapi_alfatihah/alfatihah_page.dart';
import 'package:nafs/terapi_istighfar/istighfar_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class TerapiPage extends StatelessWidget {
  const TerapiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Terapi Mengelola Stres",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              "Kamu dapat memilih salah satu terapi di bawah ini untuk mengurangi tingkat stresmu",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                // fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            height: size.height / 4,
            margin: EdgeInsets.only(bottom: 30),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: size.width / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://cf.shopee.co.id/file/28ed5daaeedca4509f973cb6f04b55f7",
                        ),
                        fit: BoxFit.scaleDown,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: NeumorphicButton(
                      onPressed: () {
                        Get.to(() => IstighfarPage());
                      },
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 1,
                        lightSource: LightSource.topLeft,
                        color: Colors.transparent,
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Istighfar",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: size.width / 2,
                    child: NeumorphicButton(
                      onPressed: () {},
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.cyan[600],
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Sholat",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: size.width / 2,
                    child: NeumorphicButton(
                      onPressed: () {},
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.pink[400],
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Membaca Al-Qur'an",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Terapi Mengelola Depresi",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              "Kamu dapat memilih salah satu terapi di bawah ini untuk mengurangi tingkat depresimu",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                // fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            height: size.height / 4,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: size.width / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://islamkita.co/wp-content/uploads/2020/06/tafsir-surat-al-fatihah-1280x720.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: NeumorphicButton(
                      onPressed: () {
                        Get.to(() => AlfatihahPage());
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
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Al-Fatihah",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.75),
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: size.width / 2,
                    child: NeumorphicButton(
                      onPressed: () {},
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.cyan[600],
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Sholat",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: size.width / 2,
                    child: NeumorphicButton(
                      onPressed: () {},
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.pink[400],
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Membaca Al-Qur'an",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Terapi Mengelola Cemas",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Lorem Ipsum",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                // fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            height: size.height / 4,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: size.width / 2,
                    child: NeumorphicButton(
                      onPressed: () {},
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.amber[600],
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Dzikir",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: size.width / 2,
                    child: NeumorphicButton(
                      onPressed: () {},
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.cyan[600],
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Sholat",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: size.width / 2,
                    child: NeumorphicButton(
                      onPressed: () {},
                      provideHapticFeedback: true,
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        depth: 2,
                        lightSource: LightSource.topLeft,
                        color: Colors.pink[400],
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Membaca Al-Qur'an",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Baloo Da",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
