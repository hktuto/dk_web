import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MenuTopBar extends StatelessWidget {
  MenuTopBar({Key? key, required this.router, required this.score}) : super(key: key);
  RouterController router;
  int score;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( LocaleKeys.menu_score.tr,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: HexColor('#817142'),
                      fontWeight: FontWeight.normal)),
              Text(
                score.toString(),
                style: TextStyle(
                    fontSize: 24.0,
                    color: HexColor('#817142'),
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1),
              )
            ]),
        Row(
          children: [
            // IconButton(
            //     onPressed: () {},
            //     icon: Image.asset('assets/images/notification_icon.png')),
            IconButton(
                onPressed: () => router.changePage(Routes.SETTING),
                icon: Image.asset('assets/images/gear_icon.png')),
          ],
        )
      ],
    );
  }
}
