// To parse this JSON data, do
//
//     final breathRecord = breathRecordFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

BreathRecord breathRecordFromJson(String str) => BreathRecord.fromJson(json.decode(str));

String breathRecordToJson(BreathRecord data) => json.encode(data.toJson());

class BreathRecord {
    BreathRecord({
        this.id,
        this.user,
        this.product,
        this.duration,
        this.score,
        this.createdAt,
        this.updatedAt,
        this.finishFeeling,
    });

    Id? id;
    Id? user;
    String? product;
    int? duration;
    int? score;
    AtedAt? createdAt;
    AtedAt? updatedAt;
    String? finishFeeling;

    factory BreathRecord.fromJson(Map<String, dynamic> json) => BreathRecord(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        user: json["user"] == null ? null : Id.fromJson(json["user"]),
        product: json["product"] == null ? null : json["product"],
        duration: json["duration"] == null ? null : json["duration"],
        score: json["score"] == null ? null : json["score"],
        createdAt: json["createdAt"] == null ? null : AtedAt.fromJson(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : AtedAt.fromJson(json["updatedAt"]),
        finishFeeling: json["finishFeeling"] == null ? null : json["finishFeeling"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id?.toJson(),
        "user": user == null ? null : user?.toJson(),
        "product": product == null ? null : product,
        "duration": duration == null ? null : duration,
        "score": score == null ? null : score,
        "createdAt": createdAt == null ? null : createdAt?.toJson(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toJson(),
        "finishFeeling": finishFeeling == null ? null : finishFeeling,
    };
}

class AtedAt {
    AtedAt({
        this.date,
    });

    int? date;

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
