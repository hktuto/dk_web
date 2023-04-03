import 'package:chewie/chewie.dart';
import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/setting_controller.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

class BreathVideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  BreathController breathController = Get.find<BreathController>();
  SettingController setting = Get.find<SettingController>();

  RxBool ready = false.obs;
  RxString loading = "loading".obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    logger.i('initializePlayer');
    initializePlayer();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    logger.i('dispose');
    chewieController!.dispose();
    videoPlayerController.dispose();
    super.dispose();
  }

  void goHome() {
    // storage.write('intro_finish', true);
    breathController.finishIntro();
  }

  void initializePlayer() async {
    String path =
        'assets/video/intro_1_' + setting.language.value.toString() + '.mp4';
    print(path);
    videoPlayerController = VideoPlayerController.asset(path);

    await videoPlayerController.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
        autoInitialize: true,
        showControls: false);
    logger.i("init");
    logger.i(chewieController != null &&
        chewieController!.videoPlayerController.value.isInitialized);
    videoPlayerController.addListener(checkVideo);
    ready.value = true;
    update();
  }

  void stopVideo() {
    // videoPlayerController.dispose();
    breathController.finishIntro();
    ready.value = false;
  }

  void checkVideo() {
    if (videoPlayerController.value.position ==
        videoPlayerController.value.duration) {
      stopVideo();
    }
  }
}
