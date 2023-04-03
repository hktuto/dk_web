import 'package:chewie/chewie.dart';
import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/breathing_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/breath_video_controller.dart';

class BreathVideoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    BreathController breathController = Get.find<BreathController>();
    BreathingRecordController record = Get.find<BreathingRecordController>();
    return GetBuilder<BreathVideoController>(
        init: BreathVideoController(),
        builder: (controller) => Scaffold(
              body: Stack(children: [
                Container(
                  child: controller.chewieController != null &&
                          controller.chewieController!.videoPlayerController
                              .value.isInitialized
                      ? Chewie(controller: controller.chewieController!)
                      : Center(child: Text(controller.loading.toString())),
                ),
                Obx( () => record.userRecords.isEmpty ? Container():
                
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Center(
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            color: HexColor('#93BDD6'),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0))),
                        child: Center(
                          child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () => controller.stopVideo()),
                        ),
                      ),
                    ))
                )
                // 
              ]),
            ));
  }
}
