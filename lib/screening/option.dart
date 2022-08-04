import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nafs/controllers/question_controller.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);
  final String? text;
  final int? index;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 10, right: 20, left: 20),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height < 800 ? 16 : 20),
            decoration: BoxDecoration(
              border: (index == qnController.selectedIndex) ? Border.all(color: Colors.purple) : Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$text",
                  style: TextStyle(
                      color: (index == qnController.selectedIndex) ? Colors.purple : Colors.grey,
                      fontSize: (MediaQuery.of(context).size.height < 800) ? 14 : 16),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: (index == qnController.selectedIndex) ? Colors.purple : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: (index == qnController.selectedIndex) ? Colors.purple : Colors.grey),
                  ),
                  child: (index == qnController.selectedIndex)
                      ? Icon(
                          Icons.done,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
