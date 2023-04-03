import 'package:get/get.dart';

import '../controllers/road_map_controller.dart';

class RoadMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoadMapController>(
      () => RoadMapController(),
    );
  }
}
