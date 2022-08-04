import 'package:flutter/material.dart';

class PaketKonseling extends StatefulWidget {
  const PaketKonseling({Key? key}) : super(key: key);

  @override
  _PaketKonselingState createState() => _PaketKonselingState();
}

class _PaketKonselingState extends State<PaketKonseling> {
  bool onTap1 = true;
  bool onTap2 = false;
  bool onTap3 = false;
  bool onTapChat1 = true;
  bool onTapChat2 = false;
  bool onTapChat3 = false;
  bool onTapChat4 = false;
  bool onTapChat5 = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.purple.shade400.withOpacity(0.25),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
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
                              Container(
                                margin: EdgeInsets.all(20),
                                child: Center(
                                  child: Text(
                                    "Paket Konseling",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Baloo Da",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(0.75),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            // margin: EdgeInsets.all(20),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  width: MediaQuery.of(context).size.width / 3 - 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.purple.shade300, width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 1,
                                        color: (onTap1) ? Colors.purple.shade300 : Colors.transparent,
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        onTap1 = true;
                                        onTap2 = false;
                                        onTap3 = false;
                                      });
                                    },
                                    child: Text(
                                      "Chat",
                                      style: TextStyle(
                                        fontFamily: "Baloo Da",
                                        color: (onTap1) ? Colors.white : Colors.purple,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  width: MediaQuery.of(context).size.width / 3 - 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.purple.shade300, width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 1,
                                        color: (onTap2) ? Colors.purple.shade300 : Colors.transparent,
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        onTap2 = true;
                                        onTap1 = false;
                                        onTap3 = false;
                                      });
                                    },
                                    child: Text(
                                      "Call",
                                      style: TextStyle(
                                        fontFamily: "Baloo Da",
                                        color: (onTap2) ? Colors.white : Colors.purple,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  width: MediaQuery.of(context).size.width / 3 - 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.purple.shade300, width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 1,
                                        color: (onTap3) ? Colors.purple.shade300 : Colors.transparent,
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        onTap3 = true;
                                        onTap2 = false;
                                        onTap1 = false;
                                      });
                                    },
                                    child: Text(
                                      "VidCall",
                                      style: TextStyle(
                                        fontFamily: "Baloo Da",
                                        color: (onTap3) ? Colors.white : Colors.purple,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(bottom: 75),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(
                                Icons.info_rounded,
                                color: Colors.purple,
                                size: 25,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Durasi Konseling per sesi = 60 Menit",
                                style: TextStyle(
                                  fontFamily: "Baloo Da",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          (onTap1)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        "Konseling chat nanti akan dilakukan lewat platform ini bersama Psikolog kami",
                                        style: TextStyle(
                                          fontFamily: "Baloo Da",
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      padding: EdgeInsets.all(5),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Colors.purple.shade300, width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 1,
                                            color: (onTapChat1) ? Colors.purple.shade100.withOpacity(0.5) : Colors.transparent,
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            onTapChat1 = true;
                                            onTapChat2 = false;
                                            onTapChat3 = false;
                                            onTapChat4 = false;
                                            onTapChat5 = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Paket Perkenalan",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Rp50.000/1x Sesi",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  color: Colors.purple,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Masa berlaku 1 minggu",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      padding: EdgeInsets.all(5),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Colors.purple.shade300, width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 1,
                                            color: (onTapChat2) ? Colors.purple.shade100.withOpacity(0.5) : Colors.transparent,
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            onTapChat2 = true;
                                            onTapChat1 = false;
                                            onTapChat3 = false;
                                            onTapChat4 = false;
                                            onTapChat5 = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Paket Mantap",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Rp150.000/4x Sesi",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  color: Colors.purple,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Masa berlaku 1 bulan",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      padding: EdgeInsets.all(5),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Colors.purple.shade300, width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(1, 1),
                                            blurRadius: 1,
                                            color: (onTapChat3) ? Colors.purple.shade100.withOpacity(0.5) : Colors.transparent,
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            onTapChat3 = true;
                                            onTapChat2 = false;
                                            onTapChat1 = false;
                                            onTapChat4 = false;
                                            onTapChat5 = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Paket Keren",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Rp200.000/8x Sesi",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  color: Colors.purple,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Masa berlaku 2 bulan",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : (onTap2)
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Konseling chat nanti akan dilakukan lewat platform Whatsapp bersama Psikolog kami",
                                            style: TextStyle(
                                              fontFamily: "Baloo Da",
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(vertical: 20),
                                            padding: EdgeInsets.all(5),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.purple.shade300, width: 2),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(1, 1),
                                                  blurRadius: 1,
                                                  color: (onTapChat1) ? Colors.purple.shade100.withOpacity(0.5) : Colors.transparent,
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  onTapChat1 = true;
                                                  onTapChat2 = false;
                                                  onTapChat3 = false;
                                                  onTapChat4 = false;
                                                  onTapChat5 = false;
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Paket Perkenalan",
                                                      style: TextStyle(
                                                        fontFamily: "Baloo Da",
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Rp50.000/1x Sesi",
                                                      style: TextStyle(
                                                        fontFamily: "Baloo Da",
                                                        color: Colors.purple,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Masa berlaku 1 minggu",
                                                      style: TextStyle(
                                                        fontFamily: "Baloo Da",
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(vertical: 20),
                                            padding: EdgeInsets.all(5),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.purple.shade300, width: 2),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(1, 1),
                                                  blurRadius: 1,
                                                  color: (onTapChat2) ? Colors.purple.shade100.withOpacity(0.5) : Colors.transparent,
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  onTapChat2 = true;
                                                  onTapChat1 = false;
                                                  onTapChat3 = false;
                                                  onTapChat4 = false;
                                                  onTapChat5 = false;
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Paket Mantap",
                                                      style: TextStyle(
                                                        fontFamily: "Baloo Da",
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Rp150.000/4x Sesi",
                                                      style: TextStyle(
                                                        fontFamily: "Baloo Da",
                                                        color: Colors.purple,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Masa berlaku 1 bulan",
                                                      style: TextStyle(
                                                        fontFamily: "Baloo Da",
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(vertical: 20),
                                            padding: EdgeInsets.all(5),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.purple.shade300, width: 2),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(1, 1),
                                                  blurRadius: 1,
                                                  color: (onTapChat3) ? Colors.purple.shade100.withOpacity(0.5) : Colors.transparent,
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  onTapChat3 = true;
                                                  onTapChat2 = false;
                                                  onTapChat1 = false;
                                                  onTapChat4 = false;
                                                  onTapChat5 = false;
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Paket Keren",
                                                      style: TextStyle(
                                                        fontFamily: "Baloo Da",
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Rp200.000/8x Sesi",
                                                      style: TextStyle(
                                                        fontFamily: "Baloo Da",
                                                        color: Colors.purple,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Masa berlaku 2 bulan",
                                                      style: TextStyle(
                                                        fontFamily: "Baloo Da",
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : (onTap3)
                                      ? Padding(
                                          padding: const EdgeInsets.only(top: 10.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Konseling Vidcall nanti akan dilakukan lewat platform Zoom bersama Psikolog kami",
                                                style: TextStyle(
                                                  fontFamily: "Baloo Da",
                                                  // fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(vertical: 20),
                                                padding: EdgeInsets.all(5),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.purple.shade300, width: 2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(1, 1),
                                                      blurRadius: 1,
                                                      color: (onTapChat1) ? Colors.purple.shade100.withOpacity(0.5) : Colors.transparent,
                                                    ),
                                                  ],
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      onTapChat1 = true;
                                                      onTapChat2 = false;
                                                      onTapChat3 = false;
                                                      onTapChat4 = false;
                                                      onTapChat5 = false;
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Paket Perkenalan",
                                                          style: TextStyle(
                                                            fontFamily: "Baloo Da",
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Rp50.000/1x Sesi",
                                                          style: TextStyle(
                                                            fontFamily: "Baloo Da",
                                                            color: Colors.purple,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Masa berlaku 1 minggu",
                                                          style: TextStyle(
                                                            fontFamily: "Baloo Da",
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(vertical: 20),
                                                padding: EdgeInsets.all(5),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.purple.shade300, width: 2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(1, 1),
                                                      blurRadius: 1,
                                                      color: (onTapChat2) ? Colors.purple.shade100.withOpacity(0.5) : Colors.transparent,
                                                    ),
                                                  ],
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      onTapChat2 = true;
                                                      onTapChat1 = false;
                                                      onTapChat3 = false;
                                                      onTapChat4 = false;
                                                      onTapChat5 = false;
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Paket Mantap",
                                                          style: TextStyle(
                                                            fontFamily: "Baloo Da",
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Rp150.000/4x Sesi",
                                                          style: TextStyle(
                                                            fontFamily: "Baloo Da",
                                                            color: Colors.purple,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Masa berlaku 1 bulan",
                                                          style: TextStyle(
                                                            fontFamily: "Baloo Da",
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(vertical: 20),
                                                padding: EdgeInsets.all(5),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.purple.shade300, width: 2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(1, 1),
                                                      blurRadius: 1,
                                                      color: (onTapChat3) ? Colors.purple.shade100.withOpacity(0.5) : Colors.transparent,
                                                    ),
                                                  ],
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      onTapChat3 = true;
                                                      onTapChat2 = false;
                                                      onTapChat1 = false;
                                                      onTapChat4 = false;
                                                      onTapChat5 = false;
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Paket Keren",
                                                          style: TextStyle(
                                                            fontFamily: "Baloo Da",
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Rp200.000/8x Sesi",
                                                          style: TextStyle(
                                                            fontFamily: "Baloo Da",
                                                            color: Colors.purple,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Masa berlaku 2 bulan",
                                                          style: TextStyle(
                                                            fontFamily: "Baloo Da",
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[400],
                  ),
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {},
                    child: Text(
                      "Beli Paket Ini",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: " Baloo da",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
