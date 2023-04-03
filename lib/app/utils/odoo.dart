import 'package:dk_app_flutter/app/utils/env.dart';
import 'package:get/get.dart';

class OdooConnect extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ENV.odooUrl;
    httpClient.timeout = const Duration(minutes: 1);
    
  }
}
