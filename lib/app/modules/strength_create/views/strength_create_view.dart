import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/strength_create_controller.dart';

class StrengthCreateView extends GetView<StrengthCreateController> {
  @override
  Widget build(BuildContext context) {
    return DialogScreenView(
      child: PageStack(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: SectionHeaderView(
                    label: LocaleKeys.menu_strength.tr,
                    subtitle: '',
                    labelSize: 26.0,
                    labelWeight: FontWeight.w300,
                    showBack: true),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Obx(() => Text(
                        controller.selectedItems.value.join(' , '),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: HexColor('#89B2C4'),
                            fontSize: 14,
                            fontWeight: FontWeight.bold))),
                  )),
              Expanded(
                  flex: 3,
                  child: Obx(
                    () => Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(12),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: controller.labels
                            .map((label) => controller.selectedItems
                                    .contains(label)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller.deselect(label),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                              color: HexColor('#B9D6D5'),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  ('Strength_label_' + label)
                                                      .tr,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                              Text(
                                                  ('Strength_description_' +
                                                          label)
                                                      .tr,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      )
                                    ],
                                  )
                                : Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller.selected(label),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                              color: HexColor('#ffffff'),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  ('Strength_label_' + label)
                                                      .tr,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          HexColor('#858585'))),
                                              Text(
                                                  ('Strength_description_' +
                                                          label)
                                                      .tr,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          HexColor('#858585'))),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      )
                                    ],
                                  ))
                            .toList(),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 24.0,
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
                      onPressed: () => controller.save(),
                      child: Text(
                        LocaleKeys.general_confirm.tr,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              )
            ],
          ),
          footer: Container()),
    );
  }
}

class PageStack extends StatelessWidget {
  const PageStack({Key? key, required this.child, required this.footer})
      : super(key: key);

  final Widget child;
  final Widget footer;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset("assets/images/bg-top-blue.png",
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.multiply,
                color: HexColor("#F7FAF7"))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/bg-bottom-blue.png",
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.multiply,
              color: HexColor('#F7FAF7'),
            )),
        child,
        footer,
      ],
    );
  }
}
