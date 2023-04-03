// import 'package:dk_app_flutter/app/utils/size_const.dart';
import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:dk_app_flutter/app/views/blob/src/model.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../views/blob/blob.dart';
import '../controllers/wheel_of_life_controller.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math' as math;

class WheelOfLifeView extends GetView<WheelOfLifeController> {
  @override
  Widget build(BuildContext context) {
    double scale = (MediaQuery.of(context).size.width - 40) / 320;
    RegisterFLowController flow = Get.find<RegisterFLowController>();
    return DialogScreenView(
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: SectionHeaderView(
                    label: LocaleKeys.menu_wheelFull.tr,
                    subtitle: '',
                    labelSize: 26.0,
                    labelWeight: FontWeight.w300,
                    showBack: true),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() => Container(
                        width: 320 * scale,
                        height: 340 * scale,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/wheel_bg.png',
                              scale: 0.5,
                            ),
                            GestureDetector(
                              onTap: () => controller.openDialog(),
                              child: Center(
                                child: Transform.rotate(
                                  angle: -math.pi / 2.5,
                                  child: Transform.translate(
                                    offset: Offset(-5, -5),
                                    child: Blob.normal(
                                      size: 220 * scale,
                                      edgesCount: 8,
                                      minGrowth: 1,
                                      controller: controller.blobCtrl,
                                      debug: false,
                                      styles: BlobStyles(
                                        color: Colors.white,
                                        fillType: BlobFillType.stroke,
                                        strokeWidth: 1,
                                      ),
                                      score: controller.currentSocre.value,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ...controller.scoreMap
                                .map((s) => Positioned(
                                    left: s['x'] * scale,
                                    top: s['y'] * scale,
                                    child: Text(
                                      (controller.currentSocre
                                                  .value[s['index']] *
                                              10)
                                          .toStringAsFixed(0),
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: HexColor(s['color']),
                                          fontWeight: FontWeight.bold),
                                    )))
                                .toList(),
                          ],
                        ))),
                    Obx(() => Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              controller: controller.scrollController,
                              children: [
                                ...controller.records
                                    .map((record) => controller.selectedItem
                                                .value.wheelofliferecordId ==
                                            record.wheelofliferecordId
                                        ? Container(
                                            width: 60,
                                            height: 60,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      color:
                                                          HexColor('#86B9CE')),
                                                ),
                                                Container(
                                                  width: 1.0,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#86B9CE')),
                                                ),
                                                Container(
                                                  width: 60,
                                                  height: 1,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#86B9CE')),
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  controller.displayDate(
                                                      record.createdAt.date),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          HexColor('#86B9CE')),
                                                ),
                                              ],
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              controller.selectedChange(record);
                                            },
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 10,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        color: HexColor(
                                                            '#CCE6F0')),
                                                  ),
                                                  Container(
                                                    width: 1.0,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        color: HexColor(
                                                            '#CCE6F0')),
                                                  ),
                                                  Container(
                                                    width: 60,
                                                    height: 1,
                                                    decoration: BoxDecoration(
                                                        color: HexColor(
                                                            '#86B9CE')),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(controller.displayDate(
                                                      record.createdAt.date)),
                                                ],
                                              ),
                                            ),
                                          ))
                                    .toList(),
                              ]),
                        )),
                  ],
                ),
              ),
            ],
          ),
          // action button
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [HexColor("#92ACA0"), HexColor("#89B2C4")]),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Obx(() => flow.running.isFalse
                      ? TextButton(
                          onPressed: () => controller.createRecord(),
                          child: Text(
                            LocaleKeys.general_create.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : TextButton(
                          onPressed: () => flow.nextStep(),
                          child: Text(
                            LocaleKeys.breath_next.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
