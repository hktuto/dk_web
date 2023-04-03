import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/modules/achievement/bindings/achievement_binding.dart';
import 'package:dk_app_flutter/app/modules/achievement/views/achievement_view.dart';
import 'package:dk_app_flutter/app/modules/breath/bindings/breath_binding.dart';
import 'package:dk_app_flutter/app/modules/breath/views/breath_view.dart';
import 'package:dk_app_flutter/app/modules/breathFinish/bindings/breath_finish_binding.dart';
import 'package:dk_app_flutter/app/modules/breathFinish/views/breath_finish_view.dart';
import 'package:dk_app_flutter/app/modules/breathIntro/bindings/breath_intro_binding.dart';
import 'package:dk_app_flutter/app/modules/breathIntro/views/breath_intro_view.dart';
import 'package:dk_app_flutter/app/modules/breathQuestion/bindings/breath_question_binding.dart';
import 'package:dk_app_flutter/app/modules/breathQuestion/views/breath_question_view.dart';
import 'package:dk_app_flutter/app/modules/breathVideo/bindings/breath_video_binding.dart';
import 'package:dk_app_flutter/app/modules/breathVideo/views/breath_video_view.dart';
import 'package:dk_app_flutter/app/modules/breath_register_flow/bindings/breath_register_flow_binding.dart';
import 'package:dk_app_flutter/app/modules/breath_register_flow/views/breath_register_flow_view.dart';
import 'package:dk_app_flutter/app/modules/confrimEmotion/bindings/confrim_emotion_binding.dart';
import 'package:dk_app_flutter/app/modules/confrimEmotion/views/confrim_emotion_view.dart';
import 'package:dk_app_flutter/app/modules/content/bindings/content_binding.dart';
import 'package:dk_app_flutter/app/modules/content/views/content_view.dart';
import 'package:dk_app_flutter/app/modules/content_detail/bindings/content_detail_binding.dart';
import 'package:dk_app_flutter/app/modules/content_detail/views/content_detail_view.dart';
import 'package:dk_app_flutter/app/modules/dream_create/bindings/dream_create_binding.dart';
import 'package:dk_app_flutter/app/modules/dream_create/views/dream_create_view.dart';
import 'package:dk_app_flutter/app/modules/dream_detail/bindings/dream_detail_binding.dart';
import 'package:dk_app_flutter/app/modules/dream_detail/views/dream_detail_view.dart';
import 'package:dk_app_flutter/app/modules/dream_intro/bindings/dream_intro_binding.dart';
import 'package:dk_app_flutter/app/modules/dream_intro/views/dream_intro_view.dart';
import 'package:dk_app_flutter/app/modules/dream_list/bindings/dream_list_binding.dart';
import 'package:dk_app_flutter/app/modules/dream_list/views/dream_list_view.dart';
import 'package:dk_app_flutter/app/modules/emotion_intro/bindings/emotion_intro_binding.dart';
import 'package:dk_app_flutter/app/modules/emotion_intro/views/emotion_intro_view.dart';
import 'package:dk_app_flutter/app/modules/empty/bindings/empty_binding.dart';
import 'package:dk_app_flutter/app/modules/empty/views/empty_view.dart';
import 'package:dk_app_flutter/app/modules/faceDetaction/bindings/face_detaction_binding.dart';
import 'package:dk_app_flutter/app/modules/faceDetaction/views/face_detection.dart';
import 'package:dk_app_flutter/app/modules/forgetPassword/bindings/forget_password_binding.dart';
import 'package:dk_app_flutter/app/modules/forgetPassword/views/forget_password_view.dart';
import 'package:dk_app_flutter/app/modules/game_intro/bindings/game_intro_binding.dart';
import 'package:dk_app_flutter/app/modules/game_intro/views/game_intro_view.dart';
import 'package:dk_app_flutter/app/modules/inventory/bindings/inventory_binding.dart';
import 'package:dk_app_flutter/app/modules/inventory/views/inventory_view.dart';
import 'package:dk_app_flutter/app/modules/landing/bindings/landing_binding.dart';
import 'package:dk_app_flutter/app/modules/landing/views/landing_view.dart';
import 'package:dk_app_flutter/app/modules/login/bindings/login_binding.dart';
import 'package:dk_app_flutter/app/modules/login/views/login_view.dart';
import 'package:dk_app_flutter/app/modules/main/bindings/main_binding.dart';
import 'package:dk_app_flutter/app/modules/main/views/main_view.dart';
import 'package:dk_app_flutter/app/modules/menu/bindings/menu_binding.dart';
import 'package:dk_app_flutter/app/modules/menu/views/menu_view.dart';
import 'package:dk_app_flutter/app/modules/newAchievement/bindings/new_achievement_binding.dart';
import 'package:dk_app_flutter/app/modules/newAchievement/views/new_achievement_view.dart';
import 'package:dk_app_flutter/app/modules/register/bindings/register_binding.dart';
import 'package:dk_app_flutter/app/modules/register/views/register_view.dart';
import 'package:dk_app_flutter/app/modules/road_map/bindings/road_map_binding.dart';
import 'package:dk_app_flutter/app/modules/road_map/views/road_map_view.dart';
import 'package:dk_app_flutter/app/modules/scoreResult/bindings/score_result_binding.dart';
import 'package:dk_app_flutter/app/modules/scoreResult/views/score_result_view.dart';
import 'package:dk_app_flutter/app/modules/setting/bindings/setting_binding.dart';
import 'package:dk_app_flutter/app/modules/setting/views/setting_view.dart';
import 'package:dk_app_flutter/app/modules/smile_intro/bindings/smile_intro_binding.dart';
import 'package:dk_app_flutter/app/modules/smile_intro/views/smile_intro_view.dart';
import 'package:dk_app_flutter/app/modules/smile_score/bindings/smile_score_binding.dart';
import 'package:dk_app_flutter/app/modules/smile_score/views/smile_score_view.dart';
import 'package:dk_app_flutter/app/modules/strength_create/bindings/strength_create_binding.dart';
import 'package:dk_app_flutter/app/modules/strength_create/views/strength_create_view.dart';
import 'package:dk_app_flutter/app/modules/strength_list/bindings/strength_list_binding.dart';
import 'package:dk_app_flutter/app/modules/strength_list/views/strength_list_view.dart';
import 'package:dk_app_flutter/app/modules/ui_intro/bindings/ui_intro_binding.dart';
import 'package:dk_app_flutter/app/modules/ui_intro/views/ui_intro_view.dart';
import 'package:dk_app_flutter/app/modules/wheelOfLife/bindings/wheel_of_life_binding.dart';
import 'package:dk_app_flutter/app/modules/wheelOfLife/views/wheel_of_life_view.dart';
import 'package:dk_app_flutter/app/modules/wheel_intro/bindings/wheel_intro_binding.dart';
import 'package:dk_app_flutter/app/modules/wheel_intro/views/wheel_intro_view.dart';
import 'package:dk_app_flutter/app/modules/wheel_score/bindings/wheel_score_binding.dart';
import 'package:dk_app_flutter/app/modules/wheel_score/views/wheel_score_view.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouterController extends GetxController {
  RxBool ignorePointer = false.obs;

  final UnityController unity = Get.find<UnityController>();

  static RouterController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  void changePage(String path) {
    Get.toNamed(path, id: 1);
    shouldIgnorePointer(path);
  }

  void changePageWithProps(String path, dynamic arguments) {
    Get.toNamed(path, id: 1, arguments: arguments);
    shouldIgnorePointer(path);
  }

  void offPage(String path) {
    Get.offNamed(path, id: 1);
    shouldIgnorePointer(path);
  }

  void offPageWithProps(String path, dynamic arguments) {
    Get.offNamed(path, id: 1, arguments: arguments);
    shouldIgnorePointer(path);
  }

  void shouldIgnorePointer(String nextScene) {
    print("nextScene : " + nextScene);
    if (nextScene == Routes.MAIN) {
      print(Routes.MAIN);
      unity.lastAction.value = "goMain";
      ignorePointer.value = true;
      unity.sendMessage(
        method: "changeView",
        message: "toMainView",
      );
      update();
      return;
    }

    if (nextScene == Routes.BREATH ||
        nextScene == Routes.BREATH_FINISH ||
        nextScene == Routes.BREATH_INTRO ||
        nextScene == Routes.BREATH_QUESTION ||
        nextScene == Routes.BREATH_VIDEO) {
      unity.sendMessage(
        method: "changeViewWithMessage",
        message: "Breath",
      );
      ignorePointer.value = false;
      unity.sendMessage(
        method: "changeView",
        message: "toNoAction",
      );
      update();
      return;
    }
    if (nextScene == Routes.DREAM_LIST ||
        nextScene == Routes.DREAM_CREATE ||
        nextScene == Routes.DREAM_DETAIL ||
        nextScene == Routes.DREAM_TOTAL) {
      unity.sendMessage(
        method: "changeViewWithMessage",
        message: "Dream",
      );
      ignorePointer.value = false;
      unity.sendMessage(
        method: "changeView",
        message: "toNoAction",
      );
      update();
      return;
    } else if (nextScene == Routes.WHEEL_OF_LIFE) {
      unity.sendMessage(
        method: "changeViewWithMessage",
        message: "Wheel",
      );
      ignorePointer.value = false;
      unity.sendMessage(
        method: "changeView",
        message: "toNoAction",
      );
      update();
      return;
    }
    if (nextScene == Routes.STRENGTH_CREATE ||
        nextScene == Routes.STRENGTH_LIST) {
      unity.sendMessage(
        method: "changeViewWithMessage",
        message: "Strength",
      );
      ignorePointer.value = false;
      unity.sendMessage(
        method: "changeView",
        message: "toNoAction",
      );
      update();
      return;
    }

    if (nextScene == Routes.INVENTORY) {
      // unity.lastAction.value = "INVENTORY";
      ignorePointer.value = false;
      unity.sendMessage(
        method: "changeView",
        message: "toNoAction",
      );
      unity.sendMessage(method: "SetTopDefaultView");
    }

    if (nextScene == Routes.MENU) {
      unity.lastAction.value = "MENU";
      ignorePointer.value = false;
      unity.sendMessage(
        method: "changeView",
        message: "toNoAction",
      );
      update();
      return;
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    String path = settings.name.toString().split('?')[0];

    switch (path) {
      case Routes.MAIN:
        return GetPageRoute(
            settings: settings, page: () => MainView(), binding: MainBinding());
      case Routes.MENU:
        return GetPageRoute(
            settings: settings, page: () => MenuView(), binding: MenuBinding());
      case Routes.LANDING:
        return GetPageRoute(
            settings: settings,
            page: () => LandingView(),
            binding: LandingBinding());
      case Routes.FORGET_PASSWORD:
        return GetPageRoute(
          settings: settings,
          page: () => ForgetPasswordView(),
          binding: ForgetPasswordBinding(),
        );
      case Routes.LOGIN:
        return GetPageRoute(
          settings: settings,
          page: () => LoginView(),
          binding: LoginBinding(),
        );
      case Routes.REGISTER:
        return GetPageRoute(
          settings: settings,
          page: () => RegisterView(),
          binding: RegisterBinding(),
        );
      case Routes.BREATH:
        return GetPageRoute(
            settings: settings,
            page: () => BreathView(),
            binding: BreathBinding());
      case Routes.BREATH_QUESTION:
        return GetPageRoute(
            settings: settings,
            page: () => BreathQuestionView(),
            binding: BreathQuestionBinding());
      case Routes.BREATH_INTRO:
        return GetPageRoute(
            settings: settings,
            page: () => BreathIntroView(),
            binding: BreathIntroBinding());
      case Routes.BREATH_VIDEO:
        return GetPageRoute(
            settings: settings,
            page: () => BreathVideoView(),
            binding: BreathVideoBinding());
      case Routes.BREATH_FINISH:
        return GetPageRoute(
            settings: settings,
            page: () => BreathFinishView(),
            binding: BreathFinishBinding());

      case Routes.SCORE_RESULT:
        return GetPageRoute(
          settings: settings,
          page: () => ScoreResultView(option: settings.arguments),
          binding: ScoreResultBinding(),
        );
      case Routes.SETTING:
        return GetPageRoute(
            settings: settings,
            page: () => SettingView(),
            binding: SettingBinding());
      case Routes.EMPTY:
        return GetPageRoute(
            settings: settings,
            page: () => EmptyView(),
            binding: EmptyBinding());
      case Routes.ACHIEVEMENT:
        return GetPageRoute(
            settings: settings,
            page: () => AchievementView(),
            binding: AchievementBinding());
      case Routes.NEW_ACHIEVEMENT:
        return GetPageRoute(
            settings: settings,
            page: () => NewAchievementView(option: settings.arguments),
            binding: NewAchievementBinding());
      case Routes.FACE_DETECTION:
        return GetPageRoute(
            settings: settings,
            page: () => FaceDetectioniew(),
            binding: FaceDetectionBinding());
      case Routes.CONFRIM_EMOTION:
        return GetPageRoute(
            settings: settings,
            page: () => ConfrimEmotionView(),
            binding: ConfrimEmotionBinding());
      case Routes.CONTENT:
        return GetPageRoute(
            settings: settings,
            page: () => ContentView(option: settings.arguments),
            binding: ContentBinding());
      case Routes.CONTENT_DETAIL:
        return GetPageRoute(
            settings: settings,
            page: () => ContentDetailView(option: settings.arguments),
            binding: ContentDetailBinding());
      case Routes.WHEEL_OF_LIFE:
        return GetPageRoute(
            settings: settings,
            page: () => WheelOfLifeView(),
            binding: WheelOfLifeBinding());
      case Routes.WHEEL_SCORE:
        return GetPageRoute(
            settings: settings,
            page: () => WheelScoreView(option: settings.arguments),
            binding: WheelScoreBinding());
      case Routes.SMILE_SCORE:
        return GetPageRoute(
            settings: settings,
            page: () => SmileScoreView(option: settings.arguments),
            binding: SmileScoreBinding());
      case Routes.DREAM_LIST:
        return GetPageRoute(
            settings: settings,
            page: () => DreamListView(),
            binding: DreamListBinding());
      case Routes.DREAM_CREATE:
        return GetPageRoute(
            settings: settings,
            page: () => DreamCreateView(),
            binding: DreamCreateBinding());
      case Routes.DREAM_DETAIL:
        return GetPageRoute(
            settings: settings,
            page: () => DreamDetailView(option: settings.arguments),
            binding: DreamDetailBinding());
      case Routes.STRENGTH_LIST:
        return GetPageRoute(
            settings: settings,
            page: () => StrengthListView(option: settings.arguments),
            binding: StrengthListBinding());
      case Routes.STRENGTH_CREATE:
        return GetPageRoute(
            settings: settings,
            page: () => StrengthCreateView(),
            binding: StrengthCreateBinding());
      case Routes.INVENTORY:
        return GetPageRoute(
            settings: settings,
            page: () => InventoryView(),
            binding: InventoryBinding());
      case Routes.GAME_INTRO:
        return GetPageRoute(
            settings: settings,
            page: () => GameIntroView(),
            binding: GameIntroBinding());
      case Routes.UI_INTRO:
        return GetPageRoute(
            settings: settings,
            page: () => UiIntroView(),
            binding: UiIntroBinding());
      case Routes.BREATH_REGISTER_FLOW:
        return GetPageRoute(
            settings: settings,
            page: () => BreathRegisterFlowView(),
            binding: BreathRegisterFlowBinding());
      case Routes.DREAM_INTRO:
        return GetPageRoute(
            settings: settings,
            page: () => DreamIntroView(),
            binding: DreamIntroBinding());
      case Routes.SMILE_INTRO:
        return GetPageRoute(
            settings: settings,
            page: () => SmileIntroView(),
            binding: SmileIntroBinding());
      case Routes.EMOTION_INTRO:
        return GetPageRoute(
            settings: settings,
            page: () => EmotionIntroView(),
            binding: EmotionIntroBinding());
      case Routes.WHEEL_INTRO:
        return GetPageRoute(
            settings: settings,
            page: () => WheelIntroView(),
            binding: WheelIntroBinding());
      case Routes.ROAD_MAP:
        return GetPageRoute(
            settings: settings,
            page: () => RoadMapView(),
            binding: RoadMapBinding());
    }

    return GetPageRoute(
        settings: settings, page: () => MainView(), binding: MainBinding());
  }
}
