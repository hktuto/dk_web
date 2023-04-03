import 'dart:async';
import 'dart:developer';
// import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:dk_app_flutter/app/controllers/breathing_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/content_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/content_model.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as imglib;

class FaceDetectionController extends GetxController {
  RouterController router = Get.find<RouterController>();

  ContentController content = Get.find<ContentController>();
  ScoreController scoreController = Get.find<ScoreController>();
  BreathingRecordController record = Get.find<BreathingRecordController>();
  List<CameraDescription>? cameras;

  CameraImage? cameraImage;
  final _cameraController = Rx<CameraController?>(null);
  set cameraController(value) => _cameraController.value = value;
  get cameraController => _cameraController.value;
  RxList<String> output = List<String>.empty(growable: true).obs;
  RxInt counter = 5.obs;
  Timer? mytimer;

  RxBool isSmiling = false.obs;
  RxBool loading = false.obs;

  RxList<int> previewImage = <int>[].obs;

  RxDouble smilingProbability = 0.0.obs;
  RxList<double> totalSmiling = <double>[].obs;
  RxString emotion = "Happiness".obs;

  // face detechtion\
  final faceDetector = FaceDetector(
      options: FaceDetectorOptions(
    enableContours: true,
    enableLandmarks: true,
    enableClassification: true,
  ));

  RxBool testStart = false.obs;
  Rx<Rect> faceRect = Rect.fromLTRB(0.0, 0.0, 100.0, 100.0).obs;

  @override
  void onInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    super.onInit();
    cameras = await availableCameras();
    await loadCamera();
  }

  @override
  void onReady() async {
    super.onReady();

    startCounter();
  }

  @override
  void onClose() async {
    output.value = List<String>.empty(growable: true);
    // await _cameraController.value!.stopImageStream();
    await _cameraController.value!.dispose();
    await faceDetector.close();
    EasyLoading.dismiss();
  }

  // imageFormatGroup: ImageFormatGroup.yuv420
  loadCamera() {
    print("loadCamera");
    totalSmiling.value = <double>[];
    if (cameras != null) {
      _cameraController.value = CameraController(
          cameras!.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.front),
          ResolutionPreset.low);
      _cameraController.value!
          .initialize()
          .then((value) => cameraController!.startImageStream((image) {
                cameraImage = image;

                runModel();
              }));
      update();
    }
  }

  InputImage getFaceImageReady() {
    final camera = cameras!.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in cameraImage!.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(cameraImage!.width.toDouble(), cameraImage!.height.toDouble());

    const InputImageRotation imageRotation = InputImageRotation.rotation0deg;

    final InputImageFormat inputImageFormat =
        InputImageFormatValue.fromRawValue(cameraImage!.format.raw) ??
            InputImageFormat.nv21;

    final planeData = cameraImage!.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    return InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);
  }

  void runModel() async {
    if (cameraImage != null) {
      // detact face frist

      try {
        InputImage inputImage = getFaceImageReady();
        final List<Face> faces = await faceDetector.processImage(inputImage);

        if (faces.isEmpty) {
          testStart.value = false;
          update();
          return;
        }
        Face face = faces[0];
        var x, y, w, h;
        Rect faceSize = face.boundingBox;
        faceRect.value = faceSize;
        double diff = faceSize.width - faceSize.height;
        if (face.smilingProbability != null) {
          isSmiling.value = face.smilingProbability! > 0.6;
          smilingProbability.value = face.smilingProbability ?? 0;
          totalSmiling.value.add(face.smilingProbability ?? 0);
          update();
        } else {
          totalSmiling.value.add(0);
          update();
        }

        if (testStart.isFalse) {
          testStart.value = true;
        }

        // if (predictions.isNotEmpty) {
        //   output.add(predictions[0]['label']);
        //   update();
        // }
      } catch ($e) {
        print('error');
        print($e);
      }
    }
  }

  String scoreToTag(int score) {
    if (score > 75) {
      return 'Appreciation';
    }
    if (score > 50) {
      return 'Happiness';
    }
    if (score > 40) {
      return 'Trust';
    }
    if (score > 30) {
      return 'Frustration';
    }
    if (score > 20) {
      return 'Doubt';
    }
    if (score > 10) {
      return 'Anger';
    }
    if (score > 0) {
      return 'Guilt';
    }
    return 'Grief';
  }

  void finish() async {
    if (loading.isTrue) return;
    EasyLoading.show();
    loading.value = true;
    try {
      await _cameraController.value!.stopImageStream();
      // await _cameraController.value!.dispose();
      await faceDetector.close();
      UserController userController = Get.find<UserController>();
      // calculate score
      print("total");
      print(totalSmiling.value.length);
      int score = 0;
      if (totalSmiling.isNotEmpty) {
        score = (totalSmiling.reduce((a, b) => a + b) /
                totalSmiling.value.length *
                100)
            .round();
      }

      int bouns = record.calJouneryBonus();
      Map scoreParams = {
        'user': userController.user.value.userId,
        'score': score + bouns,
        "section": "emotion",
      };
      String tag = scoreToTag(score);
      await scoreController.saveUserScore(scoreParams);
      await scoreController.getUserTotalScore();
      try {
        List<Content>? posts = await content.getContent("emotion", [tag], 1, 5);
        loading.value = false;
        EasyLoading.dismiss();
        router.offPageWithProps(Routes.SMILE_SCORE, {
          'score': score.toString(),
          'bouns': bouns.toString(),
          'content': posts
        });
      } catch ($e) {
        EasyLoading.dismiss();
        router.offPageWithProps(Routes.SMILE_SCORE, {
          'score': score.toString(),
          'bouns': bouns.toString(),
        });
      }
    } catch ($e) {
      print($e);
      loading.value = false;
      EasyLoading.dismiss();
      router.offPage(Routes.MAIN);
    }
  }

  void startCounter() {
    mytimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (testStart.isFalse) return;
      counter--;
      if (counter.value <= 0) {
        counter.value = 0;
        mytimer!.cancel();
        // Emotion emotion = calculatEmotionOutput();
        finish();
      }
      update();
    });
  }
}
