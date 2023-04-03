import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class RegisterFLowController extends GetxController {
  RxBool running = false.obs;
  RxInt currentStep = 0.obs;
  RxList<String> routes = [
    Routes.GAME_INTRO,
    Routes.UI_INTRO,
    Routes.BREATH_REGISTER_FLOW,
    Routes.BREATH_QUESTION,
    Routes.ROAD_MAP,
    Routes.DREAM_INTRO,
    Routes.DREAM_LIST,
    Routes.ROAD_MAP,
    Routes.SMILE_INTRO,
    Routes.FACE_DETECTION,
    Routes.ROAD_MAP,
    // Routes.STRENGTH_INTRO,
    Routes.STRENGTH_LIST,
    Routes.ROAD_MAP,
    Routes.EMOTION_INTRO,
    Routes.CONFRIM_EMOTION,
    Routes.WHEEL_INTRO,
    Routes.WHEEL_OF_LIFE,
    Routes.ROAD_MAP,
  ].obs;

  RouterController router = Get.find<RouterController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void navigateToCurrentState() {
    // map steps
    List<int> mapList = [4, 7, 10, 12, 17];
    if (mapList.contains(currentStep.value)) {
      router.offPageWithProps(routes.value[currentStep.value],
          {"step": mapList.indexOf(currentStep.value)});
    } else {
      router.offPage(routes.value[currentStep.value]);
    }
  }

  void startFlow() {
    running.value = true;
    update();
    navigateToCurrentState();
  }

  void shouldGoNextStep(String cancelRoute) {
    if (running.isTrue) {
      nextStep();
    } else {
      router.offPage(cancelRoute);
    }
  }

  void nextStep() {
    currentStep.value++;
    update();
    if (currentStep.value == routes.length) {
      router.offPage(Routes.MAIN);
      return;
    }
    navigateToCurrentState();
  }
}
