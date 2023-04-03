import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';

class AppButton extends GetView {
  const AppButton({Key? key, this.label = '', this.action}) : super(key: key);

  final String label;
  final Function()? action;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
            width: double.infinity,
            child: SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [HexColor("#92ACA0"), HexColor("#89B2C4")]),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextButton(
                      onPressed: action,
                      child: Text(label,
                          style: const TextStyle(color: Colors.white))),
            )
          )
        )
      );
  }
}
