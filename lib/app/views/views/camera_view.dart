import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CameraView extends GetView {
  @override
  Widget build(BuildContext context) {
    UnityController unity = Get.find<UnityController>();
    return Stack(
      children: [
        GestureDetector(
          onPanStart: (detail) => unity.panStart(detail),
          onPanUpdate: (detail) => unity.panUpdate(detail),
          onPanEnd: (detail) => unity.panEnd(),
          onTap: () => unity.tap(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Colors.white.withOpacity(0))),
          ),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width * 0.4,
            bottom: 90,
            child: GestureDetector(
              onTapDown: (detail) => unity.startMove(),
              onTapUp: (detail) => unity.endMove(),
              onTapCancel: () => unity.endMove(),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Center(child: Text('walk')),
              ),
            ))
      ],
    );
  }
}
