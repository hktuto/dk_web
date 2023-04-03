import 'package:dk_app_flutter/app/data/models/content_model.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/content_detail_controller.dart';

class ContentDetailView extends GetView<ContentDetailController> {
  const ContentDetailView({Key? key, this.option}) : super(key: key);
  final dynamic? option;
  @override
  Widget build(BuildContext context) {
    

    return DialogScreenView(
      child: Column(children: [
        const SizedBox(
          height: 40.0,
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: SectionHeaderView(
              label:option['post'].postHeadline,
              subtitle: '',
              labelSize: 26.0,
              labelWeight: FontWeight.w300,
              showBack: true),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(24.0),
              child: Text(option['post'].postContent.toString(), style: TextStyle( fontSize: 14.0, height: 2.0),)
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ]),
    );
  }
}
