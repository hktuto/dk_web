import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/strength_list_controller.dart';

class StrengthListView extends GetView<StrengthListController> {
  const StrengthListView({Key? key, this.option}) : super(key: key);

  final dynamic? option;
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    return DialogScreenView(
        child: PageStack(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: SectionHeaderView(
                      label: LocaleKeys.menu_strength.tr,
                      subtitle: '',
                      labelSize: 26.0,
                      labelWeight: FontWeight.w300,
                      showBack: true),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            crossAxisCount: 3,
                            children: [
                              ...controller.selectedItem.value.labels
                                  .map((element) => GestureDetector(
                                        onTap: () =>
                                            controller.openDialog(element),
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            color: Colors.teal[100],
                                          ),
                                          child: Center(child: Text(element)),
                                        ),
                                      ))
                                  .toList()
                            ]),
                      ),
                    )),
                Obx(() => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          controller: controller.scrollController,
                          children: [
                            ...controller.list
                                .map((record) => controller.selectedItem.value
                                            .strengthlabelrecordId ==
                                        record.strengthlabelrecordId
                                    ? Container(
                                        width: 60,
                                        height: 60,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: HexColor('#86B9CE')),
                                            ),
                                            Container(
                                              width: 1.0,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#86B9CE')),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#86B9CE')),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                              controller.displayDate(
                                                  record.createdAt.date),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor('#86B9CE')),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width: 60,
                                        height: 60,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: HexColor('#CCE6F0')),
                                            ),
                                            Container(
                                              width: 1.0,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#CCE6F0')),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#86B9CE')),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .selectedChange(record);
                                              },
                                              child: Text(
                                                  controller.displayDate(
                                                      record.createdAt.date)),
                                            ),
                                          ],
                                        ),
                                      ))
                                .toList(),
                          ]),
                    ))
              ],
            ),
            footer: Positioned(
              bottom: 40.0,
              left: 0,
              right: 0,
              child: Container(
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
                    child: Obx(() => controller.canCreate.isFalse
                        ? TextButton(
                            onPressed: () => router.changePage(Routes.MAIN),
                            child: Text(
                              LocaleKeys.general_back.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : TextButton(
                            onPressed: () =>
                                router.changePage(Routes.STRENGTH_CREATE),
                            child: Text(
                              LocaleKeys.general_create.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                  ),
                ),
              ),
            )));
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
