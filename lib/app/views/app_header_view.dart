import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppHeaderView extends GetView {
  AppHeaderView({this.label = '', this.subtitle = ''});
  final String label;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.0,
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: SectionHeaderView(
              label: label,
              subtitle: subtitle,
              showBack: false,
            )),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
