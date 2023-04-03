import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/modules/breathFinish/controllers/breath_finish_controller.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class BreathFinishView extends GetView<BreathFinishController> {
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    BreathController breathController = Get.find<BreathController>();
    RegisterFLowController flow = Get.find<RegisterFLowController>();
    return DialogScreenView(
        child: Column(
      children: [
        const SizedBox(
          height: 40.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: SectionHeaderView(
              label: LocaleKeys.breath_Congratulation.tr,
              subtitle: '',
              labelSize: 26.0,
              labelWeight: FontWeight.w300,
              showBack: false),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            LocaleKeys.breath_how_do_you_feel.tr,
            style: TextStyle(color: HexColor('#3D3232'), fontSize: 24.0),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Obx(
              () => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.feelingOptions
                        .map((index) => SizedBox(
                              width: (controller.feeling.value == index
                                  ? 100
                                  : 60),
                              height: (controller.feeling.value == index
                                  ? 100
                                  : 60),
                              child: IconButton(
                                  onPressed: () =>
                                      controller.feeling.value = index,
                                  icon: Image.asset(
                                    'assets/images/breath_finish_' +
                                        (controller.feeling.value == index
                                            ? 'select'
                                            : 'normal') +
                                        index.toString() +
                                        '.png',
                                    fit: BoxFit.contain,
                                  )),
                            ))
                        .toList(),
                  ),
                  Text(
                    LocaleKeys.score_title.tr,
                    style:
                        TextStyle(color: HexColor('#3D3232'), fontSize: 24.0),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Column(
                      children: [
                        Text(controller.totalScore.value.toString(),
                            style: TextStyle(
                                color: HexColor('#719DB0'),
                                fontSize: 60.0,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.score_duration.tr,
                              style: TextStyle(fontSize: 19.0),
                            ),
                            Text(controller.duration.value,
                                style: const TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(LocaleKeys.score_journal_bonus.tr,
                                style: TextStyle(fontSize: 19.0)),
                            Text('+ ' + controller.bouns.toString(),
                                style: const TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ))),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [HexColor("#92ACA0"), HexColor("#89B2C4")]),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextButton(
                    onPressed: () => controller.submit(),
                    child: Text(
                      LocaleKeys.breath_OK.tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => breathController.finishIntro(),
                  child: Text(LocaleKeys.breath_restart.tr))
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Checkbox(
                  value: !breathController.skipIntro.value,
                  onChanged: (bool? val) => breathController.toggleSkipIntro(),
                )),
            const SizedBox(width: 4.0),
            Text(LocaleKeys.breath_skipIntro.tr)
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    ));
  }
}
