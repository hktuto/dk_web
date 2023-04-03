import 'dart:convert';

import 'package:dk_app_flutter/app/data/models/score_record_model.dart';
import 'package:dk_app_flutter/app/utils/api.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:get/get.dart';

class ScoreRecordProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      try {
        if (map == null) return throw Exception('error response');
        if (map is String) map = jsonDecode(map);
        if (map is Map<String, dynamic>) return ScoreRecord.fromJson(map);
        if (map is List) {
          return map.map((item) => ScoreRecord.fromJson(item)).toList();
        }
      } catch ($e) {
        logger.i($e);
        return map;
      }
    };
  }

  Future<void> createRecord(Map data) async =>
      await post('score_record_create', data);
}
