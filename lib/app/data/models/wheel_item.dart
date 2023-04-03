// To parse this JSON data, do
//
//     final wheelItem = wheelItemFromJson(jsonString);

import 'dart:convert';

WheelItem wheelItemFromJson(String str) => WheelItem.fromJson(json.decode(str));

String wheelItemToJson(WheelItem data) => json.encode(data.toJson());

class WheelItem {
    WheelItem({
        this.id,
        this.wheelofliferecordId,
        this.user,
        required this.createdAt,
        this.updatedAt,
        required this.spirituality,
        required this.health,
        required this.money,
        required this.career,
        required this.socail,
        required this.love,
        required this.personal,
        required this.fun,
    });

    Id? id;
    String? wheelofliferecordId;
    Id? user;
    AtedAt createdAt;
    AtedAt? updatedAt;
    int spirituality;
    int health;
    int money;
    int career;
    int socail;
    int love;
    int personal;
    int fun;

    factory WheelItem.fromJson(Map<String, dynamic> json) => WheelItem(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        wheelofliferecordId: json["wheelofliferecord_id"],
        user: json["user"] == null ? null : Id.fromJson(json["user"]),
        createdAt: AtedAt.fromJson(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : AtedAt.fromJson(json["updatedAt"]),
        spirituality: json["spirituality"],
        health: json["health"] ,
        money: json["money"],
        career: json["career"],
        socail: json["socail"] ,
        love: json["love"],
        personal: json["personal"],
        fun: json["fun"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id!.toJson(),
        "wheelofliferecord_id": wheelofliferecordId,
        "user": user == null ? null : user!.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toJson(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toJson(),
        "spirituality": spirituality == null ? null : spirituality,
        "health": health == null ? null : health,
        "money": money == null ? null : money,
        "career": career == null ? null : career,
        "socail": socail == null ? null : socail,
        "love": love == null ? null : love,
        "personal": personal == null ? null : personal,
        "fun": fun == null ? null : fun,
    };
}

class AtedAt {
    AtedAt({
        required this.date,
    });

    int date;

    factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
        date: json["\u0024date"] == null ? null : json["\u0024date"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024date": date == null ? null : date,
    };
}

class Id {
    Id({
        this.oid,
    });

    String? oid;

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"] == null ? null : json["\u0024oid"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024oid": oid == null ? null : oid,
    };
}
