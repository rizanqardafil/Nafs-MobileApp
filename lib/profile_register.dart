import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nafs/auth_services.dart';
import 'package:nafs/home.dart';
import 'package:nafs/on_boarding/on_boarding_page.dart';
import 'package:nafs/user_services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'models/Users.dart';

enum GenderCharacter { l, p }

class ProfileRegister extends StatefulWidget {
  const ProfileRegister({Key? key}) : super(key: key);

  @override
  _ProfileRegisterState createState() => _ProfileRegisterState();
}

class _ProfileRegisterState extends State<ProfileRegister> {
  bool isFile = false;
  bool isEdit = true;
  File? imageFile;
  String imageLink = "https://drive.google.com/uc?export=download&id=1GBxj98H6KD8wSMWiRQzgBIAQAhbAkMFZ";
  String usia = "";
  String gender = "Laki-laki";
  TextEditingController controller = new TextEditingController();
  TextEditingController usiaController = new TextEditingController();
  GenderCharacter _character = GenderCharacter.l;

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    return Material(
      child: SafeArea(
        child: FutureBuilder(
          future: UserServices.getUser(user!.uid),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                Users data = snapshot.data as Users;
                controller.text = data.name;
                imageLink = data.profilePicture;
                usia = data.usia.toString();
                gender = data.gender;
                isEdit = false;
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileWidget(
                          imagePath: imageLink,
                          imageFile: imageFile,
                          isEdit: isEdit,
                          isFile: isFile,
                          onClicked: () {
                            getImage().then((value) {
                              setState(() {
                                imageFile = value;
                                isFile = true;
                              });
                            });
                          },
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          controller: controller,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              labelText: "Nama",
                              hintText: "Masukkan Nama Anda",
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              suffixIcon: Icon(Icons.account_circle_outlined)),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          controller: usiaController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            labelText: "Usia",
                            hintText: "Masukkan Usia Anda",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.calendar_today_outlined),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Gender",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // width: MediaQuery.of(context).size.width / 2.5,
                              child: RadioListTile<GenderCharacter>(
                                title: const Text('Laki-laki'),
                                value: GenderCharacter.l,
                                groupValue: _character,
                                onChanged: (GenderCharacter? value) {
                                  setState(() {
                                    _character = value!;
                                    gender = "Laki-laki";
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              // width: MediaQuery.of(context).size.width / 2,
                              child: RadioListTile<GenderCharacter>(
                                title: const Text('Perempuan'),
                                value: GenderCharacter.p,
                                groupValue: _character,
                                onChanged: (GenderCharacter? value) {
                                  setState(() {
                                    _character = value!;
                                    gender = "Perempuan";
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        TextFieldWidget(
                          label: 'Email',
                          hint: "Email Anda",
                          icon: Icon(Icons.email_outlined),
                          text: user.email.toString(),
                          onChanged: (email) {},
                          control: false,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          primary: Colors.blue[300],
                        ),
                        child: Text("Simpan"),
                        onPressed: () async {
                          if (!(controller.text.trim() != "" && usiaController.text.trim() != "")) {
                            Get.snackbar(
                              "Pesan",
                              "Mohon isi seluruh data yang diminta",
                              snackPosition: SnackPosition.TOP,
                              isDismissible: false,
                              backgroundColor: Colors.white.withOpacity(0.5),
                              duration: Duration(seconds: 3),
                              margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                              colorText: Colors.black,
                              borderRadius: 0,
                            );
                          } else if (usiaController.text.length >= 3 || !usiaController.text.isNumericOnly) {
                            Get.snackbar(
                              "Pesan",
                              "Mohon isi usia dengan benar",
                              snackPosition: SnackPosition.TOP,
                              isDismissible: false,
                              backgroundColor: Colors.white.withOpacity(0.5),
                              duration: Duration(seconds: 3),
                              margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                              colorText: Colors.black,
                              borderRadius: 0,
                            );
                          } else {
                            if (isFile) {
                              setState(() {});
                              String link = await uploadImage(imageFile);
                              UserServices.saveUser(user.uid, user.email, controller.text, usiaController.text, gender, link);
                              Get.offAll(() => Home(2));
                            } else {
                              setState(() {});
                              UserServices.saveUser(user.uid, user.email, controller.text, usiaController.text, gender, imageLink);
                              Get.offAll(() => Home(2));
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.purple,
                  size: 75,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final String hint;
  final Icon icon;
  final ValueChanged<String> onChanged;
  final bool control;

  const TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.hint,
    required this.icon,
    required this.onChanged,
    required this.control,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        enabled: widget.control,
        decoration: InputDecoration(
            labelText: this.widget.label,
            hintText: this.widget.hint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: this.widget.icon),
        maxLines: widget.maxLines,
      );
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final File? imageFile;
  final bool isEdit;
  final bool isFile;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    this.imageFile,
    this.isFile = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: GestureDetector(
              onTap: onClicked,
              child: buildEditIcon(color),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: (isFile && imageFile != null)
            ? Ink.image(
                image: FileImage(imageFile!),
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: onClicked),
              )
            : Ink.image(
                image: image,
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(onTap: onClicked),
              ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

Future<File?> getImage() async {
  try {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    return File(image!.path);
  } catch (e) {
    return null;
  }
}

//* Method to uploading image to firebase storage
Future<String> uploadImage(File? image) async {
  String fileName = basename(image!.path);

  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  UploadTask task = ref.putFile(image);
  // TaskSnapshot snapshot = await task.onComplete;

  return await (await task).ref.getDownloadURL();
}
