import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/breath_register_flow_controller.dart';

class BreathRegisterFlowView extends GetView<BreathRegisterFlowController> {
  const BreathRegisterFlowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                label: LocaleKeys.breath_intro_title.tr,
                subtitle: '',
                labelSize: 26.0,
                labelWeight: FontWeight.w300,
                showBack: false),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  LocaleKeys.breath_intro_body.tr,
                  style: TextStyle(fontSize: 18, color: HexColor("#817142")),
                ),
              ),
            ),
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
