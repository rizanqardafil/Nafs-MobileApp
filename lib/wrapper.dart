import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafs/home.dart';
import 'package:nafs/on_boarding/on_boarding_page.dart';
import 'package:nafs/pages/home_page.dart';
import 'package:nafs/screening/start_screening.dart';
import 'package:nafs/sign_in/components/sign_form.dart';
import 'package:nafs/sign_in/sign_in_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return (user == null) ? OnBoarding() : Home(2);
  }
}
