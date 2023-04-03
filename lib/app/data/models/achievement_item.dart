// To parse this JSON data, do
//
//     final achievementItem = achievementItemFromJson(jsonString);

import 'dart:convert';

class AchievementItem {
    AchievementItem({
        this.id,
        this.name = '',
        this.field ='',
        this.value= 1,
    });

    Id ?id;
    String name;
    String field;
    int value;

    factory AchievementItem.fromRawJson(String str) => AchievementItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AchievementItem.fromJson(Map<String, dynamic> json) => AchievementItem(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        name: json["name"] == null ? null : json["name"],
        field: json["field"] == null ? null : json["field"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id?.toJson(),
        "name": name == null ? null : name,
        "field": field == null ? null : field,
        "value": value == null ? null : value,
    };
}

class Id {
    Id({
        this.oid,
    });

    String? oid;

    factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "\u0024oid": oid == null ? null : oid,
    };
}
