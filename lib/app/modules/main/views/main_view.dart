import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/breathing_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/data/models/breath_record_model.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/views/camera_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    ScoreController scoreController = Get.find<ScoreController>();
    BreathingRecordController record = Get.find<BreathingRecordController>();
    BreathController breathController = Get.find<BreathController>();
    return SafeArea(
        child: Stack(
      children: [
        // top row
        Positioned(
            left: 0,
            top: 10,
            child: Row(
              children: [
                // left score
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: HexColor("#F7FAF7"),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                  "assets/images/bg-bottom-score.png",
                                  fit: BoxFit.cover)),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 24.0, top: 8.0, bottom: 8.0, right: 24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(LocaleKeys.main_score.tr,
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: HexColor('#817142'),
                                        fontWeight: FontWeight.normal)),
                                Obx(() => Text(
                                      scoreController.totalScore.toString(),
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          color: HexColor('#817142'),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -1),
                                    ))
                              ],
                            ),
                          )
                        ],
                      )),
                )
              ],
            )),
        Positioned(
            right: 0,
            top: 10,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#F7FAF7"),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                              "assets/images/bg-bottom-score.png",
                              fit: BoxFit.cover)),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 24.0, top: 8.0, bottom: 8.0, right: 24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(LocaleKeys.main_mood.tr,
                                style: TextStyle(
                                    fontSize: 10.0,
                                    color: HexColor('#817142'),
                                    fontWeight: FontWeight.normal)),
                            Image.asset("assets/images/sunny.png")
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
        // bottom row
        Positioned(
            left: 24.0,
            bottom: 10.0,
            child: Row(
              children: [
                SizedBox(
                  width: 45.0,
                  height: 45.0,
                  child: Container(
                      decoration: BoxDecoration(
                          color: HexColor('#93BDD6'),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100.0))),
                      child: IconButton(
                        icon: Image.asset('assets/images/menu.png'),
                        onPressed: () => router.changePage(Routes.MENU),
                      )),
                ),
                // const SizedBox(width: 12.0),
                // GestureDetector(
                //     onTap: () => breathController.startBreath(),
                //     child: Obx(
                //       () => record.todayBreathingCount.value >= 3
                //           ? Container(
                //               padding: const EdgeInsets.only(
                //                   top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
                //               decoration: BoxDecoration(
                //                   color: HexColor('#93BDD6'),
                //                   borderRadius: const BorderRadius.all(
                //                       Radius.circular(100.0))),
                //               child: Row(children: [
                //                 Image.asset('assets/images/breath.png')
                //               ]),
                //             )
                //           : Container(
                //               padding: const EdgeInsets.only(
                //                   top: 8.0,
                //                   bottom: 8.0,
                //                   left: 8.0,
                //                   right: 12.0),
                //               decoration: BoxDecoration(
                //                   color: HexColor('#93BDD6'),
                //                   borderRadius: const BorderRadius.all(
                //                       Radius.circular(100.0))),
                //               child: Row(
                //                 children: [
                //                   Image.asset('assets/images/breath.png'),
                //                   const SizedBox(width: 12.0),
                //                   Text(
                //                       LocaleKeys.main_breath_time_before.tr +
                //                           (3 - record.todayBreathingCount.value)
                //                               .toString() +
                //                           LocaleKeys.main_breath_time_after.tr,
                //                       style: const TextStyle(
                //                           fontSize: 12.0, color: Colors.white))
                //                 ],
                //               )),
                //     ))
              ],
            ))
      ],
    ));
  }
}
