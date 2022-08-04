import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    required this.icon,
    required this.press,
  });

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press;
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: (10 / 375.0) * MediaQuery.of(context).size.width),
        padding:
            EdgeInsets.all((12 / 375.0) * MediaQuery.of(context).size.width),
        height: (50 / 812.0) * MediaQuery.of(context).size.height,
        width: (50 / 375.0) * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
