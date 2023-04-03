import 'package:get/get.dart';

import '../controllers/game_intro_controller.dart';

class GameIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameIntroController>(
      () => GameIntroController(),
    );
  }
}
