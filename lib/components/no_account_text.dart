import 'package:flutter/material.dart';
import 'package:nafs/sign_up/sign_up_screen.dart';
import 'package:get/get.dart';

class NoAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Belum punya akun? ",
          style: TextStyle(fontSize: (16 / 375.0) * MediaQuery.of(context).size.width),
        ),
        GestureDetector(
          onTap: () => Get.to(SignUpScreen()),
          child: Text(
            "Buat akun",
            style: TextStyle(fontSize: (16 / 375.0) * MediaQuery.of(context).size.width, color: Colors.purple),
          ),
        ),
      ],
    );
  }
}
