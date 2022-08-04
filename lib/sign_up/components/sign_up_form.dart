import 'package:flutter/material.dart';
import 'package:nafs/auth_services.dart';
import 'package:nafs/home.dart';
import 'package:nafs/profile_register.dart';
import 'package:nafs/screening/start_screening.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../components/custom_surfix_icon.dart';
import 'package:email_validator/email_validator.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
          buildConfirmPassFormField(),
          SizedBox(height: (40 / 812.0) * MediaQuery.of(context).size.height),
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
                      if (!(emailController.text.trim() != "" &&
                          passwordController.text.trim() != "" &&
                          retypePasswordController.text.trim() != "")) {
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
                      } else if (passwordController.text != retypePasswordController.text) {
                        Get.snackbar(
                          "Pesan",
                          "Password tidak sama",
                          snackPosition: SnackPosition.TOP,
                          isDismissible: false,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          duration: Duration(seconds: 3),
                          margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                          colorText: Colors.black,
                          borderRadius: 0,
                        );
                      } else if (passwordController.text.length < 6) {
                        Get.snackbar(
                          "Pesan",
                          "Panjang password harus lebih dari 6 karakter",
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
                        // setState(() {
                        //   isPressed = !isPressed;
                        // });
                        // SignInSignUpResult result = await AuthServices.signUpEmail(emailController.text, passwordController.text);
                        // if (result.user == null) {
                        //   Get.snackbar(
                        //     "Pesan",
                        //     result.message,
                        //     snackPosition: SnackPosition.TOP,
                        //     isDismissible: false,
                        //     backgroundColor: Colors.white.withOpacity(0.5),
                        //     duration: Duration(seconds: 3),
                        //     margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                        //     colorText: Colors.black,
                        //     borderRadius: 0,
                        //   );
                        //   setState(() {
                        //     isPressed = !isPressed;
                        //   });
                        // } else {
                        //   Get.offAll(() => ProfileRegister());
                        // }

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              elevation: 16,
                              content: Text(
                                "1.	Aplikasi ini merupakan bentuk penanganan awal untuk mengelola kondisi mental Anda.\n2.	Dilarang untuk menyebarluaskan apapun yang ada di dalam Aplikasi ini.\n3.	Kami selalu menjaga kerahasiaan data yang kamu masukkan.\n4.	Aplikasi ini berada di dalam pengawasan Akademisi dan Praktisi Psikolog.",
                                style: TextStyle(
                                  fontFamily: "Baloo Da",
                                ),
                              ),
                              actions: [
                                Column(
                                  children: [
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Tidak',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            setState(() {
                                              isPressed = !isPressed;
                                            });
                                            Navigator.pop(context);
                                            SignInSignUpResult result =
                                                await AuthServices.signUpEmail(emailController.text, passwordController.text);
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
                                              Get.offAll(() => ProfileRegister());
                                            }
                                          },
                                          child: Text(
                                            'Setuju',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      "Buat Akun",
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

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      controller: retypePasswordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Masukkan lagi password anda",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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
