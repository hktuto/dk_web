import 'dart:developer';
import 'dart:typed_data';

import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:camera/camera.dart';
import '../../../../generated/locales.g.dart';
import '../../../views/section_header_view.dart';
import '../controllers/face_detection.dart';
import 'package:image/image.dart' as img;

class FaceDetectioniew extends GetView<FaceDetectionController> {
  const FaceDetectioniew({Key? key, this.option}) : super(key: key);

  final dynamic? option;

  @override
  Widget build(BuildContext context) {
    final String emotion = option != null ? option['emotion'] : 'Happiness';
    controller.emotion.value = emotion;
    return DialogScreenView(
        child: Column(
      children: [
        const SizedBox(
          height: 60.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: SectionHeaderView(
              label: LocaleKeys.emotion_detectionTitle.tr,
              subtitle: '',
              labelSize: 26.0,
              labelWeight: FontWeight.w300,
              showBack: false),
        ),
        Expanded(
            child: Obx(() => Column(
                  children: [
                    Text(
                        LocaleKeys.emotion_countDownText.tr +
                            ' ' +
                            controller.counter.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          height: MediaQuery.of(context).size.width - 80,
                          width: MediaQuery.of(context).size.width - 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: controller.cameraController != null &&
                                  controller
                                      .cameraController!.value.isInitialized &&
                                  controller.cameraImage != null
                              ? Stack(
                                  children: [
                                    controller.loading.isFalse
                                        ? AspectRatio(
                                            aspectRatio: 1 / 1,
                                            child: ClipRect(
                                                child: Transform.scale(
                                                    scale:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width -
                                                                40) /
                                                            controller
                                                                .cameraImage!
                                                                .width,
                                                    child: Center(
                                                        child: CameraPreview(
                                                            controller
                                                                .cameraController!))
                                                    // controller.previewImage.isNotEmpty ? Image.memory(Uint8List.fromList(controller.previewImage)) : Container()
                                                    // Center(
                                                    //     child: CameraPreview(
                                                    //         controller.cameraController!)
                                                    // )
                                                    )),
                                          )
                                        : Container(),
                                  ],
                                )
                              : Center(
                                  child: Container(),
                                )),
                    ),
                    // Text( 'left: ${controller.faceRect.value.left} top: ${controller.faceRect.value.top} width:${controller.faceRect.value.width} height: ${controller.faceRect.value.height}' , style: TextStyle(fontSize: 16.0,)),
                    // Text( controller.output.value, style: TextStyle(fontSize: 16.0,)),

                    Text(
                        (controller.isSmiling.isTrue
                            ? 'keep smile :'
                            : 'let smile :'),
                        style: TextStyle(
                          fontSize: 16.0,
                        )),
                  ],
                ))),
      ],
    ));
  }
}
