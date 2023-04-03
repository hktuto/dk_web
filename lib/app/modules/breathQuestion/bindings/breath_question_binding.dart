import 'package:get/get.dart';

import '../controllers/breath_question_controller.dart';

class BreathQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathQuestionController>(
      () => BreathQuestionController(),
    );
  }
}
