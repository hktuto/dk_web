import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/modules/breathQuestion/views/question_view.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../views/section_header_view.dart';
import '../controllers/breath_question_controller.dart';

class BreathQuestionView extends GetView<BreathQuestionController> {
  @override
  Widget build(BuildContext context) {
    BreathController breathController = Get.find<BreathController>();
    return DialogScreenView(
      child: Column(children: [
        const SizedBox(
          height: 60.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: SectionHeaderView(
              label: LocaleKeys.question_title.tr,
              subtitle: '',
              labelSize: 26.0,
              labelWeight: FontWeight.w300,
              showBack: true),
        ),
        Expanded(
          child: Obx(() => SingleChildScrollView(
            child: Column(
                children: breathController.optionsSetting
                    .map((e) => QuestionView(
                          color: e.colors[0],
                          label: ('question_' + e.id.toString() + '_question').tr,
                          selected:
                              breathController.currentOptionsSetting.value.id ==
                                  e.id,
                          onTap: () => breathController.changeOption(e),
                        ))
                    .toList()),
          )),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
          child: TextButton(
              onPressed: () async {
                final lang = Get.locale?.languageCode == 'en' ? 'en' : 'tc';

                Uri url = Uri.parse('http://shop.aroma.com.hk/' + lang + '/product/category?no=60');
                if ( await launchUrl(url)) {
                } else {
                  print('can not lanch');
                }
              },
              child: Text(LocaleKeys.general_shopNow.tr, style: TextStyle(fontSize: 12.0))),
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
                onPressed: () => breathController.submitOption(),
                child: Text(
                  LocaleKeys.general_confirm.tr,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 60.0,
        ),
      ]),
    );
  }
}
