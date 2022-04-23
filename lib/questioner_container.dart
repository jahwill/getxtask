import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtask/quest_controller.dart';
import 'package:getxtask/resource/test.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
                    controller.previousQuestion();
                    // controller.prvQuest(controller.questionCount);

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
                    controller.nextQuestion();
                    // controller.nextQuest(controller.questionCount);
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
                width: size.width * 0.65,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      questions_list.length,
                      (index) => Container(
                            width:
                                (size.width * 0.6 / questions_list.length) - 5,
                            decoration: BoxDecoration(
                              color: controller.questionCount + 1 > index
                                  ? Colors.yellow
                                  : Colors.blueGrey[100],
                            ),
                            constraints: const BoxConstraints(
                                minWidth: 20, maxWidth: 100),
                          )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(
                'Question ${controller.questionCount + 1}/${questions_list.length}',
                style: const TextStyle(
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
                        controller.q1Question.value.toString(),
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
                                controller.qn1Options.length,
                                (index) => OptionBtn(
                                    currentIndex: controller.questionCount,
                                    question:
                                        controller.q1Question.value.toString(),
                                    option: controller.qn1Options[index]))),
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
  const OptionBtn(
      {Key? key,
      this.option = '',
      this.question = '',
      this.currentIndex,
      this.onTap})
      : super(key: key);

  final int? currentIndex;
  final String option;
  final String question;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap ??
          () async {
            controller.setuserAnswer(question, option);
            controller.selected_Q1_Option.value = option; //set selecte option
            controller.selected_Q2_Option.value = option; //set selecte option
            ///call the next line method first before moving to the next base question
            // await checkQuestionTwoTrigger(currentIndex!, context);
            if (questions_list[currentIndex!]["q1_trigger"] ==
                controller.selected_Q1_Option.value) {
              await buildShowMaterialModalBottomSheet(context, size);
            }
            {
              null;
            }
            controller.nextQuestion();
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

  Future<dynamic> buildShowMaterialModalBottomSheet(
      BuildContext context, Size size) {
    return showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => Container(
              // height: 680,
              width: size.width * 0.87,
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        color: Colors.blueGrey.withOpacity(0.15),
                        spreadRadius: 5,
                        blurRadius: 10)
                  ],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.q2Question.value.toString(),
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                          children: List.generate(
                              controller.qn2Options.length,
                              (i) => OptionBtn(
                                  onTap: () {
                                    Get.back();
                                    controller.setuserAnswer(question, option);
                                    if (currentIndex! < questions_list.length) {
                                      controller.nextQuestion();
                                    } else {
                                      null;
                                    }
                                  },
                                  currentIndex: controller.questionCount + 1,
                                  question:
                                      controller.q1Question.value.toString(),
                                  option: controller.qn2Options[i])))
                    ],
                  ),
                ),
              ),
            ));
  }

  // Future<dynamic>? checkQuestionTwoTrigger(int index, context) {
  //   print(index);
  //   if (questions_list[index]["q1_trigger"] ==
  //       controller.selected_Q1_Option.value) {
  //     return showMaterialModalBottomSheet(
  //         context: context,
  //         backgroundColor: Colors.transparent,
  //         builder: (BuildContext context) => Container(
  //               // height: 680,
  //               width: size(context).width * 0.87,
  //               constraints: const BoxConstraints(maxWidth: 400),
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   boxShadow: [
  //                     BoxShadow(
  //                         offset: const Offset(0, 0),
  //                         color: Colors.blueGrey.withOpacity(0.15),
  //                         spreadRadius: 5,
  //                         blurRadius: 10)
  //                   ],
  //                   borderRadius: const BorderRadius.only(
  //                       topRight: Radius.circular(15),
  //                       topLeft: Radius.circular(5))),
  //               child: Padding(
  //                 padding:
  //                     const EdgeInsets.only(top: 20.0, left: 20, right: 20),
  //                 child: SingleChildScrollView(
  //                   child: Column(
  //                     // crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         controller.q2Question.value.toString(),
  //                         style: TextStyle(
  //                             color: Colors.grey[700],
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.w700),
  //                       ),
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Column(
  //                           children: List.generate(
  //                               controller.qn2Options.length,
  //                               (i) => OptionBtn(
  //                                   onTap: () {
  //                                     Get.back();
  //                                     controller.setuserAnswer(
  //                                         question, option);
  //                                     if (currentIndex! <
  //                                         questions_list.length) {
  //                                       controller.nextQuestion();
  //                                     } else {
  //                                       null;
  //                                     }
  //                                   },
  //                                   currentIndex: controller.questionCount + 1,
  //                                   question:
  //                                       controller.q1Question.value.toString(),
  //                                   option: controller.qn2Options[i])))
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ));
  //   } else {
  //     return null;
  //   }
  // }
}
