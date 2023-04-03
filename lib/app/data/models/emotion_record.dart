// To parse this JSON data, do
//
//     final emotionRecords = emotionRecordsFromJson(jsonString);

import 'dart:convert';

EmotionRecords emotionRecordsFromJson(String str) =>
    EmotionRecords.fromJson(json.decode(str));

String emotionRecordsToJson(EmotionRecords data) => json.encode(data.toJson());

class EmotionRecords {
  EmotionRecords({
    required this.id,
    required this.emotionrecordId,
    required this.user,
    required this.emotion,
    required this.createdAt,
    required this.updatedAt,
  });

  Id id;
  String emotionrecordId;
  Id user;
  String emotion;
  AtedAt createdAt;
  AtedAt updatedAt;

  factory EmotionRecords.fromJson(Map<String, dynamic> json) => EmotionRecords(
        id: Id.fromJson(json["_id"]),
        emotionrecordId: json["emotionrecord_id"],
        user: Id.fromJson(json["user"]),
        emotion: json["emotion"],
        createdAt: AtedAt.fromJson(json["createdAt"]),
        updatedAt: AtedAt.fromJson(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "emotionrecord_id": emotionrecordId,
        "user": user.toJson(),
        "emotion": emotion,
        "createdAt": createdAt.toJson(),
        "updatedAt": updatedAt.toJson(),
      };
}

class AtedAt {
  AtedAt({
    required this.date,
  });

  int date;

  factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
        date: json["\u0024date"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024date": date,
      };
}

class Id {
  Id({
    required this.oid,
  });

  String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}
