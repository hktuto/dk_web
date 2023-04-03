import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find<UserController>();
    BreathController breathController = Get.find<BreathController>();
    UnityController unityController = Get.find<UnityController>();
    RouterController router = Get.find<RouterController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        // UnityWidget(
        //     onUnityCreated: unityController.onUnityCreated,
        //     onUnityMessage: unityController.onUnityMessage,
        //     onUnitySceneLoaded: unityController.onUnitySceneLoaded),
        Navigator(
          key: Get.nestedKey(1),
          initialRoute: Routes.LANDING,
          onGenerateRoute: router.onGenerateRoute,
        ),
      ]),
    );
  }
}
