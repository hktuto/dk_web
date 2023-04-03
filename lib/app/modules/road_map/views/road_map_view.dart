import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/road_map_controller.dart';

class RoadMapView extends GetView<RoadMapController> {
  const RoadMapView({Key? key, this.option}) : super(key: key);

  final dynamic? option;
  @override
  Widget build(BuildContext context) {
    int step = 4;
    if (option != null && option['step'] != null) {
      step = option['step'];
    }
    return DialogScreenView(
      child: Column(
        children: [
          const SizedBox(
            height: 60.0,
          ),
          Expanded(
            child: Container(
                child: Image.asset(
              'assets/images/map_' +
                  Get.locale.toString() +
                  '_' +
                  step.toString() +
                  '.png',
            )),
          ),
          Container(
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
                child: TextButton(
                  onPressed: () => controller.next(),
                  child: Text(
                    LocaleKeys.breath_next.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
        ],
      ),
    );
  }
}
