import 'package:get/get.dart';

class SmileScoreController extends GetxController {
  //TODO: Implement SmileScoreController

  final count = 0.obs;
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
  void increment() => count.value++;
}
