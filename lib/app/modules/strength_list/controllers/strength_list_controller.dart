import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/strength_model.dart';
import 'package:dk_app_flutter/app/data/providers/strength_provider.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StrengthListController extends GetxController {
  StrengthProvider provider = Get.put(StrengthProvider());
  UserController userController = Get.find<UserController>();
  RouterController router = Get.find<RouterController>();
  RxList<StrengthItem> list = List<StrengthItem>.empty().obs;
  RxBool canCreate = false.obs;
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
  Rx<StrengthItem> selectedItem = StrengthItem(
          user: Id(oid: ""),
          createdAt: AtedAt(date: 0),
          updatedAt: AtedAt(date: 0),
          labels: [],
          strengthlabelrecordId: "")
      .obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await getList();
  }

  void selectedChange(StrengthItem item) {
    selectedItem.value = item;
    update();
  }

  @override
  void onClose() {}

  String displayDate(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();
    return DateFormat('MM-dd').format(date);
  }

  void openDialog(String label) {
    Get.dialog(AlertDialog(
        title: Text(('Strength_label_' + label).tr),
        content: SingleChildScrollView(
          child: Column(
            children: [Text(('Strength_description_' + label).tr)],
          ),
        ),
        actions: [
          TextButton(
            child: Text(LocaleKeys.general_close.tr),
            onPressed: () {
              Get.back();
              RouterController router = Get.find<RouterController>();
              var current = Get.routing.current;
              router.shouldIgnorePointer(current);
            },
          )
        ]));
  }

  Future<void> getList() async {
    Map data = {
      'user_id': userController.user.value.userId,
    };
    try {
      final response = await provider.getStrength(data);
      list.value = response.body;
      if (list.value.isEmpty) {
        canCreate.value = true;
        router.changePage(Routes.STRENGTH_CREATE);
      } else {
        StrengthItem lastItem = list.last;
        DateTime recordDate =
            DateTime.fromMillisecondsSinceEpoch(lastItem.createdAt.date)
                .toLocal();
        DateTime now = DateTime.now();
        now = DateTime(now.year, now.month, now.day);
        int dayDiff = now.compareTo(recordDate);
        if (dayDiff > 0) {
          canCreate.value = true;
        }
        selectedItem.value = list.last;
      }
      update();
    } catch ($e) {
      logger.i($e);
    }
  }
}
