import 'package:get/get.dart';

import '../modules/achievement/bindings/achievement_binding.dart';
import '../modules/achievement/views/achievement_view.dart';
import '../modules/breath/bindings/breath_binding.dart';
import '../modules/breath/views/breath_view.dart';
import '../modules/breathFinish/bindings/breath_finish_binding.dart';
import '../modules/breathFinish/views/breath_finish_view.dart';
import '../modules/breathIntro/bindings/breath_intro_binding.dart';
import '../modules/breathIntro/views/breath_intro_view.dart';
import '../modules/breathQuestion/bindings/breath_question_binding.dart';
import '../modules/breathQuestion/views/breath_question_view.dart';
import '../modules/breathVideo/bindings/breath_video_binding.dart';
import '../modules/breathVideo/views/breath_video_view.dart';
import '../modules/breath_register_flow/bindings/breath_register_flow_binding.dart';
import '../modules/breath_register_flow/views/breath_register_flow_view.dart';
import '../modules/confrimEmotion/bindings/confrim_emotion_binding.dart';
import '../modules/confrimEmotion/views/confrim_emotion_view.dart';
import '../modules/content/bindings/content_binding.dart';
import '../modules/content/views/content_view.dart';
import '../modules/content_detail/bindings/content_detail_binding.dart';
import '../modules/content_detail/views/content_detail_view.dart';
import '../modules/dream_create/bindings/dream_create_binding.dart';
import '../modules/dream_create/views/dream_create_view.dart';
import '../modules/dream_detail/bindings/dream_detail_binding.dart';
import '../modules/dream_detail/views/dream_detail_view.dart';
import '../modules/dream_intro/bindings/dream_intro_binding.dart';
import '../modules/dream_intro/views/dream_intro_view.dart';
import '../modules/dream_list/bindings/dream_list_binding.dart';
import '../modules/dream_list/views/dream_list_view.dart';
import '../modules/dream_total/bindings/dream_total_binding.dart';
import '../modules/dream_total/views/dream_total_view.dart';
import '../modules/emotion_intro/bindings/emotion_intro_binding.dart';
import '../modules/emotion_intro/views/emotion_intro_view.dart';
import '../modules/empty/bindings/empty_binding.dart';
import '../modules/empty/views/empty_view.dart';
import '../modules/game_intro/bindings/game_intro_binding.dart';
import '../modules/game_intro/views/game_intro_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/inventory/bindings/inventory_binding.dart';
import '../modules/inventory/views/inventory_view.dart';
import '../modules/load_content/bindings/load_content_binding.dart';
import '../modules/load_content/views/load_content_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/menu/bindings/menu_binding.dart';
import '../modules/menu/views/menu_view.dart';
import '../modules/newAchievement/bindings/new_achievement_binding.dart';
import '../modules/newAchievement/views/new_achievement_view.dart';
import '../modules/road_map/bindings/road_map_binding.dart';
import '../modules/road_map/views/road_map_view.dart';
import '../modules/scoreResult/bindings/score_result_binding.dart';
import '../modules/scoreResult/views/score_result_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/smile_intro/bindings/smile_intro_binding.dart';
import '../modules/smile_intro/views/smile_intro_view.dart';
import '../modules/smile_score/bindings/smile_score_binding.dart';
import '../modules/smile_score/views/smile_score_view.dart';
import '../modules/strength_create/bindings/strength_create_binding.dart';
import '../modules/strength_create/views/strength_create_view.dart';
import '../modules/strength_intro/bindings/strength_intro_binding.dart';
import '../modules/strength_intro/views/strength_intro_view.dart';
import '../modules/strength_list/bindings/strength_list_binding.dart';
import '../modules/strength_list/views/strength_list_view.dart';
import '../modules/ui_intro/bindings/ui_intro_binding.dart';
import '../modules/ui_intro/views/ui_intro_view.dart';
import '../modules/wheelOfLife/bindings/wheel_of_life_binding.dart';
import '../modules/wheelOfLife/views/wheel_of_life_view.dart';
import '../modules/wheel_intro/bindings/wheel_intro_binding.dart';
import '../modules/wheel_intro/views/wheel_intro_view.dart';
import '../modules/wheel_score/bindings/wheel_score_binding.dart';
import '../modules/wheel_score/views/wheel_score_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.BREATH,
      page: () => BreathView(),
      binding: BreathBinding(),
    ),
    GetPage(
      name: _Paths.BREATH_QUESTION,
      page: () => BreathQuestionView(),
      binding: BreathQuestionBinding(),
    ),
    GetPage(
      name: _Paths.BREATH_INTRO,
      page: () => BreathIntroView(),
      binding: BreathIntroBinding(),
    ),
    GetPage(
      name: _Paths.BREATH_VIDEO,
      page: () => BreathVideoView(),
      binding: BreathVideoBinding(),
    ),
    GetPage(
      name: _Paths.EMPTY,
      page: () => EmptyView(),
      binding: EmptyBinding(),
    ),
    GetPage(
      name: _Paths.BREATH_FINISH,
      page: () => BreathFinishView(),
      binding: BreathFinishBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.SCORE_RESULT,
      page: () => ScoreResultView(),
      binding: ScoreResultBinding(),
    ),
    GetPage(
      name: _Paths.NEW_ACHIEVEMENT,
      page: () => NewAchievementView(),
      binding: NewAchievementBinding(),
    ),
    GetPage(
      name: _Paths.ACHIEVEMENT,
      page: () => AchievementView(),
      binding: AchievementBinding(),
    ),
    GetPage(
      name: _Paths.CONFRIM_EMOTION,
      page: () => ConfrimEmotionView(),
      binding: ConfrimEmotionBinding(),
    ),
    GetPage(
      name: _Paths.CONTENT,
      page: () => ContentView(),
      binding: ContentBinding(),
    ),
    GetPage(
      name: _Paths.CONTENT_DETAIL,
      page: () => ContentDetailView(),
      binding: ContentDetailBinding(),
    ),
    GetPage(
      name: _Paths.WHEEL_OF_LIFE,
      page: () => WheelOfLifeView(),
      binding: WheelOfLifeBinding(),
    ),
    GetPage(
      name: _Paths.DREAM_TOTAL,
      page: () => DreamTotalView(),
      binding: DreamTotalBinding(),
    ),
    GetPage(
      name: _Paths.WHEEL_SCORE,
      page: () => WheelScoreView(),
      binding: WheelScoreBinding(),
    ),
    GetPage(
      name: _Paths.SMILE_SCORE,
      page: () => SmileScoreView(),
      binding: SmileScoreBinding(),
    ),
    GetPage(
      name: _Paths.DREAM_LIST,
      page: () => DreamListView(),
      binding: DreamListBinding(),
    ),
    GetPage(
      name: _Paths.DREAM_CREATE,
      page: () => DreamCreateView(),
      binding: DreamCreateBinding(),
    ),
    GetPage(
      name: _Paths.DREAM_DETAIL,
      page: () => DreamDetailView(),
      binding: DreamDetailBinding(),
    ),
    GetPage(
      name: _Paths.STRENGTH_LIST,
      page: () => StrengthListView(),
      binding: StrengthListBinding(),
    ),
    GetPage(
      name: _Paths.STRENGTH_CREATE,
      page: () => StrengthCreateView(),
      binding: StrengthCreateBinding(),
    ),
    GetPage(
      name: _Paths.LOAD_CONTENT,
      page: () => LoadContentView(),
      binding: LoadContentBinding(),
    ),
    GetPage(
      name: _Paths.INVENTORY,
      page: () => const InventoryView(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: _Paths.GAME_INTRO,
      page: () => const GameIntroView(),
      binding: GameIntroBinding(),
    ),
    GetPage(
      name: _Paths.UI_INTRO,
      page: () => const UiIntroView(),
      binding: UiIntroBinding(),
    ),
    GetPage(
      name: _Paths.BREATH_REGISTER_FLOW,
      page: () => const BreathRegisterFlowView(),
      binding: BreathRegisterFlowBinding(),
    ),
    GetPage(
      name: _Paths.DREAM_INTRO,
      page: () => const DreamIntroView(),
      binding: DreamIntroBinding(),
    ),
    GetPage(
      name: _Paths.SMILE_INTRO,
      page: () => const SmileIntroView(),
      binding: SmileIntroBinding(),
    ),
    GetPage(
      name: _Paths.EMOTION_INTRO,
      page: () => const EmotionIntroView(),
      binding: EmotionIntroBinding(),
    ),
    GetPage(
      name: _Paths.WHEEL_INTRO,
      page: () => const WheelIntroView(),
      binding: WheelIntroBinding(),
    ),
    GetPage(
      name: _Paths.ROAD_MAP,
      page: () => const RoadMapView(),
      binding: RoadMapBinding(),
    ),
    GetPage(
      name: _Paths.STRENGTH_INTRO,
      page: () => const StrengthIntroView(),
      binding: StrengthIntroBinding(),
    ),
  ];
}
