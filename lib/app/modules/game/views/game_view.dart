import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'dart:math' as math;

///Core theme import
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../controllers/game_controller.dart';

class GameView extends GetView<GameController> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: HexColor("#F6F4F2"),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset("assets/images/bg-top.png")),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset("assets/images/bg-bottom.png")),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: SectionHeaderView(
                    label: "Confirm Emotion",
                    subtitle: '',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                    child: Obx(() => Stack(
                          children: [
                            Center(
                                child: Image.asset("assets/images/spiral.png")),
                            Positioned(
                                left: 10,
                                top: 20,
                                child: SizedBox(
                                  width: 100.0,
                                  height: (appHeight - 180) /
                                      14 *
                                      6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: controller.good.map((e) {
                                      var index = controller.good.indexOf(e);
                                      return Text(e,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: index + 1 ==
                                                      controller.count.value
                                                  ? FontWeight.bold
                                                  : FontWeight.normal));
                                    }).toList(),
                                  ),
                                )),
                            Positioned(
                                right: 10,
                                bottom: 20,
                                child: SizedBox(
                                  width: 100.0,
                                  height: (appHeight -
                                          180) /
                                      14 *
                                      8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: controller.bad.map((e) {
                                      var index = controller.bad.indexOf(e);
                                      return Text(e,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: index + 7 ==
                                                      controller.count.value
                                                  ? FontWeight.bold
                                                  : FontWeight.normal));
                                    }).toList(),
                                  ),
                                )),
                            Transform.rotate(
                              angle: -math.pi,
                              child: SfSliderTheme(
                                data: SfSliderThemeData(
                                  thumbRadius: 16,
                                ),
                                child: SfSlider.vertical(
                                  min: 1,
                                  max: 14,
                                  value: controller.count.value,
                                  stepSize: 1,
                                  showTicks: false,
                                  showLabels: false,
                                  enableTooltip: false,
                                  thumbIcon: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const <Widget>[
                                        Icon(Icons.keyboard_arrow_up_outlined,
                                            color: Colors.white, size: 12.0),
                                        Icon(Icons.keyboard_arrow_down_outlined,
                                            color: Colors.white, size: 12.0),
                                      ]),
                                  onChanged: (dynamic value) =>
                                      controller.setValue(value),
                                ),
                              ),
                            ),
                          ],
                        ))),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 12.0, 30.0, 12.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [HexColor("#92ACA0"), HexColor("#89B2C4")]),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextButton(
                        onPressed: () => Get.toNamed('/strength-profile'),
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
