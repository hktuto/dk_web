import 'dart:convert';

import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/providers/strength_provider.dart';
import 'package:dk_app_flutter/app/modules/strength_list/controllers/strength_list_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class StrengthCreateController extends GetxController {
  StrengthProvider provider = Get.put(StrengthProvider());
  UserController userController = Get.find<UserController>();
  RouterController router = Get.find<RouterController>();
  StrengthListController listController = Get.find<StrengthListController>();
  RxBool loading = false.obs;
  RxList<String> labels = <String>[
    "Zest",
    "FriendShip",
    "Gratitude",
    "Love",
    "Perseverance",
    "Creativity",
    "Curiosity",
    "Love_of_Learning",
    "Fairness",
    "Humor",
    "Bravery",
    "Hope",
    "Self-Control",
    "Leadership",
    "Kindness",
    "Appreciation_of_Beauty",
    "Humility",
    "Honesty",
    "Prudence",
    "Judgment",
    "Perspective",
    "Teamwork",
    "Forgiveness",
    "Sense_of_Meaning"
  ].obs;

  RxList<String> selectedItems = <String>[].obs;

  void selected(label) {
    int index = selectedItems.indexOf(label);
    if (index == -1) {
      selectedItems.add(label);
    }
    update();
  }

  void deselect(label) {
    int index = selectedItems.indexOf(label);
    if (index != -1) {
      selectedItems.removeAt(index);
    }
    update();
  }

  Future<void> save() async {
    Map data = {
      "user": userController.user.value.userId,
      "labels": selectedItems.value
    };
    if (loading.isTrue) return;
    EasyLoading.show();
    loading.value = true;
    print(data);
    try {
      final response = await provider.createStrength(data);
      print(response);
      await listController.getList();
      selectedItems.value = [];
      router.changePage(Routes.STRENGTH_LIST);
    } catch ($e) {}
    loading.value = false;
    EasyLoading.dismiss();
  }

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
}
