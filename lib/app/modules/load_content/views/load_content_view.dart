import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/load_content_controller.dart';

class LoadContentView extends GetView<LoadContentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoadContentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LoadContentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
