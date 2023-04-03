import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../../../views/section_header_view.dart';
import '../controllers/dream_detail_controller.dart';

class DreamDetailView extends GetView<DreamDetailController> {
  const DreamDetailView({Key? key, this.option}) : super(key: key);

  final dynamic? option;
  @override
  Widget build(BuildContext context) {
    controller.item.value = option['element'];
    RouterController router = Get.find<RouterController>();
    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: HexColor("#F8F5F1"),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset("assets/images/bg-top-pink.png",
                          fit: BoxFit.cover,
                          colorBlendMode: BlendMode.multiply,
                          color: HexColor("#F8F5F1"))),
                  Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: SectionHeaderView(
                            label: LocaleKeys.menu_Dream.tr,
                            subtitle: '',
                            labelSize: 26.0,
                            labelWeight: FontWeight.w300,
                            showBack: true),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(24),
                          child: Container(
                            padding: EdgeInsets.all(24.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Obx(() => SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                controller.item.value.field
                                                    .toString(),
                                                style: TextStyle(
                                                    color: HexColor('#8EB4A3'),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                controller.item.value.timeBound
                                                    .toString(),
                                                style: TextStyle(
                                                    color: HexColor('#858585'),
                                                    fontSize: 12))
                                          ]),
                                      SizedBox(
                                        height: 24.0,
                                      ),
                                      TextField(
                                        controller: controller.dreamText,
                                        decoration: InputDecoration(
                                          label: Text("Dream"),
                                        ),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: controller.specificText,
                                        decoration: InputDecoration(
                                          label: Text(
                                              "Specific Goal for realizing the dream:"),
                                        ),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: controller.measurableText,
                                        decoration: InputDecoration(
                                          label:
                                              Text("Measurable (Trackable) :"),
                                        ),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: controller.achievableText,
                                        decoration: InputDecoration(
                                          label: Text("Achievable"),
                                        ),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: controller.relevantText,
                                        decoration: InputDecoration(
                                          label: Text("Relevant [Why]"),
                                        ),
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: controller.timeText,
                                        decoration: InputDecoration(
                                          label: Text("Time-bound [When]"),
                                        ),
                                        onTap: () async {
                                          DateTime initialDate = DateTime.now();
                                          if (controller.timeText.text != '') {
                                            try {
                                              initialDate = DateTime.parse(
                                                  controller.timeText.text);
                                            } catch ($e) {
                                              initialDate = DateTime.now();
                                            }
                                          }
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: initialDate,
                                                  firstDate: DateTime.now(),
                                                  //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2100));

                                          if (pickedDate != null) {
                                            //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            print(formattedDate);
                                            controller.timeText.text =
                                                formattedDate;
                                            controller
                                                .update(); //formatted date output using intl package =>  2021-03-16

                                          } else {}
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Slider(
                                        value: controller.process.value,
                                        max: 100,
                                        divisions: 10,
                                        label:
                                            controller.process.value.toString(),
                                        onChanged: (double value) {
                                          print(value);
                                          controller.process.value = value;
                                          controller.update();
                                        },
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () =>
                                  router.offPage(Routes.DREAM_LIST),
                              child: Text(LocaleKeys.general_back.tr)),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 40),
                            child: SizedBox(
                              width: double.infinity,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    HexColor("#F36540"),
                                    HexColor("#DA3C12")
                                  ]),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: TextButton(
                                  onPressed: () => controller.save(),
                                  child: Text(
                                    LocaleKeys.setting_save.tr,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
