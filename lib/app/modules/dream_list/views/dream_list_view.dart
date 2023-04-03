import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/data/models/dream_model.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../views/section_header_view.dart';
import '../controllers/dream_list_controller.dart';

class DreamListView extends GetView<DreamListController> {
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    return DialogScreenView(
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
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Obx(() => ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 12,
                        );
                      },
                      itemBuilder: (_, i) => Card(element: controller.list[i]),
                      itemCount: controller.list.length,
                    )),
              )),
              Container(
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
                      onPressed: () => router.changePage(Routes.DREAM_CREATE),
                      child: Text(
                        LocaleKeys.general_create.tr,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  Card({Key? key, required this.element}) : super(key: key);
  DreamItem element;
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    return GestureDetector(
      onTap: () =>
          router.changePageWithProps(Routes.DREAM_DETAIL, {'element': element}),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(element.field.toString(),
                  style: TextStyle(
                      color: HexColor('#8EB4A3'),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(element.timeBound.toString(),
                  style: TextStyle(color: HexColor('#858585'), fontSize: 12))
            ]),
            SizedBox(
              height: 8,
            ),
            Text(
              element.dream.toString(),
              style: TextStyle(color: HexColor('#858585'), fontSize: 14),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor('#C4C4C4')),
              child: FractionallySizedBox(
                  widthFactor: element.process != null
                      ? (element.process! / 100)
                      : 0, // between 0 and 1
                  heightFactor: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor('#A46A35'),
                        borderRadius: BorderRadius.circular(10)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
