import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/new_achievement_controller.dart';

class NewAchievementView extends GetView<NewAchievementController> {
  const NewAchievementView({Key? key, this.option}) : super(key: key);
  final dynamic? option;
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    final String name = option['name'] ?? 'Login 7 day in a row';
    final int value = option['value'] != null ? int.parse(option['value']) : 1;
    final String field = option['field'] ?? 'login';
    final String type = field == 'login'
        ? LocaleKeys.achievement_section_login_title.tr
        : field == 'breathing3aDayCount' || field == 'breathingTotal'
            ? LocaleKeys.achievement_section_breathing3aDayCount_title.tr
            : LocaleKeys.achievement_section_wheelMoreThan8_title.tr;
    final HexColor badgeColor =
        type == 'Considency' ? HexColor('#D95252') : HexColor('#65D952');
    return DialogScreenView(
        child: Column(
      children: [
        const SizedBox(
          height: 60.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: SectionHeaderView(
              label: LocaleKeys.achievement_title.tr,
              subtitle: '',
              labelSize: 26.0,
              labelWeight: FontWeight.w300,
              showBack: false),
        ),
        
        Expanded(
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(option?['name'] ?? "",
                        style: TextStyle(
                            color: badgeColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          color: badgeColor,
                          borderRadius: BorderRadius.all(Radius.circular(80))
                        ),
                        child: Center(
                          child: Image.asset(type == 'Considency'
                              ? 'assets/images/badge_login.png'
                              : 'assets/images/badge_breath.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(name, style: const TextStyle(fontSize: 14.0))
                  ],
                ))),
        Column(
          children: [
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
                    onPressed: () => router.changePage(Routes.MAIN),
                    child: Text(
                      LocaleKeys.general_close.tr,
                      style: const TextStyle(color: Colors.white),
                    ), 
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0,)
          ],
        )
      ],
    ));
  }
}
   