import 'dart:convert';
import 'dart:developer';

import 'package:dk_app_flutter/app/utils/api.dart';
import 'package:get/get.dart';
import '../../utils/logger.dart';
import '../models/login_model.dart';

class LoginForm {}

class LoginProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      if (map == null) return throw Exception('error response');
      if (map is String) map = jsonDecode(map);
      if (map is Map<String, dynamic>) return Login.fromJson(map);
      if (map is List) {
        return map.map((item) => Login.fromJson(item)).toList();
      }
    };
  }

  Future<Login> postLogin(Map data) async {
    return await post('login', data).then((value) {
      if (value.statusCode != 200) {
        throw Exception('user password not correct');
      }
      return value.body;
    });
  }

  Future<void> forgetPassword(Map data) async {
    await post('reset_password_request', data).then((res) {
      logger.i(res);
      logger.i(res.statusCode);
      if (res.statusCode != 200) {
        throw Exception('fail');
      }
    });
  }

  Future<Login> register(Map data) => post('register', data).then((res) {
        return res.body;
      });

  Future<Login> verifyLogin() => get('me').then((res) {
        logger.e(res.statusCode);
        if (res.statusCode != 200) {
          throw Exception('not login');
        }
        return res.body;
      });
}
