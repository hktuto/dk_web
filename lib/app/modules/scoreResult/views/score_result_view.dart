import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/score_result_controller.dart';

class ScoreResultView extends GetView<ScoreResultController> {
  const ScoreResultView({Key? key, this.option}) : super(key: key);
  final dynamic? option;
  @override
  Widget build(BuildContext context) {
    
    RouterController router = Get.find<RouterController>();
    BreathController breath = Get.find<BreathController>();
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
              label: ('score_section_'+ (option?['type'] ?? "Breathing")).tr ,
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
              Text(option?['score'] ?? 0,
                  style: TextStyle(
                      color: HexColor('#719DB0'),
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20.0,
              ),
              option?['duration'] != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          LocaleKeys.score_duration.tr,
                          style: TextStyle(fontSize: 19.0),
                        ),
                        Text(option['duration'],
                            style: const TextStyle(
                                fontSize: 19.0, fontWeight: FontWeight.bold))
                      ],
                    )
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(LocaleKeys.score_journal_bonus.tr, style: TextStyle(fontSize: 19.0)),
                  Text('+ '+ option['bonus'],
                      style: const TextStyle(
                          fontSize: 19.0, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        )),
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
                    onPressed: () => controller.finish(option?['type'] ?? "Breathing"),
                    child:  Text(
                      LocaleKeys.score_finish.tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(onPressed: () => breath.finishIntro(), child: Text(LocaleKeys.score_start_again.tr)),
            const SizedBox(
              height: 40.0,
            ),
          ],
        )
      ],
    ));
  }
}
