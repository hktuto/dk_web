import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../../../views/section_header_view.dart';
import '../controllers/dream_create_controller.dart';

class DreamCreateView extends GetView<DreamCreateController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: DialogScreenView(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset("assets/images/bg-top-pink.png",
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.multiply,
                    color: HexColor("#F7FAF7"))),
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: SectionHeaderView(
                      label: LocaleKeys.dream_create.tr,
                      subtitle: '',
                      labelSize: 26.0,
                      labelWeight: FontWeight.w300,
                      showBack: true),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Obx(() => controller.createState == 0
                      ? Container(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DropdownButton(
                                value: controller.field.value,
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down),
                                onChanged: (String? newValue) {
                                  controller.field.value = newValue ?? '';
                                  controller.update();
                                },
                                items:
                                    controller.fieldsType.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              TextField(
                                controller: controller.dreamText,
                                decoration: InputDecoration(
                                  label: Text(LocaleKeys.dream_section1.tr),
                                ),
                                maxLines: 4,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(LocaleKeys.dream_section1_tips.tr)
                            ],
                          ),
                        )
                      : controller.createState == 1
                          ? Container(
                              padding: EdgeInsets.all(40.0),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: controller.specificText,
                                    decoration: InputDecoration(
                                      label: Text(LocaleKeys.dream_section2.tr),
                                    ),
                                    maxLines: 8,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(LocaleKeys.dream_section2_tips.tr)
                                ],
                              ),
                            )
                          : controller.createState == 2
                              ? Container(
                                  padding: EdgeInsets.all(40.0),
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: controller.measurableText,
                                        decoration: InputDecoration(
                                          label: Text(
                                              LocaleKeys.dream_section3.tr),
                                        ),
                                        maxLines: 8,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(LocaleKeys.dream_section3_tips.tr)
                                    ],
                                  ),
                                )
                              : controller.createState == 3
                                  ? Container(
                                      padding: EdgeInsets.all(40.0),
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller:
                                                controller.achievableText,
                                            decoration: InputDecoration(
                                              label: Text(
                                                  LocaleKeys.dream_section4.tr),
                                            ),
                                            maxLines: 8,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                              LocaleKeys.dream_section4_tips.tr)
                                        ],
                                      ),
                                    )
                                  : controller.createState == 4
                                      ? Container(
                                          padding: EdgeInsets.all(40.0),
                                          child: Column(
                                            children: [
                                              TextField(
                                                controller:
                                                    controller.relevantText,
                                                decoration: InputDecoration(
                                                  label: Text(LocaleKeys
                                                      .dream_section5.tr),
                                                ),
                                                maxLines: 8,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(LocaleKeys
                                                  .dream_section5_tips.tr)
                                            ],
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.all(40.0),
                                          child: Column(
                                            children: [
                                              TextField(
                                                controller: controller.timeText,
                                                decoration: InputDecoration(
                                                  label: Text(LocaleKeys
                                                      .dream_section6.tr),
                                                ),
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime.now(),
                                                          //DateTime.now() - not to allow to choose before today.
                                                          lastDate:
                                                              DateTime(2100));

                                                  if (pickedDate != null) {
                                                    print(
                                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
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
                                                      .requestFocus(
                                                          new FocusNode());
                                                },
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text("")
                                            ],
                                          ),
                                        )),
                )),
                Obx(() => Column(
                      children: [
                        controller.createState <= 4 &&
                                controller.createState > 0
                            ? TextButton(
                                onPressed: () => controller.back(),
                                child: Text('back'))
                            : Container(),
                        Button(
                            function: () => controller.next(context),
                            label: controller.createState <= 4
                                ? "Next"
                                : "Confirm"),
                      ],
                    )),
                SizedBox(
                  height: 40,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key, this.function, this.label = ''}) : super(key: key);

  final Function()? function;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [HexColor("#F36540"), HexColor("#DA3C12")]),
            borderRadius: BorderRadius.circular(24),
          ),
          child: TextButton(
            onPressed: function,
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
