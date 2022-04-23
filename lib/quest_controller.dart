import 'package:get/get.dart';
import 'package:getxtask/resource/test.dart';

class QuestController extends GetxController {
  var _q1Question = quest[0]['q1'].toString().obs;
  var _q2Question = ''.obs;

  var selected_Q1_Option = ''.obs;
  var selected_Q2_Option = ''.obs;

  final RxList _q2_options = quest[0]['q2_options'] == null
      ? [].obs
      : List.generate(quest[0]['q2_options'].length,
          (index) => quest[0]['q1_options'][index]).obs;

  final RxList _Q1_Options = List.generate(quest[0]['q1_options'].length,
      (index) => quest[0]['q1_options'][index]).obs;
  // var _new_question

  var _currentIndex = RxInt(0);
  var count = RxInt(0);
  // RxList ops = quest[0]['q1_options'];

  // setter
  set setquestIndex(int index) {
    _q1Question.value = quest[index]['q1'];
    _q2Question.value = quest[index]['q2'] ?? '';
  }

  set setOptionIndex(int index) {
    _Q1_Options.assignAll(quest[index]['q1_options']);
    quest[index]['q2_options'] == null
        ? _q2_options.assignAll([])
        : _q2_options.assignAll(quest[index]['q2_options']);
  }

  var _userAnswer = {}.obs;
  setuserAnswer(key, value) {
    _userAnswer[key] = value;
    // _selected_Q1_Option = value;
  }

  previousQuestion() {
    if (count.value > 0 && count.value <= quest.length) {
      count.value--;
      setquestIndex = count.value;
      setOptionIndex = count.value;
    } else {
      null;
    }
  }

  nextQuestion() {
    if (count.value >= 0 && count.value < quest.length) {
      if (count.value == quest.length - 1) {
        null;
      } else {
        count.value++;
        setquestIndex = count.value;
        setOptionIndex = count.value;
      }
    } else {
      null;
    }
  }

  set setCurrentIndex(currentIndex) {
    _currentIndex.value = currentIndex;
  }

  // getter
  get qn1Options => _Q1_Options;
  get qn2Options => _q2_options;
  get q1Question => _q1Question;
  get q2Question => _q2Question;
  get questionCount => count.value;
  get curentIndex => _currentIndex;
  RxMap get answer => _userAnswer;
  // get list_model_question => _list_Model_Questions;
}
// checkQuestionTwoTrigger(index) {
//   if (quest[index]['q1_options']['q1_trigger'] == _selected_Q1_Option) {
//
//
//
//   }
// }

// nextQuest(indx) {
//   setquestIndex = indx;
//   setOptionIndex = indx;
//   // increaseIndex();
//   setCurrentIndex = indx;
// }
//
// prvQuest(indx) {
//   setquestIndex = indx;
//   setOptionIndex = indx;
//   // increaseIndex();
// }

// List _list_Model_Questions =
//     quest.map((e) => QnModel.FromJson(e)).toList().obs;
//
