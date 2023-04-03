import 'dart:convert';
import 'package:dk_app_flutter/app/data/models/breath_record_model.dart';
import 'package:dk_app_flutter/app/utils/api.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:get/get.dart';

class BreathRecordProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      try {
        if (map == null) return throw Exception('error response');
        if (map is String) map = jsonDecode(map);
        if (map is Map<String, dynamic>) return BreathRecord.fromJson(map);
        if (map is List) {
          return map.map((item) => BreathRecord.fromJson(item)).toList();
        }
      } catch ($e) {
        logger.i(map);
        return map;
      }
    };
  }

  Future<List<BreathRecord>> getRecord(Map data) async =>
      await post('user_breathing_records', data).then( (res) => res.body);
  Future<BreathRecord> createRecord(Map data) async =>
      await post('breathing_record_create', data).then( (res) => res.body);
}
