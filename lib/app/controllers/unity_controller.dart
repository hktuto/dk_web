import 'dart:developer';

import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UnityController extends GetxController {
  // late UnityWidgetController _unityWidgetController;

  RxBool ready = false.obs;

  RxBool panStarted = false.obs;

  RxBool loading = false.obs;

  RxString lastAction = ''.obs;

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
    // _unityWidgetController.dispose();
  }

  void moveStart(detail) {
    panStarted.value = true;
  }

  void moveUpdate(detail) {
    logger.i(detail);
    // sendMessage(
    //     method: 'cameraMove',
    //     message: '${detail.delta.dy * 7},${detail.delta.dx * 7}',
    //     gameObject: 'Player');
  }

  void panStart(detail) {
    panStarted.value = true;
  }

  void panUpdate(detail) {
    // sendMessage(
    //     method: 'cameraPan',
    //     message: '${detail.delta.dy * 7},${detail.delta.dx * 7}',
    //     gameObject: 'Player');
  }

  void startMove() {
    // sendMessage(method: 'cameraMove', message: '1', gameObject: 'Player');
  }

  void endMove() {
    // sendMessage(method: 'cameraMove', message: '0', gameObject: 'Player');
  }

  void panEnd() {
    panStarted.value = false;
  }

  void moveEnd() {
    panStarted.value = false;
    // sendMessage(method: 'cameraMove', message: '0,0', gameObject: 'Player');
  }

  void tap() {
    logger.i("clickHandler");
    // sendMessage(method: 'clickHandler', message: '', gameObject: 'Player');
  }

  void onUnityCreated(controller) {
    // _unityWidgetController = controller;
    // _unityWidgetController.resume();
  }

  void onUnityMessage(message) {
    // final RouterController router = Get.find<RouterController>();
    // print('Received message from unity: ${message.toString()}');
    // String key = message.toString();
    // if (key == "getCurrentPage") {
    //   // UserController user = Get.find<UserController>();
    //   // user.verify();
    //   var h = Get.global(1).currentState!.history;
    //   var p = h[h.length - 1].route.settings.name;
    //   if (p != null) {
    //     router.shouldIgnorePointer(p);
    //   }
    //   return;
    // }
    // if (key == "openMenu") {
    //   if (lastAction.value != 'openMenu') {
    //     lastAction.value = 'openMenu';
    //     loading.value = true;
    //     update();
    //     router.changePage(Routes.MENU);
    //     loading.value = false;
    //     update();
    //   }
    //   return;
    // }
    // if (key == "OpenInventory") {
    //   if (lastAction.value != 'OpenInventory') {
    //     lastAction.value = 'OpenInventory';
    //     loading.value = true;
    //     update();
    //     router.changePage(Routes.INVENTORY);
    //     loading.value = false;
    //     update();
    //   }
    //   return;
    // }
    // if (key == "openBreath") {
    //   if (lastAction.value != 'openBreath') {
    //     lastAction.value = 'openBreath';
    //     loading.value = true;
    //     update();
    //     final BreathController breathController = Get.find<BreathController>();
    //     breathController.startBreath();
    //     loading.value = false;
    //     update();
    //   }
    //   return;
    // }
    // if (key == "breathStart") {
    //   final BreathController breathController = Get.find<BreathController>();
    //   breathController.isBreathing.value = true;
    //   breathController.breathTimer.value =
    //       DateTime.now().millisecondsSinceEpoch;
    //   return;
    // }

    // if (key == "GoStrength") {
    //   if (lastAction.value != 'GoStrength') {
    //     lastAction.value = 'GoStrength';
    //     loading.value = true;
    //     update();
    //     router.changePage(Routes.STRENGTH_LIST);
    //     loading.value = false;
    //     update();
    //   }
    //   return;
    // }
    // if (key == "goDream") {
    //   if (lastAction.value != 'goDream') {
    //     lastAction.value = 'goDream';
    //     loading.value = true;
    //     update();
    //     // final RouterController router = Get.find<RouterController>();
    //     router.changePage(Routes.DREAM_LIST);
    //     loading.value = false;
    //     update();
    //   }
    //   return;
    // }
    // if (key == "GoWheel") {
    //   if (lastAction.value != 'GoWheel') {
    //     lastAction.value = 'GoWheel';
    //     loading.value = true;
    //     update();
    //     router.changePage(Routes.WHEEL_OF_LIFE);
    //     loading.value = false;
    //     update();
    //   }
    //   return;
    // }

    // if (key == "breathStop") {
    //   final BreathController breathController = Get.find<BreathController>();
    //   // final RouterController router = Get.find<RouterController>();
    //   breathController.stopBreath();
    //   breathController.isBreathing.value = false;
    //   router.offPage(Routes.BREATH_FINISH);
    //   return;
    // }

    // if (key == "introFinish") {
    //   // final RouterController router = Get.find<RouterController>();
    //   // _unityWidgetController.resume();
    //   ready.value = true;
    //   router.offPage(Routes.LANDING);

    //   update();
    //   return;
    // }
  }

  void onUnitySceneLoaded() {
    // _unityWidgetController.resume();
    // final RouterController router = Get.find<RouterController>();
    // _unityWidgetController.resume();
  }

  void sendMessage(
      {String method = '',
      String message = '',
      String gameObject = 'Flow Controller'}) {}
  // _unityWidgetController.postMessage(gameObject, method, message);
}
