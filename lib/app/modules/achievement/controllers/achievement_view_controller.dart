import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/data/models/achievement_item.dart';
import 'package:get/get.dart';

class AchievementViewController extends GetxController {
  AchievementController achievement = Get.find<AchievementController>();

  List<AchievementItem> getLoginAchievement() {
    List<AchievementItem> list = achievement.options
        .where((ach) => achievement.loginAchievementType.contains(ach.field))
        .toList();
    list.sort((a, b) => a.value.compareTo(b.value));
    return list;
  }

  List<AchievementItem> getBreathingAchievement() {
    List<AchievementItem> list = achievement.options
        .where(
            (ach) => achievement.breathingAchievementType.contains(ach.field))
        .toList();
    list.sort((a, b) => a.value.compareTo(b.value));
    return list;
  }

  List<AchievementItem> getWheelAchievement() {
    List<AchievementItem> list = achievement.options
        .where((ach) => achievement.wheelAchievementType.contains(ach.field))
        .toList();
    list.sort((a, b) => a.value.compareTo(b.value));
    return list;
  }

  List<AchievementItem> getDreamAchievement() {
   List<AchievementItem> list =  achievement.options
        .where((ach) => achievement.dreamAchievementType.contains(ach.field))
        .toList();
      list.sort((a, b) => a.value.compareTo(b.value));
    return list;
  }

  List<AchievementItem> getStrengthAchievement() {
    List<AchievementItem> list =  achievement.options
      .where((ach) => achievement.strenghtAchievementType.contains(ach.field))
      .toList();
    list.sort((a, b) => a.value.compareTo(b.value));
    return list;
  } 

  List<AchievementItem> getEmotionAchievement() {

      List<AchievementItem> list =  achievement.options
          .where((ach) => achievement.emotionAchievementType.contains(ach.field))
          .toList();
          list.sort((a, b) => a.value.compareTo(b.value));
        return list;
    }
} 
