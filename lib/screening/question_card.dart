import 'package:flutter/material.dart';
import 'package:nafs/controllers/question_controller.dart';
import 'package:nafs/models/Questions.dart';
import 'package:nafs/screening/option.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.size,
    required QuestionController questionController,
    required this.question,
  })  : _questionController = questionController,
        super(key: key);

  final Size size;
  final QuestionController _questionController;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          height: size.height * 0.4,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                top: size.height * 0.1,
                left: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    //card pertanyaan
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 60),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xA15AD9).withOpacity(0.25),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          // hiasan hijau merah
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          // urutan pertanyaan
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pertanyaan ",
                                style: TextStyle(color: Colors.purple, fontSize: (size.height < 700) ? 13 : 15),
                              ),
                              Obx(
                                () => Text(
                                  "${_questionController.questionNumber.value}",
                                  style:
                                      TextStyle(color: Colors.purple, fontSize: (size.height < 700) ? 14 : 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                " / 21",
                                style: TextStyle(color: Colors.purple, fontSize: (size.height < 700) ? 13 : 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          // pertanyaan
                          Text(
                            "${question.question}",
                            // maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.purple, fontSize: (size.height < 700) ? 15 : 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //progress circle
              Positioned(
                left: (size.height < 700) ? size.width * 0.5 - 62.5 : size.width * 0.5 - 90,
                top: size.height * 0.04,
                child: Container(
                  width: (size.height < 700) ? 125 : 180,
                  height: (size.height < 700) ? 65 : 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xA15AD9).withOpacity(0.25),
                      )
                    ],
                  ),
                  child: CircularPercentIndicator(
                    radius: (size.height < 700) ? 60.0 : 70.0,
                    lineWidth: 7.0,
                    // animationDuration: 1000,
                    percent: _questionController.questionNumber.value / 21,
                    // animateFromLastPercent: true,
                    // restartAnimation: false,
                    // animation: true,
                    backgroundColor: Colors.white,
                    progressColor: Colors.purple,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Obx(
                      () => new Text(
                        "${_questionController.questionNumber.value}",
                        style:
                            new TextStyle(fontWeight: FontWeight.bold, fontSize: (size.height < 700) ? 16.0 : 20.0, color: Colors.purple),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(children: [
          ...List.generate(
            question.options!.length,
            (index) => Option(
              index: index,
              text: question.options![index],
              press: () => _questionController.checkedAns(question, index),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GetBuilder<QuestionController>(
                  init: QuestionController(),
                  builder: (qnController) {
                    return (qnController.isAnswered)
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              shadowColor: Colors.purple.withOpacity(0.25),
                              elevation: 1,
                              shape: StadiumBorder(),
                              side: BorderSide(color: Colors.white),
                            ),
                            onPressed: () => qnController.nextQuestion(),
                            child: Text("Selanjutnya"),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 1,
                              shape: StadiumBorder(),
                              side: BorderSide(color: Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Selanjutnya",
                              style: TextStyle(color: Colors.transparent),
                            ),
                          );
                  },
                )
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
