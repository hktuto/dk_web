import 'dart:math';

import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/content_view_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ContentView extends GetView<ContentViewController> {
  const ContentView({Key? key, this.option}) : super(key: key);

  final dynamic? option;

  @override
  Widget build(BuildContext context) {
    if (option != null &&
        option['posts'] != null &&
        option['posts'].length > 0) {
      controller.contents.value = option['posts'];
      logger.i(controller.contents);
      controller.update();
    }

    // final CarouselController _controller = CarouselController();
    RouterController router = Get.find<RouterController>();
    RegisterFLowController flow = Get.find<RegisterFLowController>();
    return Stack(
      children: [
        DialogScreenView(
            child: Stack(
          children: [
            Obx(() => CarouselSlider(
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      enlargeCenterPage: false,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        controller.changeSlide(index);
                      }),
                  carouselController: controller.controller,
                  items: controller.contents
                      .map((slide) => SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Stack(children: [
                              Center(
                                  child: Random().nextBool()
                                      ? Image.asset('assets/images/post.png',
                                          fit: BoxFit.cover, width: 1000.0)
                                      : Image.asset('assets/images/post2.png',
                                          fit: BoxFit.cover, width: 1000.0)),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          router.changePageWithProps(
                                              Routes.CONTENT_DETAIL,
                                              {'post': slide});
                                        },
                                        child: Text(
                                            slide.postHeadline.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 32.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          router.changePageWithProps(
                                              Routes.CONTENT_DETAIL,
                                              {'post': slide});
                                        },
                                        child: Text(slide.postIntro.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white)),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            router.changePageWithProps(
                                                Routes.CONTENT_DETAIL,
                                                {'post': slide});
                                          },
                                          child: Text(
                                            LocaleKeys.content_readMore.tr,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ))
                      .toList(),
                )),
            Obx(() => Positioned(
                  bottom: 40.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.contents.asMap().entries.map((entry) {
                      int idx = entry.key;
                      return GestureDetector(
                        onTap: () =>
                            controller.controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(controller.current.value == idx
                                      ? 0.9
                                      : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                )),
            Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: TextButton(
                    onPressed: () => flow.shouldGoNextStep(Routes.MAIN),
                    child: Text(LocaleKeys.general_backToHome.tr,
                        style: TextStyle(color: Colors.white))))
          ],
        )),
        Positioned(
            left: -10,
            top: 0,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: IconButton(
                  onPressed: () {
                    controller.controller.previousPage();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
            )),
        Positioned(
            right: -10,
            top: 0,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: IconButton(
                  onPressed: () {
                    controller.controller.nextPage();
                  },
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white)),
            ))
      ],
    );
  }
}
