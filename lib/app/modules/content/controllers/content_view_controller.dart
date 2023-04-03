import 'package:carousel_slider/carousel_controller.dart';
import 'package:dk_app_flutter/app/data/models/content_model.dart';
import 'package:get/get.dart';

class ContentViewController extends GetxController {
  RxInt current = 0.obs;
  RxList<Content> contents = [
    Content(
        postContent: "",
        postHeadline: "Train your mindset for a better mood ",
        postIntro:
            "What kind of mindset can make us hold and grasp the key of happiness forever?"),
    Content(
        postContent: "",
        postHeadline: "Fresh scent for home cleaning ",
        postIntro:
            "What kind of mindset can make us hold and grasp the key of happiness forever?"),
    Content(
        postContent: "",
        postHeadline: "How happiness can build a stable relationship",
        postIntro:
            "What kind of mindset can make us hold and grasp the key of happiness forever?"),
  ].obs;

  final CarouselController controller = CarouselController();
  @override
  void onInit() {
    super.onInit();
  }

  void changeSlide(int index) {
    current.value = index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
