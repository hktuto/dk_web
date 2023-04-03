import 'package:dk_app_flutter/app/utils/env.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiConnect extends GetConnect {
  final storage = GetStorage();
  @override
  void onInit() {
    httpClient.baseUrl = ENV.baseUrl;
    httpClient.addResponseModifier((request, response) async {
      String? rawCookie = response.headers!['set-cookie'];
      if (rawCookie != null) {
        storage.write('cookie', rawCookie);
      }
      return response;
    });
    httpClient.addRequestModifier<void>((request) {
      final rawCookie = storage.read('cookie');
      if (rawCookie != null) {
        int index = rawCookie.indexOf(';');
        request.headers['cookie'] =
            (index == -1) ? rawCookie : rawCookie.substring(0, index);
      }
      return request;
    });
  }
}
