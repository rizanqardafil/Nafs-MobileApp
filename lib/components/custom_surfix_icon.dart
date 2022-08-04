import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    required this.svgIcon,
  });

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        (20 / 375.0) * MediaQuery.of(context).size.width,
        (20 / 375.0) * MediaQuery.of(context).size.width,
        (20 / 375.0) * MediaQuery.of(context).size.width,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: (18 / 375.0) * MediaQuery.of(context).size.width,
      ),
    );
  }
}
