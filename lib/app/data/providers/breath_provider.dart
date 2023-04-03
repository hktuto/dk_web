import 'dart:convert';

import 'package:get/get.dart';

import '../../utils/api.dart';
import '../models/breath_model.dart';

class BreathProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      if (map is String) map = jsonDecode(map);
      if (map is Map<String, dynamic>) return Breath.fromJson(map);
      if (map is List) return map.map((item) => Breath.fromJson(item)).toList();
    };
    
  }

  Future<Breath?> createBreath(Map data) async {
    final response = await post('breath_setting_create', data);
    return response.body;
  }

  Future<Response<Breath>> getBreath(Map data) async =>
      await post('breath_setting_read', data);

  Future<Response> deleteBreath(int id) async => await delete('breath/$id');
}
