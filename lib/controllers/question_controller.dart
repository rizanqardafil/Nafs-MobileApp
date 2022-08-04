import 'package:flutter/widgets.dart';
import 'package:nafs/models/Questions.dart';
import 'package:nafs/screening/result.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../components/load.dart';

class QuestionController extends GetxController {
  PageController? _pageController;
  PageController get pageController => this._pageController as PageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
          ))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int? _selectedIndex;
  int? get selectedIndex => this._selectedIndex;

  List<int> _answers = [];
  List<int> get answers => this._answers;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController?.dispose();
  }

  void checkedAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _selectedIndex = selectedIndex;
    update();
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _answers.add(_selectedIndex!);
      _selectedIndex = null;
      _questionNumber.value++;
      _pageController?.nextPage(duration: Duration(milliseconds: 10), curve: Curves.linear);
    } else {
      _answers.add(_selectedIndex!);
      print(_answers);
      Get.to(() => Result());
    }
  }
}
