import 'package:flutter/material.dart';
import '../../components/no_account_text.dart';
import '../../components/social_card.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (20 / 315.0) * MediaQuery.of(context).size.width),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "Masuk",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (23 / 315.0) * MediaQuery.of(context).size.width,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Baloo Da",
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Silahkan masuk menggunakan email atau \n akun media sosial anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Baloo Da",
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SignForm(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: (20 / 812.0) * MediaQuery.of(context).size.height),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
