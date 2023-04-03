import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class TextInputView extends GetView {
  const TextInputView(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.validator,
      this.suffixIcon,
      this.obscureText = false,
      this.maxLength,
      this.onEditingComplete
      })
      : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLength;
  final Function()? onEditingComplete;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enableInteractiveSelection: true,
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#A9C69B"), width: 2.0),
                borderRadius: const BorderRadius.all(Radius.circular(18))),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))),
            suffixIcon: suffixIcon,
            counterStyle: TextStyle(
                      height: double.minPositive,
                    ),
                    counterText: "",
            ),
        validator: validator,
        maxLength: maxLength,
        onEditingComplete:onEditingComplete,
        obscureText: obscureText);
  }
}
