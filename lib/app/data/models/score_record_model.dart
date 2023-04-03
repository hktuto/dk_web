// To parse this JSON data, do
//
//     final scoreRecord = scoreRecordFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

ScoreRecord scoreRecordFromJson(String str) => ScoreRecord.fromJson(json.decode(str));

String scoreRecordToJson(ScoreRecord data) => json.encode(data.toJson());

class ScoreRecord {
    ScoreRecord({
        this.id,
        this.scorerecordId,
        this.user,
        this.score,
        this.section,
        this.remark,
    });

    Id? id;
    String? scorerecordId;
    Id? user;
    int? score;
    String? section;
    String? remark;

    factory ScoreRecord.fromJson(Map<String, dynamic> json) => ScoreRecord(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        scorerecordId: json["scorerecord_id"] == null ? null : json["scorerecord_id"],
        user: json["user"] == null ? null : Id.fromJson(json["user"]),
        score: json["score"] == null ? null : json["score"],
        section: json["section"] == null ? null : json["section"],
        remark: json["remark"] == null ? null : json["remark"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id?.toJson(),
        "scorerecord_id": scorerecordId == null ? null : scorerecordId,
        "user": user == null ? null : user?.toJson(),
        "score": score == null ? null : score,
        "section": section == null ? null : section,
        "remark": remark == null ? null : remark,
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
