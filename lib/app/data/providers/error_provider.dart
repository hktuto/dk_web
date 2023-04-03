import 'package:get/get.dart';

import '../models/error_model.dart';

class ErrorProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Error.fromJson(map);
      if (map is List) return map.map((item) => Error.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Error?> getError(int id) async {
    final response = await get('error/$id');
    return response.body;
  }

  Future<Response<Error>> postError(Error error) async =>
      await post('error', error);
  Future<Response> deleteError(int id) async => await delete('error/$id');
}
