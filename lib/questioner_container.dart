import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtask/quest_controller.dart';
import 'package:getxtask/resource/test.dart';

class QuestContainer extends GetView<QuestController> {
  const QuestContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 35.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.decreaseIndex();
                    controller.prvQuest(controller.questionCount);

                    // print(controller.answer);
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.increaseIndex();
                    controller.nextQuest(controller.questionCount);
                    // Get.snackbar('title', 'forward', colorText: Colors.black);
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Container(
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      quest.length,
                      (index) => Container(
                            width: 100,
                            color: controller.questionCount + 1 > index
                                ? Colors.yellow
                                : Colors.blueGrey[100],
                          )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(
                'Question ${controller.questionCount + 1}/3',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Container(
                // height: 380,
                width: size.width * 0.87,
                constraints:
                    const BoxConstraints(maxHeight: 430, maxWidth: 400),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.blueGrey.withOpacity(0.15),
                          spreadRadius: 5,
                          blurRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.questions.value.toString(),
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        child: Column(
                            // children: [OptionBtn(size: size, option: 'kd')],
                            children: List.generate(
                                controller.options.length,
                                (index) => OptionBtn(
                                    currentIndex: controller.questionCount + 1,
                                    question:
                                        controller.questions.value.toString(),
                                    option: controller.options[index]))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionBtn extends GetView<QuestController> {
  const OptionBtn({
    Key? key,
    this.option = '',
    this.question = '',
    this.currentIndex,
  }) : super(key: key);

  final int? currentIndex;
  final String option;
  final String question;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // Get.snackbar('my answer', option);

        controller.setuserAnswer(question, option);
        controller.increaseIndex();
        controller.nextQuest(controller.questionCount);
        if (controller.questionCount == 3) {
          print(controller.answer);
        }
      },
      child: Container(
        height: 60,
        width: size.width * 0.77,
        margin: const EdgeInsets.only(bottom: 20),
        constraints: const BoxConstraints(maxWidth: 370),
        decoration: BoxDecoration(
          color: Colors.green[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Text(
            option,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
