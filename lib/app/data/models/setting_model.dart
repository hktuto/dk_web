// To parse this JSON data, do
//
//     final userSetting = userSettingFromJson(jsonString);

import 'dart:convert';

class UserSetting {
    UserSetting({
        required this.id,
        required this.customizationId,
        required this.user,
        required this.valueName,
        required this.strValue,
        this.intValue,
        required this.createdAt,
        required this.updatedAt,
    });

    Id id;
    String customizationId;
    Id user;
    String valueName;
    String strValue;
    int? intValue;
    AtedAt createdAt;
    AtedAt updatedAt;

    factory UserSetting.fromRawJson(String str) => UserSetting.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserSetting.fromJson(Map<String, dynamic> json) => UserSetting(
        id: Id.fromJson(json["_id"]),
        customizationId: json["customization_id"],
        user: Id.fromJson(json["user"]),
        valueName: json["value_name"],
        strValue: json["str_value"],
        intValue: json["int_value"],
        createdAt: AtedAt.fromJson(json["createdAt"]),
        updatedAt: AtedAt.fromJson(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "customization_id": customizationId,
        "user": user.toJson(),
        "value_name": valueName,
        "str_value": strValue,
        "int_value": intValue,
        "createdAt": createdAt.toJson(),
        "updatedAt": updatedAt.toJson(),
    };
}

class AtedAt {
    AtedAt({
        required this.date,
    });

    int date;

    factory AtedAt.fromRawJson(String str) => AtedAt.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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

    factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
    };
}
