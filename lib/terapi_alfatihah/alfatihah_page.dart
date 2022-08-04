import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nafs/terapi_alfatihah/alfatihah_audio1.dart';
import 'package:nafs/terapi_alfatihah/alfatihah_video1.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class AlfatihahPage extends StatelessWidget {
  const AlfatihahPage({Key? key}) : super(key: key);

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
                      color: Colors.amber[100],
                      height: size.height / 3,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/vector4-2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.network(
                      "https://lh3.googleusercontent.com/pw/AM-JKLUbNrW1c-YKsekuKf6URQ2LomX8IboTWZuoxXj183hrQvchqvPEudS--k21t-sJJDMN-MapRBI3HRZSA4kokVOWZLQqZhPuVV-3MKRz0kyFnO31mcdeQzNj6Moubfs8FsbO6OB_S7gTAGmNhGdTWJZJ=s947-no",
                      fit: BoxFit.cover,
                      height: size.height / 3,
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
                      "Al-Fatihah Untuk Tenang",
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
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus bibendum bibendum metus. Nullam scelerisque lacus ipsum, a venenatis mi luctus eu. Vestibulum vitae mattis velit.",
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
                            color: Colors.amber.shade200,
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
                        Divider(
                          thickness: 0.25,
                          color: Colors.grey,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => AlfatihahAudio1());
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.play_circle_outlined,
                              size: 40,
                              color: Colors.amber[600],
                            ),
                            title: Text(
                              "Al-Fatihah Untuk Tenang Sesi 1",
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
                        ListTile(
                          title: Text(
                            "Segera Hadir",
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
}
