import 'package:flutter/material.dart';
import 'package:nafs/konseling/paket_konseling.dart';
import 'package:get/get.dart';

class KonselingPage extends StatelessWidget {
  const KonselingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Topik Konseling",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Baloo Da",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Ayo mulai konseling pada topik pilihanmu",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Baloo Da",
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width / 2) - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        color: Colors.red.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Get.to(() => PaketKonseling());
                    },
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          // "https://lh3.googleusercontent.com/pw/AM-JKLUbNrW1c-YKsekuKf6URQ2LomX8IboTWZuoxXj183hrQvchqvPEudS--k21t-sJJDMN-MapRBI3HRZSA4kokVOWZLQqZhPuVV-3MKRz0kyFnO31mcdeQzNj6Moubfs8FsbO6OB_S7gTAGmNhGdTWJZJ=s947-no",
                          "https://lh3.googleusercontent.com/pw/AM-JKLUBCFeepskBgsPyRBYVbzcouzBvR-lTgd1ax8QI64Y7X-aQYO7-TaR-w8iSukgvnGf7vEPSPPj4FGNKBTvjgwe0S2c80cCgZr9MOIlOfFDiMezmQaV34OHutqqXH8HXT009gFYWcA6I7fZSjARiy6eG=s947-no",

                          width: 50,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Stres",
                          style: TextStyle(
                            fontFamily: "Baloo Da",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width / 2) - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        color: Colors.green.withOpacity(0.5),
                      ),
                    ],
                    // color: Colors.red[300],
                  ),
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Get.to(() => PaketKonseling());
                    },
                    child: Row(
                      children: <Widget>[
                        Image.network(
                          "https://lh3.googleusercontent.com/pw/AM-JKLUbNrW1c-YKsekuKf6URQ2LomX8IboTWZuoxXj183hrQvchqvPEudS--k21t-sJJDMN-MapRBI3HRZSA4kokVOWZLQqZhPuVV-3MKRz0kyFnO31mcdeQzNj6Moubfs8FsbO6OB_S7gTAGmNhGdTWJZJ=s947-no",
                          width: 50,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Depresi",
                          style: TextStyle(
                            fontFamily: "Baloo Da",
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 40,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            // color: Colors.amber,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  color: Colors.purple.withOpacity(0.5),
                ),
              ],
              // color: Colors.red[300],
            ),
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                Get.to(() => PaketKonseling());
              },
              child: Row(
                children: <Widget>[
                  Image.network(
                    "https://lh3.googleusercontent.com/pw/AM-JKLWtVoKGeBNfSKnb5Mf-t7WQkCJp21iqzq00mN5xx9OjihWL_usne4VQvM0ynlXpTbrZ4c2KvqLJL_gXsLtO27ih0hq8Qb1UqT5Xh4szGL7VdwLR_dC4XukuzpknhlEOBnr3QQVwjZrnxdwqj29kIhGa=s947-no",

                    // "https://lh3.googleusercontent.com/pw/AM-JKLUbNrW1c-YKsekuKf6URQ2LomX8IboTWZuoxXj183hrQvchqvPEudS--k21t-sJJDMN-MapRBI3HRZSA4kokVOWZLQqZhPuVV-3MKRz0kyFnO31mcdeQzNj6Moubfs8FsbO6OB_S7gTAGmNhGdTWJZJ=s947-no",
                    width: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cemas",
                    style: TextStyle(
                      fontFamily: "Baloo Da",
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Alur Konseling",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Baloo Da",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 16,
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                  Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 170),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Selengkapnya"),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(20, 20),
                  blurRadius: 1,
                  color: Colors.purple.withOpacity(0.25),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Alur("Pilih topik permasalah yang ingin didiskusikan", 1, 130),
                Alur("Pilih paket dan selesaikan pembayaran", 2, 130),
                Alur("Tunggu Psikolog kami menyapamu (Maksimal 1x12 jam)", 3, 130),
                Alur("Diskusikan jadwal sesi bersama Psikolog pilihanmu", 4, 130),
                Alur("Selamat Berproses", 5, 130),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Psikolog Kami",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Baloo Da",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Kami memiliki banyak Psikolog berpengalaman yang siap membantu Anda",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Baloo Da",
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ContainerWidget("assets/1.png", "Ahmad Fauzan, M.Psi, Psikolog", "5 tahun", ""),
          ContainerWidget("assets/2.png", "Hadi Harahap, M.Psi, Psikolog", "6 tahun", ""),
          ContainerWidget("assets/3.png", "Faishal Subianto, M.Psi, Psikolog", "7 tahun", ""),
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  color: Colors.grey.withOpacity(0.25),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.people_outline_outlined,
                  size: 40,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 260,
                  child: Text(
                    "Dan masih banyak lagi Psikolog lainnya yang siap membantumu",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Baloo Da",
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Testimoni",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        color: Colors.grey.withOpacity(0.25),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Anonim", style: TextStyle(fontFamily: "Baloo Da", fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(
                            width: 40,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Alhamdulillah, aplikasi ini sangat membantu",
                        style: TextStyle(fontFamily: "Baloo Da"),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        color: Colors.grey.withOpacity(0.25),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Anonim", style: TextStyle(fontFamily: "Baloo Da", fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(
                            width: 40,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Saya merasa lebih baik setelah menggunakan aplikasi ini",
                        style: TextStyle(fontFamily: "Baloo Da"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  ContainerWidget(this.image, this.nama, this.pengalaman, this.spesialis);

  final String image;
  final String nama;
  final String pengalaman;
  final String spesialis;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.25),
          )
        ],
      ),
      child: Psikolog(image, nama, pengalaman),
    );
  }
}

class Psikolog extends StatelessWidget {
  Psikolog(this.image, this.nama, this.pengalaman);

  final String image;
  final String nama;
  final String pengalaman;
  // final String spesialis;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          image,
          width: 75,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: TextStyle(fontFamily: "Baloo Da", fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.access_time_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  pengalaman,
                  style: TextStyle(fontFamily: "Baloo Da", fontWeight: FontWeight.bold),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                // Text(
                //   " | ",
                //   style: TextStyle(fontFamily: "Baloo Da"),
                // ),
                // Text(
                //   spesialis,
                //   style: TextStyle(fontFamily: "Baloo Da"),
                // ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class Alur extends StatelessWidget {
  Alur(this.text, this.num, this.size);
  final String text;
  final int num;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple[100],
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
          SizedBox(
            width: MediaQuery.of(context).size.width - size,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Baloo Da",
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
