import 'dart:math';

import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/controllers/setting_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/dream_model.dart';
import 'package:dk_app_flutter/app/data/providers/dream_record_provider.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/breath_model.dart';

class Options {
  int id;
  String name;
  String question;
  String tagline;
  String description;
  List<String> colors;
  int inhaleDuration;
  int exhaleDuration;
  int duration;
  int score;

  Options(
      {required this.id,
      this.name = '',
      this.question = '',
      this.tagline = '',
      this.description = '',
      this.colors = const [],
      this.inhaleDuration = 10,
      this.exhaleDuration = 10,
      this.duration = 300,
      this.score = 100});
}

class BreathController extends GetxController {
  final storage = GetStorage();
  UnityController unityController = Get.find<UnityController>();
  RouterController router = Get.find<RouterController>();
  ScoreController score = Get.find<ScoreController>();

  SettingController setting = Get.find<SettingController>();

  RxInt currentOption = 0.obs;
  RxInt lastOption = 0.obs;
  RxDouble timeDuration = 0.0.obs;

  RxBool isBreathing = false.obs;

  List<Options> optionsSetting = [
    Options(
        id: 0,
        name: 'Fire',
        question: 'Easily feeling angey and unbalanced',
        tagline: "Sweat Dream and Passion",
        colors: ['#c97e6b', '#D1544D']),
    Options(
        id: 1,
        name: 'Water',
        question: 'Cannot focus properly',
        tagline: "Sweat Dream and Passion",
        colors: ['#8dc3c4', '#82B3B7']),
    Options(
        id: 2,
        name: 'Wood',
        question: 'Stress and feeling a lack of personal',
        tagline: "Sweat Dream and Passion",
        colors: ['#809e8f', '#A898BC']),
    Options(
        id: 3,
        name: 'Metal',
        question: 'Lask of confidence and feelding not attractive',
        tagline: "Sweat Dream and Passion",
        colors: ['#a6795b', '#66A9C6']),
    Options(
        id: 4,
        name: 'Earth',
        question: 'Insomnia and loss of passion in life',
        tagline: "Sweat Dream and Passion",
        colors: [
          '#958fb3',
          '#BF9776',
        ]),
  ];

  Rx<Options> currentOptionsSetting = Options(
      id: 0,
      name: 'Fire',
      question: 'Easily feeling angey and unbalanced',
      tagline: "Sweat Dream and Passion",
      colors: ['#D55F53', '#D1544D']).obs;

  RxString step = 'startScreen'.obs;

  RxInt introStep = 1.obs;
  RxInt breathTimer = 0.obs;
  RxBool musicMute = false.obs;
  RxBool skipIntro = false.obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final _lastOption = storage.read('lastOption');
    if (_lastOption != null) {
      currentOptionsSetting.value = optionsSetting[_lastOption];
    }
    musicMute.value = storage.read('mute') ?? false;
    skipIntro.value = storage.read('skipintro') ?? false;
    update();
    // get value from storage
  }

  void toggleSkipIntro() {
    skipIntro.toggle();
    storage.write('skipintro', skipIntro.value);
    update();
  }

  void toggleMute() {
    musicMute.toggle();
    unityController.sendMessage(
        method: 'setMute', message: musicMute.toString());
    unityController.sendMessage(
      method: 'toggleMute',
      gameObject: "BreathController",
    );
    storage.write('mute', musicMute.value);
    update();
  }

  void changeOption(Options option) {
    currentOptionsSetting.value = option;
    update();
  }

  void startBreath() {
    router.changePage(Routes.BREATH_QUESTION);
  }

  void submitOption() {
    storage.write('lastOption', currentOptionsSetting.value.id);
    router.changePage(Routes.BREATH_INTRO);

    // unityController.sendMessage(method: 'goBreath');
    update();
  }

  void finishGraphicIntro() {
    if (skipIntro.isFalse) {
      router.changePage(Routes.BREATH_VIDEO);
    } else {
      finishIntro();
    }
  }

  void finishIntro() async {
    if (loading.isTrue) return;

    loading.value = true;
    update();
    // TODO : get dream and send to unity
    DreamRecordProvider provider = Get.put(DreamRecordProvider());
    UserController userController = Get.find<UserController>();
    List<DreamItem> result =
        await provider.getDream({"user_id": userController.user.value.userId});
    if (result.isNotEmpty) {
      // filter all done dream
      Iterable<DreamItem> filterItem = result.where((element) =>
          element.process == null ||
          element.process != null && element.process! < 100);
      final _random = new Random();
      if (filterItem.isNotEmpty) {
        String dreamsString =
            filterItem.map((element) => element.dream).join('||');
        unityController.sendMessage(method: 'setDream', message: dreamsString);
      }
    }
    // get dream
    introStep.value = 1;
    unityController.sendMessage(
        method: 'setBreath_in',
        message: setting.breathInterval.value.toString());
    unityController.sendMessage(
        method: 'setBreath_out',
        message: setting.breathInterval.value.toString());
    unityController.sendMessage(
        method: 'setDuration',
        message: setting.breathDuration.value.toString());
    unityController.sendMessage(
        method: 'setMute', message: musicMute.toString());
    unityController.sendMessage(method: 'StartBreath');
    router.offPage(Routes.BREATH);
    loading.value = false;
    update();
  }

  void saveRecord() {}

  void restatBreath() {
    if (loading.isTrue) return;
    loading.value = true;
    isBreathing.value = false;
    unityController.sendMessage(
        method: 'restartBreath', gameObject: "BreathController");
    loading.value = false;
    update();
  }

  void cancelBreath() {
    if (loading.isTrue) return;
    loading.value = true;
    update();
    unityController.sendMessage(method: 'CancelBreath');
    loading.value = false;
    update();
    router.offPage(Routes.MAIN);
  }

  void stopBreath() {
    if (loading.isTrue) return;
    loading.value = true;
    update();
    unityController.sendMessage(
        method: 'stopBreath', gameObject: "BreathController");
    timeDuration.value =
        (DateTime.now().millisecondsSinceEpoch - breathTimer.value) / 1000;
    // TODO : Cal score
    isBreathing.value = false;
    loading.value = false;
    update();
  }
}
