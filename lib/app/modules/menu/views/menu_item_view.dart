import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MenuItemView extends GetView {
  const MenuItemView(
      {Key? key,
      this.icon = "assets/images/strength.png",
      this.label = '',
      this.action,
      this.flex = 3})
      : super(key: key);

  final String icon;
  final String label;
  final Function()? action;
  final int flex;
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    return Expanded(
      flex: flex,
      child: Center(
        child: GestureDetector(
          onTap: action,
          child: Column(children: [
            Container(
              width: 60.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                  color: HexColor('#93BDD6'),
                  borderRadius: const BorderRadius.all(Radius.circular(100.0))),
              child: Image.asset(icon),
            ),
            SizedBox(height: 12.0),
            Text(label,
                style: TextStyle(
                    color: HexColor("#395F6A"),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      ),
    );
  }
}
