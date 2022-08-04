import 'package:flutter/material.dart';

import '../../components/social_card.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (20 / 375.0) * MediaQuery.of(context).size.width),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04), // 4%
                Text(
                  "Buat Akun",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (23 / 315.0) * MediaQuery.of(context).size.width,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Baloo Da",
                  ),
                ),
                Text(
                  "Silahkan isi email dan password atau \n buat akun melalui media sosial",
                  style: TextStyle(
                    fontFamily: "Baloo Da",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SignUpForm(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
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
                SizedBox(
                    height: (20 / 812.0) * MediaQuery.of(context).size.height),
                Text(
                  'By continuing, you confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
