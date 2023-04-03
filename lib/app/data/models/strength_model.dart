// To parse this JSON data, do
//
//     final strengthItem = strengthItemFromJson(jsonString);

import 'dart:convert';

StrengthItem strengthItemFromJson(String str) =>
    StrengthItem.fromJson(json.decode(str));

String strengthItemToJson(StrengthItem data) => json.encode(data.toJson());

class StrengthItem {
  StrengthItem({
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.labels,
    required this.strengthlabelrecordId,
  });

  Id user;
  AtedAt createdAt;
  AtedAt updatedAt;
  List<dynamic> labels;
  String strengthlabelrecordId;

  factory StrengthItem.fromJson(Map<String, dynamic> json) => StrengthItem(
        user: Id.fromJson(json["user"]),
        createdAt: AtedAt.fromJson(json["createdAt"]),
        updatedAt: AtedAt.fromJson(json["updatedAt"]),
        labels: List<dynamic>.from(json["labels"].map((x) => x)),
        strengthlabelrecordId: json["strengthlabelrecord_id"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "createdAt": createdAt.toJson(),
        "updatedAt": updatedAt.toJson(),
        "labels": List<dynamic>.from(labels.map((x) => x)),
        "strengthlabelrecord_id": strengthlabelrecordId,
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
