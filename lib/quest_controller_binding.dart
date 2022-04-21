import 'package:get/get.dart';
import 'package:getxtask/quest_controller.dart';

class QuestControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestController());
  }
}
