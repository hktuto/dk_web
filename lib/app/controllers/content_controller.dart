import 'dart:developer';

import 'package:dk_app_flutter/app/data/providers/content_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../data/models/content_model.dart';

class ContentController extends GetxController {
  final ContentProvider provider = Get.put(ContentProvider());

  Future<List<Content>?> getContent(
    String tagType,
    List<String> tag,
    int page,
    int perPage,
  ) async {
    final query = '?tag_ids=[' +
        tag.map((e) => '"' + e + '"').join(",") +
        ']&tag_type=["' +
        tagType +
        '"]&page_number=$page&per_page=$perPage&post_lang="${Get.locale.toString()}"&post_category=["Relationship"]';
    try {
      print(query);
      List<Content> content = await provider.getContents(query);
      return content;
    } catch ($e) {
      print('first log fail');
      await Future.delayed(const Duration(seconds: 2), () {});
    }
    if (kDebugMode) {
      print('url : $query');
    }
    EasyLoading.dismiss();
    print('try again');
    return await provider.getContents(query);
  }
}
