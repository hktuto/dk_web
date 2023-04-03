import 'package:dk_app_flutter/app/controllers/setting_controller.dart';
import 'package:dk_app_flutter/app/modules/setting/views/breath_setting_view.dart';
import 'package:dk_app_flutter/app/modules/setting/views/language_setting_view.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/full_page_dialog_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../views/section_header_view.dart';
import '../controllers/setting_view_controller.dart';

class SettingView extends GetView<SettingViewController> {
  @override
  Widget build(BuildContext context) {
    return FullPageDialogView(
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: SectionHeaderView(
                label: LocaleKeys.setting_title.tr, subtitle: '', showBack: true),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  child: LanguageSettingView(controller: controller,),
                ),
                const SizedBox(height: 12.0,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  child: BreathSettingView(controller: controller,),
                )
              ],
            ),
          )),
          BottomAction(controller: controller)
        ],
      )),
    );
  }
}

class BottomAction extends StatelessWidget {
  const BottomAction({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SettingViewController controller;

  @override
  Widget build(BuildContext context) {
    final SettingController setting = Get.find<SettingController>();
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return isKeyboardVisible
          ? Container()
          : Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: 40),
              child: Column(
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
                            onPressed: () => setting.saveAllSetting(),
                            child: Text(
                              LocaleKeys.setting_save.tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        controller.logout(context);
                        Get.offNamed(Routes.LANDING, id:1);
                        Get.reloadAll(force: true);
                      },
                      child: Text(
                        LocaleKeys.setting_logout.tr,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0)
                ],
              ));
    });
  }
}
