import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    required this.text,
    required this.image,
  });
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // Spacer(),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Baloo Da",
            fontSize: 16,
          ),
        ),
        Image.network(
          image!,
          // width: double.infinity,
          // height: MediaQuery.of(context).size.height / 2,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
