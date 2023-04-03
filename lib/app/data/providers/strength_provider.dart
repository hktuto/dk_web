import 'dart:convert';
import 'dart:developer';

import 'package:dk_app_flutter/app/data/models/strength_model.dart';
import 'package:dk_app_flutter/app/utils/api.dart';
import 'package:get/get.dart';

class StrengthProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      try {
        if (map == null) return throw Exception('error response');
        if (map is String) map = jsonDecode(map);
        if (map is Map<String, dynamic>) return StrengthItem.fromJson(map);
        if (map is List) {
          return map.map((item) => StrengthItem.fromJson(item)).toList();
        }
      } catch ($e) {
        return map;
      }
    };
  }

  Future<dynamic> createStrength(Map data) async =>
      await post('strength_label_record_create', data);

  Future<Response> getStrength(Map data) async =>
      await post('user_strength_label_record_records', data);
}
