import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class QuestionView extends GetView {
  const QuestionView({Key? key, this.label = '', this.selected = false, this.color = '#50B3C6', this.onTap})
      : super(key: key);

  final String label;
  final bool selected;
  final String color;
  final Function() ? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: selected ? HexColor(color) : HexColor("#F7FAF7") 
        ),
        child: Text(
          label, 
          style: TextStyle( 
            color : selected ? Colors.white : HexColor("#827E75"),
            fontSize: 14.0,
            fontWeight: FontWeight.w300
            ),
          ),
      ),
    );
  }
}
