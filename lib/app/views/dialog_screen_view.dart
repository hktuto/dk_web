import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DialogScreenView extends GetView {
  const DialogScreenView(
      {Key? key,
      this.topImage = "assets/images/bg-top-blue.png",
      this.bottomImage = "assets/images/bg-bottom-blue.png",
      this.size = 'normal',
      this.bgColor = '#F7FAF7',
      this.blendMode = BlendMode.multiply,
      required this.child})
      : super(key: key);
  final String topImage;
  final String bottomImage;
  final Widget? child;
  final String size;
  final String bgColor;
  final BlendMode blendMode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              top: MediaQuery.of(context).padding.top + 20,
              right: 20,
              bottom:  MediaQuery.of(context).viewInsets.bottom +
                    MediaQuery.of(context).padding.bottom +
                    (size == 'normal'
                        ? 20
                        : size == 'small'
                            ? 60
                            : 80),
            ),
            
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20.0,
                    color: Color(0x54000000),
                    spreadRadius: 2,
                  )
                ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor(bgColor),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(topImage,
                              fit: BoxFit.cover,
                              colorBlendMode: blendMode,
                              color: HexColor(bgColor))),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            bottomImage,
                            fit: BoxFit.cover,
                            colorBlendMode: blendMode,
                            color: HexColor(bgColor),
                          )),
                      Container(
                        child: child,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
