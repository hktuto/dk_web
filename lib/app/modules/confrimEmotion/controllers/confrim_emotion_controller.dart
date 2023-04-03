import 'package:dk_app_flutter/app/controllers/breathing_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/content_controller.dart';
import 'package:dk_app_flutter/app/controllers/emotion_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/content_model.dart';
import 'package:dk_app_flutter/app/data/providers/emotion_record_provider%20copy.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Emotion {
  int score;
  String type;
  String color;

  Emotion({required this.score, required this.type, this.color = '#A661FE'});
}

class ConfrimEmotionController extends GetxController {
  UserController user = Get.find<UserController>();
  BreathingRecordController record = Get.find<BreathingRecordController>();
  RouterController router = Get.find<RouterController>();
  ScoreController score = Get.find<ScoreController>();

  EmotionRecordProvider provider = Get.put(EmotionRecordProvider());
  EmotionRecordController emotionRecordController =
      Get.find<EmotionRecordController>();

  UnityController unity = Get.find<UnityController>();

  ContentController content = Get.find<ContentController>();
  Color mainColor = Color.fromRGBO(219, 159, 255, 1.0);

  RxBool loading = false.obs;

  Map scoreToTag = {
    100: 'Appreciation',
    75: 'Happiness',
    50: 'Trust',
    40: 'Frustration',
    30: 'Doubt',
    20: 'Anger',
    10: 'Guilt',
    0: 'Grief'
  };

  List<Emotion> emotions = [
    Emotion(
      score: 100,
      type: "Joy",
    ),
    Emotion(score: 100, type: "Passion"),
    Emotion(score: 100, type: "Empower"),
    Emotion(score: 100, type: "Freedom"),
    Emotion(score: 100, type: "Love"),
    Emotion(score: 100, type: "Appreciation"),
    Emotion(score: 75, type: "Enthusiasm"),
    Emotion(score: 75, type: "Eagerness"),
    Emotion(score: 75, type: "Happiness"),
    Emotion(score: 75, type: "Positive"),
    Emotion(score: 75, type: "Expectation"),
    Emotion(score: 75, type: "Belief"),
    Emotion(score: 50, type: "Trust"),
    Emotion(score: 50, type: "Optimism"),
    Emotion(score: 50, type: "Hopefulness"),
    Emotion(score: 50, type: "Contentment"),
    Emotion(score: 40, type: "Boredom"),
    Emotion(score: 40, type: "Pessimism"),
    Emotion(score: 40, type: "Frustration"),
    Emotion(score: 40, type: "Irritation"),
    Emotion(score: 40, type: "Impatience"),
    Emotion(score: 30, type: "Disappointment"),
    Emotion(score: 30, type: "Doubt"),
    Emotion(score: 30, type: "Worry"),
    Emotion(score: 30, type: "Blame"),
    Emotion(score: 30, type: "Discouragement"),
    Emotion(score: 30, type: "Sadness"),
    Emotion(score: 20, type: "Anger"),
    Emotion(score: 20, type: "Rage"),
    Emotion(score: 20, type: "Revenge"),
    Emotion(score: 20, type: "Hatred"),
    Emotion(score: 10, type: "Jealousy"),
    Emotion(score: 10, type: "Insecurity"),
    Emotion(score: 10, type: "Guilt"),
    Emotion(score: 10, type: "Unworthiness"),
    Emotion(score: 0, type: "Fear"),
    Emotion(score: 0, type: "Grief"),
    Emotion(score: 0, type: "Depression"),
    Emotion(score: 0, type: "Despair"),
    Emotion(score: 0, type: "Powerlessness")
  ];
  Rx<Emotion> selection = Emotion(score: 100, type: "Love").obs;
  ScrollController listController = new ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // selection.value = (emotions..shuffle()).first;
  }

  @override
  void onClose() {}

  void changeSelection(Emotion newemotion) {
    selection.value = newemotion;
    int index = emotions.indexOf(newemotion);
    print(index);
    listController.animateTo((40 * index - 120).toDouble(),
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    update();
  }

  void submit() async {
    if (loading.isTrue) return;
    loading.value = true;
    print('submit');
    int bouns = record.calJouneryBonus();
    Map scoreRecord = {
      'user': user.user.value.userId,
      'score': selection.value.score + bouns,
      "section": "emotion",
    };
    // await score.saveUserScore(scoreRecord);
    // await score.getUserTotalScore();
    EasyLoading.show();
    // check is the user first emotion score
    final tag = scoreToTag[selection.value.score];
    await emotionRecordController.createOrUpdateScore(
        {'user': user.user.value.userId, 'emotion': selection.value.type});
    print('emotion tag : $tag');
    unity.sendMessage(method: 'setWeather', message: tag.toString());
    try {
      List<Content>? posts = await content.getContent("emotion", [tag], 1, 5);
      if (posts != null && posts.isNotEmpty) {
        loading.value = false;
        EasyLoading.dismiss();
        router.offPageWithProps(Routes.CONTENT, {'posts': posts});
      } else {
        loading.value = false;
        EasyLoading.dismiss();
        router.offPage(Routes.MAIN);
      }
    } catch ($e) {
      loading.value = false;
      EasyLoading.dismiss();
      router.offPage(Routes.MAIN);
    }
  }
}
