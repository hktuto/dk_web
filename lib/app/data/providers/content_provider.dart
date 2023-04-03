import 'dart:convert';
import 'dart:developer';

import 'package:dk_app_flutter/app/data/models/content_model.dart';
import 'package:dk_app_flutter/app/utils/odoo.dart';
import 'package:get/get.dart';

import '../../utils/logger.dart';

class ContentProvider extends OdooConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      try {
        if (map == Null) {
          return [];
        }
        if (map.contains('!DOCTYP')) {
          throw Exception('retry');
        }
        if (map is String) map = jsonDecode(map);
      } catch ($e) {
        print('error in decoder' + $e.toString());
        throw Exception('retry');
      }
      if (map is Map<String, dynamic>) return Content.fromJson(map);
      if (map is List) {
        return map.map((item) => Content.fromJson(item)).toList();
      }
    };
  }

  Future<List<Content>> getContents(String query) async {
    try {
      return await get('fetch_wheel_post' + query).then((res) => res.body);
    } catch ($e) {
      logger.i($e);
      throw Exception($e);
    }
  }
}
