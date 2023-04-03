import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/dream_model.dart';
import 'package:dk_app_flutter/app/data/providers/dream_record_provider.dart';
import 'package:dk_app_flutter/app/modules/dream_list/controllers/dream_list_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class DreamCreateController extends GetxController {
  DreamRecordProvider provider = Get.put(DreamRecordProvider());
  RouterController router = Get.find<RouterController>();
  UserController userController = Get.find<UserController>();
  RegisterFLowController flow = Get.find<RegisterFLowController>();
  RxInt createState = 0.obs;

  DreamListController listController = Get.find<DreamListController>();

  RxString field = "health".obs;

  List<String> fieldsType = [
    'health',
    'money',
    'career',
    'social',
    'love',
    'personal',
    'fun',
    'spirituality'
  ];

  final dreamText = TextEditingController();
  final specificText = TextEditingController();
  final measurableText = TextEditingController();
  final achievableText = TextEditingController();
  final relevantText = TextEditingController();
  final timeText = TextEditingController();

  RxBool loading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    dreamText.dispose();
    specificText.dispose();
    measurableText.dispose();
    achievableText.dispose();
    relevantText.dispose();
    timeText.dispose();
  }

  Future<void> submit() async {
    if (loading.isTrue) return;
    loading.value = true;
    EasyLoading.show();
    try {
      Map data = {
        "user": userController.user.value.userId,
        "field": field.value,
        "dream": dreamText.text,
        "specific": specificText.text,
        "measurable": measurableText.text,
        "achievable": achievableText.text,
        "relevant": relevantText.text,
        "timeBound": timeText.text,
        "process": 0
      };

      DreamItem element = await provider.createDream(data);
      if (listController != null) {
        listController.getList();
      }
      loading.value = false;
      EasyLoading.dismiss();
      flow.running.isTrue
          ? flow.nextStep()
          : router.offPageWithProps(Routes.DREAM_DETAIL, {'element': element});
      return;
    } catch ($e) {}
    loading.value = false;
    EasyLoading.dismiss();
    flow.running.isTrue
        ? flow.nextStep()
        : router.changePage(Routes.DREAM_LIST);
  }

  void back() {
    createState--;
  }

  void next(BuildContext context) {
    switch (createState.value) {
      case 0:
        if (dreamText.text.isNotEmpty) {
          createState++;
        }
        break;
      case 1:
        if (specificText.text.isNotEmpty) {
          createState++;
        }
        break;
      case 2:
        if (measurableText.text.isNotEmpty) {
          createState++;
        }
        break;
      case 3:
        if (achievableText.text.isNotEmpty) {
          createState++;
        }
        break;
      case 4:
        print("4" + relevantText.text);
        if (relevantText.text.isNotEmpty) {
          createState++;
        }
        break;
      case 5:
        if (timeText.text.isNotEmpty) {
          // createState++;
          submit();
        }
        break;
    }
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void finish() {
    createState.value = 0;
  }
}
