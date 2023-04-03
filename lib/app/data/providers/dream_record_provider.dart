import 'dart:convert';
import 'dart:developer';

import 'package:dk_app_flutter/app/data/models/dream_model.dart';
import 'package:dk_app_flutter/app/utils/api.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';

class DreamRecordProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      try {
        inspect(map);
        if (map == null) return throw Exception('error response');
        if (map is String) map = jsonDecode(map);
        if (map is Map<String, dynamic>) return DreamItem.fromJson(map);
        if (map is List) {
          return map.map((item) => DreamItem.fromJson(item)).toList();
        }
      } catch ($e) {
        logger.i($e);
        return map;
      }
    };
  }

  Future<void> updateDrea(Map data) async =>
      await post('dream_machine_update', data);

  Future<DreamItem> createDream(Map data) async =>
      await post('dream_machine_create', data).then((res) => res.body);

  Future<List<DreamItem>> getDream(Map data) async =>
      await post('user_dream_machine_records', data).then((res) => res.body);
}
