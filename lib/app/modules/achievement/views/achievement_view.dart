import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/data/models/achievement_item.dart';
import 'package:dk_app_flutter/app/views/full_page_dialog_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../views/section_header_view.dart';
import '../controllers/achievement_view_controller.dart';

class AchievementView extends GetView<AchievementViewController> {
  @override
  Widget build(BuildContext context) {
    AchievementController achievement = Get.find<AchievementController>();
    return FullPageDialogView(
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: const SectionHeaderView(
              label: "Achievement",
              subtitle: '',
              showBack: true,
              textColor: '#92ACA0',
            ),
          ),
          Expanded(
              child: Container(
            child: SingleChildScrollView(
              child: Column(children: [
                AchievementCategory(
                    title: LocaleKeys.achievement_section_login_title.tr,
                    subTitle: LocaleKeys.achievement_section_login_subTitle.tr,
                    list: controller.getLoginAchievement(),
                    achievement: achievement,
                    color: achievement.loginColor,
                    ),
                AchievementCategory(
                    title: LocaleKeys
                        .achievement_section_breathing3aDayCount_title.tr,
                    subTitle: LocaleKeys
                        .achievement_section_breathing3aDayCount_subTitle.tr,
                    list: controller.getBreathingAchievement(),
                    achievement: achievement,
                    color: achievement.breathColor,
                    ),
                AchievementCategory(
                    title: LocaleKeys
                        .achievement_section_emotionHappyRow_title.tr,
                    subTitle: LocaleKeys
                        .achievement_section_emotionHappyRow_subTitle.tr,
                    list: controller.getEmotionAchievement(),
                    achievement: achievement,
                    color: achievement.breathColor,
                    ),
              ]),
            ),
          ))
        ],
      )),
    );
  }
}

class AchievementCategory extends StatelessWidget {
  const AchievementCategory(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.achievement,
      required this.list,
      required this.color})
      : super(key: key);

  final AchievementController achievement;
  final Iterable<AchievementItem> list;
  final String title;
  final String subTitle;
  final HexColor color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title,
                  style: TextStyle(
                      color: HexColor('#3D3232'),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
              Text(subTitle, style: TextStyle(fontSize: 10.0))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 4.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: HexColor("#C8BFB8"), width: 1.0))),
          ),
        ),
        SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: list
                  .map((ach) => achievement.filterUserArchivement(ach)
                      ? Container(
                          padding: EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap:() => Get.defaultDialog(
                              title: title, 
                              titlePadding: EdgeInsets.all(12.0),
                              titleStyle: TextStyle( color: color, fontSize: 24.0),
                              content: Container(
                                child: SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color: color,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(60.0))),
                                    child: Center(
                                        child: Image.asset(
                                      'assets/images/badge_login.png',
                                      fit: BoxFit.contain,
                                    )),
                                  ),
                                ),
                              )
                              ),
                            child: SizedBox(
                              width: 66,
                              height: 66,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: color,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(33.0))),
                                child: Center(
                                    child: Image.asset(
                                  'assets/images/badge_login.png',
                                  fit: BoxFit.contain,
                                )),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(4.0),
                          child: SizedBox(
                            width: 66,
                            height: 66,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: HexColor('#E5E0DC'),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(33.0))),
                            ),
                          ),
                        ))
                  .toList(),
            ))
      ]),
    );
  }
}
