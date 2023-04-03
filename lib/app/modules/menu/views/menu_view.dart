import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/modules/menu/views/main_menu_container.dart';
import 'package:dk_app_flutter/app/modules/menu/views/menu_top_bar.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    ScoreController score = Get.find<ScoreController>();
    return Stack(children: [
      DialogScreenView(
        topImage: "assets/images/bg-top-blue-menu.png",
        bottomImage: "assets/images/bg-bottom-blue-menu.png",
        size: "mini",
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            // Top Row
            Obx(() => Container(
                  padding: const EdgeInsets.all(24.0),
                  child:
                      MenuTopBar(router: router, score: score.totalScore.value),
                )),
            Expanded(child: Container()),
            Container(
              alignment: Alignment.bottomCenter,
              padding:
                  const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 60.0),
              child: const MainMenuContainer(),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              child: TextButton(
                  onPressed: () async {
                    final lang = Get.locale?.languageCode == 'en' ? 'en' : 'tc';

                    Uri url = Uri.parse('http://shop.aroma.com.hk/' +
                        lang +
                        '/product/category?no=60');
                    if (await launchUrl(url)) {
                    } else {
                      print('can not lanch');
                    }
                  },
                  child: Text(LocaleKeys.general_shopNow.tr,
                      style: TextStyle(fontSize: 12.0))),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: MediaQuery.of(context).padding.bottom + 10,
          left: 0,
          right: 0,
          child: BottomExitIcon(router: router))
    ]);
  }
}

class BottomExitIcon extends StatelessWidget {
  const BottomExitIcon({
    Key? key,
    required this.router,
  }) : super(key: key);

  final RouterController router;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 45.0,
        height: 45.0,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: HexColor('#93BDD6'),
              borderRadius: const BorderRadius.all(Radius.circular(100.0))),
          child: IconButton(
            icon: Image.asset('assets/images/menu_close.png'),
            onPressed: () => router.changePage(Routes.MAIN),
          ),
        ),
      ),
    );
  }
}
