import 'dart:developer';
import 'dart:math';

import 'package:dk_app_flutter/app/controllers/breathing_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/wheel_item.dart';
import 'package:dk_app_flutter/app/data/providers/wheel_record_provider.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../views/blob/src/model.dart';

class WheelOfLifeController extends GetxController {
  WheelRecordProvider provider = Get.put(WheelRecordProvider());
  UserController userController = Get.find<UserController>();
  RouterController router = Get.find<RouterController>();
  RegisterFLowController flow = Get.find<RegisterFLowController>();
  BreathingRecordController record = Get.find<BreathingRecordController>();
  BlobController blobCtrl = BlobController();
  RxList<double> currentSocre = [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5].obs;
  ScoreController scoreController = Get.find<ScoreController>();
  List<Map> scoreMap = [
    {
      "key": 'health',
      "index": 0,
      'x': 193.0,
      'y': 64.0,
      'color': '#8EB4A3',
    },
    {
      "key": 'money',
      "index": 1,
      'x': 246.0,
      'y': 122.0,
      'color': '#9ECC87',
    },
    {
      "key": 'career',
      "index": 2,
      'x': 246.0,
      'y': 202.0,
      'color': '#9ED1B7',
    },
    {
      "key": 'social',
      "index": 3,
      'x': 193.0,
      'y': 256.0,
      'color': '#85CACA',
    },
    {
      "key": 'love',
      "index": 4,
      'x': 113.0,
      'y': 256.0,
      'color': '#86B9CE',
    },
    {
      "key": 'personal',
      "index": 5,
      'x': 59.0,
      'y': 202.0,
      'color': '#AD9CCF',
    },
    {
      "key": 'fun',
      "index": 6,
      'x': 59.0,
      'y': 122.0,
      'color': '#E1968C',
    },
    {
      "key": 'spirituality',
      "index": 7,
      'x': 113.0,
      'y': 64.0,
      'color': '#E3B88B',
    },
  ];
  // input controller
  final _healthText = TextEditingController();
  final _moneyText = TextEditingController();
  final _careerText = TextEditingController();
  final _socialText = TextEditingController();
  final _loveText = TextEditingController();
  final _personalText = TextEditingController();
  final _funText = TextEditingController();
  final _spiritualityText = TextEditingController();
  final scrollController = ScrollController();
  Rx<DateTime> endDate = DateTime.now().obs;
  Rx<DateTime> startDate = DateTime.now().subtract(Duration(days: 30)).obs;
  RxList<WheelItem> records = List<WheelItem>.empty().obs;

  Rx<WheelItem> selectedItem = WheelItem(
          health: 5,
          spirituality: 5,
          money: 5,
          career: 5,
          socail: 5,
          love: 5,
          personal: 5,
          fun: 5,
          createdAt: AtedAt(date: DateTime.now().millisecondsSinceEpoch))
      .obs;

  @override
  void onInit() {
    super.onInit();
    getRecordList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _healthText.dispose();
    _moneyText.dispose();
    _careerText.dispose();
    _socialText.dispose();
    _loveText.dispose();
    _personalText.dispose();
    _funText.dispose();
    _spiritualityText.dispose();
  }

  void createRecord() {
    List<String> labelIndex = [];
    WheelItem last = records.last;
    _healthText.text = last.health.toString();
    _moneyText.text = (last.money).toStringAsFixed(0);
    _careerText.text = (last.career).toStringAsFixed(0);
    _socialText.text = (last.socail).toStringAsFixed(0);
    _loveText.text = (last.love).toStringAsFixed(0);
    _personalText.text = (last.personal).toStringAsFixed(0);
    _funText.text = (last.fun).toStringAsFixed(0);
    _spiritualityText.text = (last.spirituality).toStringAsFixed(0);
    Get.dialog(
        AlertDialog(
          title: Text('Edit'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _healthText,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter()
                  ],
                  decoration:
                      InputDecoration(hintText: "", label: Text('Health')),
                ),
                TextField(
                  controller: _moneyText,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter()
                  ],
                  decoration:
                      InputDecoration(hintText: "", label: Text('Money')),
                ),
                TextField(
                  controller: _careerText,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter()
                  ],
                  decoration:
                      InputDecoration(hintText: "", label: Text('Career')),
                ),
                TextField(
                  controller: _socialText,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter()
                  ],
                  decoration:
                      InputDecoration(hintText: "", label: Text('Social')),
                ),
                TextField(
                  controller: _loveText,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter()
                  ],
                  decoration:
                      InputDecoration(hintText: "", label: Text('Love')),
                ),
                TextField(
                  controller: _funText,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter()
                  ],
                  decoration: InputDecoration(hintText: "", label: Text('Fun')),
                ),
                TextField(
                  controller: _spiritualityText,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter()
                  ],
                  decoration: InputDecoration(
                      hintText: "", label: Text('Spirituality')),
                ),
                TextField(
                  controller: _personalText,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter()
                  ],
                  decoration:
                      InputDecoration(hintText: "", label: Text('Personal')),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                  RouterController router = Get.find<RouterController>();
                  var current = Get.routing.current;
                  router.shouldIgnorePointer(current);
                },
                child: Text(LocaleKeys.general_close.tr)),
            TextButton(
              child: Text(LocaleKeys.general_create.tr),
              onPressed: () async {
                await saveRecord(
                    int.parse(_healthText.text),
                    int.parse(_moneyText.text),
                    int.parse(_careerText.text),
                    int.parse(_socialText.text),
                    int.parse(_loveText.text),
                    int.parse(_personalText.text),
                    int.parse(_funText.text),
                    int.parse(_spiritualityText.text));
                blobCtrl.change();
                update();
                Get.back();
                RouterController router = Get.find<RouterController>();
                var current = Get.routing.current;
                router.shouldIgnorePointer(current);
                _healthText.text = "";
                _moneyText.text = "";
                _careerText.text = "";
                _socialText.text = "";
                _loveText.text = "";
                _personalText.text = "";
                _funText.text = "";
                _spiritualityText.text = "";
              },
            ),
          ],
        ),
        barrierDismissible: false);
  }

  void openDialog() {
    // if (selectedItem.value.id != null) return;
    List<String> labelIndex = [];
    _healthText.text = (currentSocre.value[0] * 10).toStringAsFixed(0);
    _moneyText.text = (currentSocre.value[1] * 10).toStringAsFixed(0);
    _careerText.text = (currentSocre.value[2] * 10).toStringAsFixed(0);
    _socialText.text = (currentSocre.value[3] * 10).toStringAsFixed(0);
    _loveText.text = (currentSocre.value[4] * 10).toStringAsFixed(0);
    _personalText.text = (currentSocre.value[5] * 10).toStringAsFixed(0);
    _funText.text = (currentSocre.value[6] * 10).toStringAsFixed(0);
    _spiritualityText.text = (currentSocre.value[7] * 10).toStringAsFixed(0);
    Get.dialog(
      AlertDialog(
        title: Text('Edit'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _healthText,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter()
                ],
                decoration:
                    InputDecoration(hintText: "", label: Text('Health')),
              ),
              TextField(
                controller: _moneyText,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter()
                ],
                decoration: InputDecoration(hintText: "", label: Text('Money')),
              ),
              TextField(
                controller: _careerText,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter()
                ],
                decoration:
                    InputDecoration(hintText: "", label: Text('Career')),
              ),
              TextField(
                controller: _socialText,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter()
                ],
                decoration:
                    InputDecoration(hintText: "", label: Text('Social')),
              ),
              TextField(
                controller: _loveText,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter()
                ],
                decoration: InputDecoration(hintText: "", label: Text('Love')),
              ),
              TextField(
                controller: _funText,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter()
                ],
                decoration: InputDecoration(hintText: "", label: Text('Fun')),
              ),
              TextField(
                controller: _spiritualityText,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter()
                ],
                decoration:
                    InputDecoration(hintText: "", label: Text('Spirituality')),
              ),
              TextField(
                controller: _personalText,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter()
                ],
                decoration:
                    InputDecoration(hintText: "", label: Text('Personal')),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
                RouterController router = Get.find<RouterController>();
                var current = Get.routing.current;
                router.shouldIgnorePointer(current);
              },
              child: Text(LocaleKeys.general_close.tr)),
          TextButton(
            child: Text(LocaleKeys.setting_save.tr),
            onPressed: () async {
              currentSocre.value[0] = double.parse(_healthText.text) / 10;
              currentSocre.value[1] = double.parse(_moneyText.text) / 10;
              currentSocre.value[2] = double.parse(_careerText.text) / 10;
              currentSocre.value[3] = double.parse(_socialText.text) / 10;
              currentSocre.value[4] = double.parse(_loveText.text) / 10;
              currentSocre.value[5] = double.parse(_personalText.text) / 10;
              currentSocre.value[6] = double.parse(_funText.text) / 10;
              currentSocre.value[7] = double.parse(_spiritualityText.text) / 10;

              _healthText.text = "";
              _moneyText.text = "";
              _careerText.text = "";
              _socialText.text = "";
              _loveText.text = "";
              _personalText.text = "";
              _funText.text = "";
              _spiritualityText.text = "";
              await updateRecord();
              blobCtrl.change();
              update();
              Get.back();
              RouterController router = Get.find<RouterController>();
              var current = Get.routing.current;
              router.shouldIgnorePointer(current);
            },
          ),
        ],
      ),
    );
  }

  void back() {
    router.changePage(Routes.MAIN);
  }

  void wheelToScore() {}

  void selectedChange(WheelItem item) {
    selectedItem.value = item;
    currentSocre.value = [
      (item.health / 10).toDouble(),
      (item.money / 10).toDouble(),
      (item.career / 10).toDouble(),
      (item.socail / 10).toDouble(),
      (item.love / 10).toDouble(),
      (item.personal / 10).toDouble(),
      (item.fun / 10).toDouble(),
      (item.spirituality / 10).toDouble()
    ];

    blobCtrl.change();
    update();
  }

  String displayDate(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();
    return DateFormat('MM-dd').format(date);
  }

  Future<void> saveRecord(int health, int money, int career, int socail,
      int love, int personal, int fun, int spirituality) async {
    EasyLoading.show();
    // create record
    await provider.createWheel({
      "user": userController.user.value.userId,
      "health": health,
      "money": money,
      "career": career,
      "socail": socail,
      "love": love,
      "personal": personal,
      "fun": fun,
      "spirituality": spirituality
    });
    await getRecordList();
    int bouns = record.calJouneryBonus();
    int score = int.parse((health +
            money +
            career +
            socail +
            love +
            personal +
            fun +
            spirituality)
        .toStringAsFixed(0));
    print(score);
    Map scoreParams = {
      'user': userController.user.value.userId,
      'score': score + bouns,
      "section": "wheelOfLife",
    };
    await scoreController.saveUserScore(scoreParams);
    await scoreController.getUserTotalScore();
    flow.running.isTrue
        ? flow.nextStep()
        : router.offPageWithProps(Routes.WHEEL_SCORE,
            {'score': score.toString(), 'bouns': bouns.toString()});
    EasyLoading.dismiss();
  }

  Future<void> updateRecord() async {
    EasyLoading.show();
    // step 1
    selectedItem.value.health = (currentSocre[0] * 10).round();
    selectedItem.value.money = (currentSocre[1] * 10).round();
    selectedItem.value.career = (currentSocre[2] * 10).round();
    selectedItem.value.socail = (currentSocre[3] * 10).round();
    selectedItem.value.love = (currentSocre[4] * 10).round();
    selectedItem.value.personal = (currentSocre[5] * 10).round();
    selectedItem.value.fun = (currentSocre[6] * 10).round();
    selectedItem.value.spirituality = (currentSocre[7] * 10).round();
    if (selectedItem.value.wheelofliferecordId == null) {
      await provider.createWheel({
        "user": userController.user.value.userId,
        "wheelofliferecord_id": selectedItem.value.id?.oid,
        "health": selectedItem.value.health,
        "money": selectedItem.value.money,
        "career": selectedItem.value.career,
        "socail": selectedItem.value.socail,
        "love": selectedItem.value.love,
        "personal": selectedItem.value.personal,
        "fun": selectedItem.value.fun,
        "spirituality": selectedItem.value.spirituality
      });
    } else {
      await provider.editWheel({
        "id": selectedItem.value.wheelofliferecordId,
        "health": selectedItem.value.health,
        "money": selectedItem.value.money,
        "career": selectedItem.value.career,
        "socail": selectedItem.value.socail,
        "love": selectedItem.value.love,
        "personal": selectedItem.value.personal,
        "fun": selectedItem.value.fun,
        "spirituality": selectedItem.value.spirituality
      });
    }
    await getRecordList();
    EasyLoading.dismiss();
  }

  Future<void> getRecordList() async {
    Map data = {
      'user_id': userController.user.value.userId,
      "before": DateFormat('yyyy-MM-dd').format(endDate.value),
      "after": DateFormat('yyyy-MM-dd').format(startDate.value),
    };
    bool isNew = false;
    try {
      records.value = await provider.getWheel(data);

      if (records.value.isEmpty) {
        isNew = true;
        // no record inseert default record
        records.add(WheelItem(
            health: 5,
            spirituality: 5,
            money: 5,
            career: 5,
            socail: 5,
            love: 5,
            personal: 5,
            fun: 5,
            createdAt: AtedAt(date: endDate.value.millisecondsSinceEpoch)));
      } else {
        WheelItem lastItem = records.last;

        DateTime recordDate =
            DateTime.fromMillisecondsSinceEpoch(lastItem.createdAt.date)
                .toLocal();
        recordDate =
            DateTime(recordDate.year, recordDate.month, recordDate.day);
        DateTime now = DateTime.now();
        now = DateTime(now.year, now.month, now.day);
        int dayDiff = now.compareTo(recordDate);
        if (dayDiff > 0) {
          records.add(WheelItem(
              health: lastItem.health,
              spirituality: lastItem.spirituality,
              money: lastItem.money,
              career: lastItem.career,
              socail: lastItem.socail,
              love: lastItem.love,
              personal: lastItem.personal,
              fun: lastItem.fun,
              createdAt: AtedAt(date: endDate.value.millisecondsSinceEpoch)));
        }
        print(selectedItem.value.wheelofliferecordId);
        if (selectedItem.value.wheelofliferecordId == null) {
          selectedItem.value = records.value.last;
        }
      }

      update();
      if (selectedItem.value.wheelofliferecordId != null) {
        selectedChange(records.value.last);
        print(records.value.last);
        scrollToEnd();
        update();
      }
      if (isNew) {
        openDialog();
        update();
      }
    } catch ($e) {
      print($e);
    }
  }

  void scrollToEnd() async {
    await Future.delayed(const Duration(microseconds: 1000));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }
}

class CustomRangeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '')
      return TextEditingValue();
    else if (int.parse(newValue.text) < 1)
      return TextEditingValue().copyWith(text: '1');

    return int.parse(newValue.text) > 10
        ? TextEditingValue().copyWith(text: '10')
        : newValue;
  }
}
