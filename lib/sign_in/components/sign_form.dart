import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nafs/auth_services.dart';
import 'package:nafs/home.dart';
import 'package:nafs/screening/start_screening.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../components/custom_surfix_icon.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  bool isPressed = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    retypePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: (30 / 812.0) * MediaQuery.of(context).size.height),
          buildPasswordFormField(),
          SizedBox(height: (30 / 812.0) * MediaQuery.of(context).size.height),
          SizedBox(height: (20 / 812.0) * MediaQuery.of(context).size.height),
          SizedBox(
            width: double.infinity,
            height: (56 / 812.0) * MediaQuery.of(context).size.height,
            child: (isPressed)
                ? SpinKitFadingCircle(
                    color: Colors.purple,
                    size: 50,
                  )
                : FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.purple,
                    onPressed: () async {
                      if (!(emailController.text.trim() != "" && passwordController.text.trim() != "")) {
                        Get.snackbar(
                          "Pesan",
                          "Mohon isi data yang diminta",
                          snackPosition: SnackPosition.TOP,
                          isDismissible: false,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          duration: Duration(seconds: 3),
                          margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                          colorText: Colors.black,
                          borderRadius: 0,
                        );
                      } else if (!(EmailValidator.validate(emailController.text))) {
                        Get.snackbar(
                          "Pesan",
                          "Format email tidak sesuai",
                          snackPosition: SnackPosition.TOP,
                          isDismissible: false,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          duration: Duration(seconds: 3),
                          margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                          colorText: Colors.black,
                          borderRadius: 0,
                        );
                      } else {
                        setState(() {
                          isPressed = !isPressed;
                        });
                        SignInSignUpResult result = await AuthServices.signInEmail(emailController.text, passwordController.text);

                        if (result.user == null) {
                          Get.snackbar(
                            "Pesan",
                            result.message,
                            snackPosition: SnackPosition.TOP,
                            isDismissible: false,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            duration: Duration(seconds: 3),
                            margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                            colorText: Colors.black,
                            borderRadius: 0,
                          );
                          setState(() {
                            isPressed = !isPressed;
                          });
                        } else {
                          Get.offAll(() => Home(2));
                        }
                      }
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(
                        fontSize: (18 / 375.0) * MediaQuery.of(context).size.width,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Masukkan password anda",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Masukkan email anda",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
