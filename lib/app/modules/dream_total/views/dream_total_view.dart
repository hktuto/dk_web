import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dream_total_controller.dart';

class DreamTotalView extends GetView<DreamTotalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DreamTotalView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DreamTotalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
