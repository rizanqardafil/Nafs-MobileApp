import 'package:flutter/material.dart';
import 'package:nafs/on_boarding/on_boarding_content.dart';
import 'package:nafs/sign_in/sign_in_screen.dart';
import 'package:nafs/screening/start_screening.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool masuk = false;
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Membantumu melewati masa-masa sulit \nuntuk kembali bangkit",
      "image":
          "https://lh3.googleusercontent.com/pw/AM-JKLUJ63wkdoj4uH5wz-hr-Ozh07bPZWgyhsGGLRiwKIlgdSsPvvnIduCDf90GyKRC-R3jFjI-Axf7Edqm8zA1eTka7fYe2yXTntw2sH3paghNYd-3d89QhnJTQ2vJCZNfTKPnAbgJmWkUBeZNtT1bvRfZ=s947-no"
    },
    {
      "text": "Menggunakan pendekatan psikologi Islam untuk memahami dan memperbaiki kondisi diri",
      "image":
          "https://lh3.googleusercontent.com/pw/AM-JKLVISAlWF4dNA4kVg89pc_0hJWayFDK3zbUkCDCI2ZDU5BCizUzoDTtVhSLeG27jUPIe229RmbihtwOUN2eotwgOO7mMbc6mKMm58Yo22019nNwk2CbGVkwN5vN4Aai8wvQFXtkcoGhjRxCe2Ttw3LpL=s947-no"
    },
    {
      "text": "Mendampingi dan memberikan berbagai rekomendasi solusi, layaknya teman sejati yang selalu ada untukmu",
      "image":
          "https://lh3.googleusercontent.com/pw/AM-JKLWLy4dLelszb2PENvlg2nlLLoxXBNwccC9x9FHYf8taToMzbxccBXtIvdzExmg0Ni88UOUdtDjZE5ZKQkyAoSsnv86TDuEhXsYJyJLMJIgzHlGy8Xt5DMUFSAwSfgagIGP4Z9iDqARBAVfwwL6wqODr=s947-no"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            // GestureDetector(
            //   child: Container(
            //     alignment: Alignment.topRight,
            //     margin: EdgeInsets.only(top: 20, right: 20),
            //     child: Text(
            //       "Lewati",
            //       textAlign: TextAlign.end,
            //       style: TextStyle(
            //           fontFamily: "Baloo Da",
            //           color: Colors.purple,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold),
            //     ),
            //   ),
            //   onTap: () {
            //     Get.off(() => StartScreening());
            //   },
            // ),
            SizedBox(
              height: 50,
            ),
            // Text(
            //   "nafs",
            //   style: TextStyle(fontSize: 36, color: Colors.purple, fontWeight: FontWeight.bold, fontFamily: "Baloo Da"),
            // ),
            Image.asset("assets/logo.png", width: MediaQuery.of(context).size.width / 8),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                      if (value == 2) {
                        masuk = true;
                      }
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => OnBoardingContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 1),
                    (masuk)
                        ? Container(
                            width: double.infinity,
                            height: 50,
                            child: NeumorphicButton(
                              onPressed: () {
                                Get.to(() => SignInScreen());
                              },
                              provideHapticFeedback: true,
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(12),
                                ),
                                depth: 1,
                                lightSource: LightSource.right,
                                color: Colors.purple,
                              ),
                              child: Text(
                                "Masuk",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: "Baloo Da", color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : SizedBox(),
                    // Spacer(),
                    // Container(
                    //   width: double.infinity,
                    //   height: (56 / 812.0) * MediaQuery.of(context).size.height,
                    //   child: NeumorphicButton(
                    //     onPressed: () {
                    //       Get.off(() => StartScreening());
                    //     },
                    //     provideHapticFeedback: true,
                    //     style: NeumorphicStyle(
                    //       shape: NeumorphicShape.concave,
                    //       boxShape: NeumorphicBoxShape.roundRect(
                    //         BorderRadius.circular(12),
                    //       ),
                    //       depth: 1,
                    //       lightSource: LightSource.right,
                    //       color: Colors.purple,
                    //     ),
                    //     child: Text(
                    //       "Lewati",
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //           fontFamily: "Baloo Da",
                    //           color: Colors.white,
                    //           fontSize: 20,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.purple : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
