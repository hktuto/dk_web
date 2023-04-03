import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class FullPageDialogView extends GetView {
  const FullPageDialogView({Key? key, this.topImage = "assets/images/bg-top-blue.png",
      this.bottomImage = "assets/images/bg-bottom-blue.png", required this.child}) : super(key: key);

    final String topImage;
  final String bottomImage;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#F7FAF7'),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Image.asset(
                topImage,
                fit: BoxFit.cover,
              )),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Image.asset(
                bottomImage,
                fit: BoxFit.cover,
              )),
          Container( child:child ),
        ],
      ),
    );
  }
}
