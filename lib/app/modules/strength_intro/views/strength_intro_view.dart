import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/strength_intro_controller.dart';

class StrengthIntroView extends GetView<StrengthIntroController> {
  const StrengthIntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StrengthIntroView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StrengthIntroView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
