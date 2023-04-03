import 'package:get/get.dart';

import '../controllers/score_result_controller.dart';

class ScoreResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoreResultController>(
      () => ScoreResultController(),
    );
  }
}
