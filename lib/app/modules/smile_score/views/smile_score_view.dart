import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/data/models/content_model.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/smile_score_controller.dart';

class SmileScoreView extends GetView<SmileScoreController> {
  const SmileScoreView({Key? key, this.option}) : super(key: key);

  final dynamic? option;

  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
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
              label: LocaleKeys.menu_Smile.tr,
              subtitle: 'score',
              labelSize: 26.0,
              labelWeight: FontWeight.w300,
              showBack: false),
        ),
        const SizedBox(
          height: 60.0,
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text((option?['score'] ?? 0).toString(),
                  style: TextStyle(
                      color: HexColor('#719DB0'),
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(LocaleKeys.score_journal_bonus.tr,
                      style: TextStyle(fontSize: 19.0)),
                  Text('+ ' + (option['bouns'] ?? 0).toString(),
                      style: const TextStyle(
                          fontSize: 19.0, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        )),
        Column(children: [
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
                  onPressed: () {
                    List<Content> posts = option['content'] ?? [];
                    if (posts != null && posts.isNotEmpty) {
                      router.offPageWithProps(Routes.CONTENT, {'posts': posts});
                    } else {
                      router.offPage(Routes.MAIN);
                    }
                  },
                  child: Text(
                    LocaleKeys.score_finish.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
        ])
      ],
    ));
  }
}
