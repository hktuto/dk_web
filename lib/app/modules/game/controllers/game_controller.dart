import 'package:get/get.dart';
import 'dart:math';
class GameController extends GetxController {
  final count = 0.0.obs;

  final List<String> good = ['Joy','Passion','Enthusiasm','Belief','Optimism','Hopefulness'];
  final List<String> bad = ['Boredom','Frustration','Disappointment','Worry','Discouragment','Revenge','Jealousy','Fear'];
  @override
  void onInit() {
    super.onInit();
    Random rnd;
    int min = 1;
    int max = 14;
    rnd = new Random();
    count.value = (min + rnd.nextInt(max - min)).toDouble();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setValue(double val) {
    count.value = val;
    update();
  }
}
