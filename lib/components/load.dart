import 'package:flutter/material.dart';
import 'package:nafs/screening/result.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'dart:math';

class Load extends StatelessWidget {
  const Load({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random rand = new Random();

    Future.delayed(Duration(seconds: rand.nextInt(4)), () {
      Get.offAll(() => Result());
    });
    return Container(
      color: Colors.white,
      child: Lottie.asset(
        "assets/lottie/loader.json",
      ),
    );
  }
}
