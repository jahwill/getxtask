import 'package:get/get.dart';
import 'package:getxtask/resource/test.dart';

class QuestController extends GetxController {
  var _question = quest[0]['q1'].toString().obs;
  RxList ops = List.generate(quest[0]['q1_options'].length,
      (index) => quest[0]['q1_options'][index]).obs;
  var _currentIndex = RxInt(0);
  var count = RxInt(0);
  // RxList ops = quest[0]['q1_options'];

  // setter
  set setquestIndex(int index) {
    _question.value = quest[index]['q1'];
  }

  set setOptionIndex(int index) {
    ops.assignAll(quest[index]['q1_options']);
  }

  var _userAnswer = {}.obs;

  setuserAnswer(key, value) {
    _userAnswer[key] = value;
  }

  nextQuest(indx) {
    setquestIndex = indx;
    setOptionIndex = indx;
    // increaseIndex();
    setCurrentIndex = indx;
  }

  prvQuest(indx) {
    setquestIndex = indx;
    setOptionIndex = indx;
    // increaseIndex();
  }

  decreaseIndex() {
    if (count.value != 0) {
      count.value--;
    } else {
      null;
    }
  }

  increaseIndex() {
    if (count.value < quest.length) {
      if (count.value == quest.length - 1) {
        null;
      } else {
        count.value++;
      }
    } else {
      null;
    }
  }

  set setCurrentIndex(currentIndex) {
    _currentIndex.value = currentIndex;
  }

  // getter
  get options => ops;
  // get options => ops.map((e) => e).toList();
  get questions => _question;
  get questionCount => count.value;
  get curentIndex => _currentIndex;
  RxMap get answer => _userAnswer;
}
