import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../routes/app_pages.dart';
import '../../../views/section_header_view.dart';
import '../controllers/confrim_emotion_controller.dart';
import 'package:collection/collection.dart';

class ConfrimEmotionView extends GetView<ConfrimEmotionController> {
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    return DialogScreenView(
        child: Column(children: [
      const SizedBox(
        height: 40.0,
      ),
      Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: SectionHeaderView(
            label: LocaleKeys.emotion_confirmTitle.tr,
            subtitle: '',
            labelSize: 26.0,
            labelWeight: FontWeight.w300,
            showBack: true),
      ),
      Expanded(
          child: Obx(() => ListView(
                controller: controller.listController,
                padding: const EdgeInsets.all(24),
                children: controller.emotions
                    .mapIndexed((int index, emotion) => controller
                                .selection.value.type ==
                            emotion.type
                        ? Container(
                            alignment: Alignment.center,
                            // height: 60.0,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: HSLColor.fromColor(controller.mainColor)
                                    .withHue(277 - (index * 2))
                                    .toColor(),
                                borderRadius: BorderRadius.circular(40)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(('emotion_label_' + emotion.type).tr,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8,),
                                Text(('emotion_description_'+ emotion.type).tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        
                                        )
                                )
                              ],
                            ))
                        : Container(
                            alignment: Alignment.center,
                            height: 40.0,
                            child: TextButton(
                              onPressed: () =>
                                  controller.changeSelection(emotion),
                              child: Text(('emotion_label_' + emotion.type).tr,
                                  style: TextStyle(
                                      color: HSLColor.fromColor(
                                              controller.mainColor)
                                          .withHue(277 - (index * 2))
                                          .toColor(),
                                      fontSize: 18.0)),
                            ),
                          ))
                    .toList(),
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
                    LocaleKeys.general_confirm.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            )
          ],
        ),
      )
    ]));
  }
}
