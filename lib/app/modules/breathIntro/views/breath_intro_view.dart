import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/breath_intro_controller.dart';

class BreathIntroView extends GetView<BreathIntroController> {
  @override
  Widget build(BuildContext context) {
    BreathController breathController = Get.find<BreathController>();
    RouterController router = Get.find<RouterController>();
    return Obx(() => DialogScreenView(
        topImage: 'assets/images/bg-top-grey.png',
        bottomImage: 'assets/images/bg-bottom-grey.png',
        bgColor: breathController.currentOptionsSetting.value.colors[0],
        child: Column(
          children: [
            const SizedBox(
              height: 12.0,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: SectionHeaderView(
                label: ('question_' + breathController.currentOptionsSetting.value.id.toString() + '_name').tr,
                subtitle: ('question_' + breathController.currentOptionsSetting.value.id.toString() + '_tagline').tr,
                labelSize: 34.0,
                textColor: '#FFFFFF',
                labelWeight: FontWeight.w700,
                showBack: true,
                actionWidget: TextButton(
                  onPressed: () {
                    breathController.introStep.value = 1;
                    breathController.finishGraphicIntro();
                  },
                  child: Text(
                    LocaleKeys.breath_skip.tr,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Obx(() => Column(
                      children: [
                        breathController.introStep.value == 1
                            ? Image.asset('assets/images/intro_step1.png')
                            : breathController.introStep.value == 2
                                ? Image.asset('assets/images/intro_step2.png')
                                : Image.asset('assets/images/intro_step3.png'),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                                  Border.all(color: Colors.white, width: 1.0)),
                          child: Text(
                            breathController.introStep.value.toString() +
                                ' ' +
                                (breathController.introStep.value == 1
                                    ? LocaleKeys.breath_open.tr
                                    : breathController.introStep.value == 2
                                        ? LocaleKeys.breath_insert.tr
                                        : LocaleKeys.breath_ready.tr),
                            style: TextStyle(
                              fontFamily: 'Righteous',
                              fontSize: 20,
                              color: HexColor('#ffffff'),
                            ),
                          ),
                        )
                      ],
                    ))),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(12.0),
              child: TextButton(
                  onPressed: () {
                    if (breathController.introStep.value != 3) {
                      breathController.introStep++;
                    } else {
                      breathController.introStep.value = 1;
                      breathController.finishGraphicIntro();
                    }
                  },
                  child: Text(
                    breathController.introStep.value != 3
                        ? LocaleKeys.breath_next.tr
                        : LocaleKeys.breath_ready.tr,
                    style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 20,
                      color: HexColor('#ffffff'),
                    ),
                  )),
            )
          ],
        )));
  }
}
