import 'package:flutter/material.dart';
import 'package:nafs/controllers/question_controller.dart';
import 'package:nafs/screening/question_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Screening extends StatelessWidget {
  const Screening({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuestionController _questionController = Get.put(QuestionController());

    return Scaffold(
      body: Stack(
        children: [
          // background ungu
          Container(
            height: size.height * 0.25,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
              child: SvgPicture.asset(
                "assets/decoration/bgscreening.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          //card pertanyaan
          PageView.builder(
            controller: _questionController.pageController,
            physics: NeverScrollableScrollPhysics(),
            // onPageChanged: _questionController.updateTheQnNum,
            itemCount: _questionController.questions.length,
            itemBuilder: (context, index) => QuestionCard(
              size: size,
              questionController: _questionController,
              question: _questionController.questions[index],
            ),
          )
        ],
      ),
    );
  }
}
