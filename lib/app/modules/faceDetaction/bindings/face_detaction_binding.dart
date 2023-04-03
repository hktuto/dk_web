import 'package:get/get.dart';

import '../controllers/face_detection.dart';

class FaceDetectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaceDetectionController>(
      () => FaceDetectionController(),
    );
  }
}
