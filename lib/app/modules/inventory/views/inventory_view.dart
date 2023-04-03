import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/inventory_controller.dart';

class InventoryView extends GetView<InventoryController> {
  const InventoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScoreController score = Get.find<ScoreController>();
    return DialogScreenView(
        child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: SectionHeaderView(
              label: LocaleKeys.Inventory_title.tr,
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
                    ...controller.list[controller.selectedIndex.value].items
                        .map(
                      (item) => score.totalScore.value > item.cost
                          ? GestureDetector(
                              onTap: () => controller.placeItem(item),
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Color.fromARGB(255, 131, 201, 196),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        item.iconLocation,
                                        fit: BoxFit.contain,
                                      ),
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Text(
                                            item.cost.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ))
                                    ],
                                  )

                                  // Center(child: Text(item.name)),
                                  ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Color.fromARGB(255, 183, 186, 186),
                              ),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    item.iconLocation,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Text(
                                        item.cost.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ))
                                ],
                              )

                              // Center(child: Text(item.name)),
                              ),
                    )
                  ],
                ),
              ),
            )),
        Obx(() => Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: controller.scrollController,
                children: [
                  ...controller.list.map((cat) => controller.selectedIndex ==
                          cat.id
                      ?
                      // current cat
                      Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: HexColor('#86B9CE')),
                          padding: EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Center(
                              child: Text(
                            ("Inventory_categories_" + cat.name).tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: Color.fromARGB(255, 183, 186, 186)),
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: () => controller.selectItem(cat),
                              child: Center(
                                child: Text(
                                  ("Inventory_categories_" + cat.name).tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ))
                ],
              ),
            ))
      ],
    ));
  }
}
