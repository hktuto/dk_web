import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SectionHeaderView extends GetView {
  const SectionHeaderView({
    Key? key,
    this.label = '',
    this.subtitle = '',
    this.showBack = true,
    this.labelSize = 36.0,
    this.labelWeight = FontWeight.bold,
    this.textColor = '#817142',
    this.actionWidget,
  }) : super(key: key);
  final String label;
  final String subtitle;
  final bool showBack;
  final double labelSize;
  final FontWeight labelWeight;
  final String textColor;

  final Widget? actionWidget;
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    RegisterFLowController flow = Get.find<RegisterFLowController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (showBack && flow.running.isFalse
                ? TextButton(
                    onPressed: () {
                      Get.back(id: 1);
                      var h = Get.global(1).currentState!.history;
                      var p = h.length > 1
                          ? h[h.length - 2].route.settings.name
                          : null;
                      if (p != null) {
                        if (h[h.length - 1].route.settings.name ==
                                Routes.CONFRIM_EMOTION ||
                            p == Routes.LANDING ||
                            p == Routes.EMPTY ||
                            p == "/") {
                          p = Routes.MAIN;
                        }
                        print("Router back : " + p);
                        router.shouldIgnorePointer(p);
                      } else {
                        router.shouldIgnorePointer(Routes.MAIN);
                      }
                      // var past = Get.routing.previous;
                      // var current = Get.currentRoute;
                      // print('past : ' + past);
                      // print('current : ' + current);
                      // var p = ModalRoute.of(context)!.settings.name;
                      // if (p != null) {
                      //   print("back routing : " + p);
                      //   router.shouldIgnorePointer(p);
                      // }
                    },
                    child:
                        Icon(Icons.arrow_back_ios, color: HexColor(textColor)),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft,
                    ),
                  )
                : Container()),
            (actionWidget ?? Container())
          ],
        ),
        Text(
          label,
          style: TextStyle(
              color: HexColor(textColor),
              fontSize: labelSize,
              fontWeight: labelWeight),
        ),
        (subtitle != ''
            ? Text(
                subtitle,
                style: TextStyle(
                    color: HexColor(textColor),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300),
              )
            : Container())
      ],
    );
  }
}
