import 'dart:convert';
import 'dart:developer';

import 'package:dk_app_flutter/app/data/models/wheel_item.dart';
import 'package:dk_app_flutter/app/data/models/emotion_record.dart';
import 'package:dk_app_flutter/app/utils/api.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';

class WheelRecordProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      try {
        if (map == null) return throw Exception('error response');
        if (map is String) map = jsonDecode(map);
        if (map is Map<String, dynamic>) return WheelItem.fromJson(map);
        if (map is List) {
          return map.map((item) => WheelItem.fromJson(item)).toList();
        }
      } catch ($e) {
        return map;
      }
    };
  }

  Future<void> createWheel(Map data) async =>
      await post('wheel_of_life_record_create', data);

  Future<void> editWheel(Map data) async =>
      await post('wheel_of_life_record_update', data);

  Future<List<WheelItem>> getWheel(Map data) async =>
      await post('user_wheel_of_life_records', data).then((res) => res.body);
}
