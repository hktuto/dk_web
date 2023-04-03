import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/dream_model.dart';
import 'package:dk_app_flutter/app/data/providers/dream_record_provider.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DreamListController extends GetxController {
  DreamRecordProvider provider = Get.put(DreamRecordProvider());
  UserController userController = Get.find<UserController>();
  RxList<DreamItem> list = <DreamItem>[].obs;

  RouterController router = Get.find<RouterController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await getList();
  }

  @override
  void onClose() {}

  int getFinishCount() {
    List<DreamItem> items =
        list.value.where((element) => element.process == 100).toList();
    return items.length;
  }

  Future<void> getList() async {
    List<DreamItem> result =
        await provider.getDream({"user_id": userController.user.value.userId});
    list.value = result;
    UnityController unity = Get.find<UnityController>();
    unity.lastAction.value = '';
    update();
    if (list.isEmpty) {
      router.changePage(Routes.DREAM_CREATE);
    }
  }
}
