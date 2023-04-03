import 'package:dk_app_flutter/app/utils/api.dart';

class ScoreProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> saveUserScore(Map data) async =>
      await post('score_record_create', data);

  Future<int> getUserTotalRecord(Map data) async =>
      await post('user_total_score', data).then((res) {
        return res.body['user_total_score'] ?? 0;
      });
}
