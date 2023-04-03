import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InventoryController extends GetxController {
  UnityController unity = Get.find<UnityController>();

  RouterController router = Get.find<RouterController>();
  UserController user = Get.find<UserController>();
  ScoreController score = Get.find<ScoreController>();
  List<InventoryCategories> list = [
    InventoryCategories(id: 0, name: 'tree', items: [
      InventoryItem(
          name: "tree1",
          iconLocation: "assets/images/inventory/tree1.png",
          cost: 200),
      InventoryItem(
          name: "tree3",
          iconLocation: "assets/images/inventory/tree3.png",
          cost: 150),
      InventoryItem(
          name: "tree2",
          iconLocation: "assets/images/inventory/tree2.png",
          cost: 150),
      InventoryItem(
          name: "tree4",
          iconLocation: "assets/images/inventory/tree4.png",
          cost: 150),
      InventoryItem(
          name: "tree5",
          iconLocation: "assets/images/inventory/tree5.png",
          cost: 150),
       
    ]),
  ];

  RxInt selectedIndex = 0.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  void placeItem(InventoryItem selectItem) async {
    unity.sendMessage(method: "PlaceItemInScene", message: selectItem.name);
    Map scoreRecord = {
      'user': user.user.value.userId,
      'score': selectItem.cost * -1,
      "section": "shop",
    };
    await score.saveUserScore(scoreRecord);
    await score.getUserTotalScore();
    router.offPage(Routes.MAIN);
  }

  void selectItem(InventoryCategories categories) {
    selectedIndex.value = categories.id;
    update();
  }
}

class InventoryCategories {
  int id;
  String name;
  List<InventoryItem> items;
  InventoryCategories(
      {required this.id, required this.name, required this.items});
}

class InventoryItem {
  String name;
  String iconLocation;
  int cost;

  InventoryItem(
      {required this.name, required this.iconLocation, this.cost = 100});
}
