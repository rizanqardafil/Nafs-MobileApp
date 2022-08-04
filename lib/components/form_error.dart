import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length,
          (index) => formErrorText(error: errors[index], context: context)),
    );
  }

  Row formErrorText({required String error, required BuildContext context}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: (14 / 375.0) * MediaQuery.of(context).size.width,
          width: (14 / 375.0) * MediaQuery.of(context).size.width,
        ),
        SizedBox(
          width: (10 / 375.0) * MediaQuery.of(context).size.width,
        ),
        Text(error),
      ],
    );
  }
}
