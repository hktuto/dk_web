// To parse this JSON data, do
//
//     final dreamItem = dreamItemFromJson(jsonString);

import 'dart:convert';

DreamItem dreamItemFromJson(String str) => DreamItem.fromJson(json.decode(str));

String dreamItemToJson(DreamItem data) => json.encode(data.toJson());

class DreamItem {
  DreamItem({
    this.id,
    this.user,
    this.field,
    this.createdAt,
    this.updatedAt,
    this.target,
    this.process,
    this.dream,
    this.specific,
    this.measurable,
    this.achievable,
    this.relevant,
    this.timeBound,
    this.dreammachineId,
  });

  Id? id;
  Id? user;
  String? field;
  AtedAt? createdAt;
  AtedAt? updatedAt;
  String? target;
  int? process;
  String? dream;
  String? specific;
  String? measurable;
  String? achievable;
  String? relevant;
  String? timeBound;
  String? dreammachineId;

  factory DreamItem.fromJson(Map<String, dynamic> json) => DreamItem(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        user: json["user"] == null ? null : Id.fromJson(json["user"]),
        createdAt: json["createdAt"] == null
            ? null
            : AtedAt.fromJson(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : AtedAt.fromJson(json["updatedAt"]),
        target: json["target"] == null ? null : json["target"],
        field: json["field"] == null ? null : json["field"],
        process: json["process"] == null ? null : json["process"],
        dream: json["dream"] == null ? null : json["dream"],
        specific: json["specific"] == null ? null : json["specific"],
        measurable: json["measurable"] == null ? null : json["measurable"],
        achievable: json["achievable"] == null ? null : json["achievable"],
        relevant: json["relevant"] == null ? null : json["relevant"],
        timeBound: json["timeBound"] == null ? null : json["timeBound"],
        dreammachineId:
            json["dreammachine_id"] == null ? null : json["dreammachine_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id?.toJson(),
        "user": user == null ? null : user?.toJson(),
        "createdAt": createdAt == null ? null : createdAt?.toJson(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toJson(),
        "target": target == null ? null : target,
        "process": process == null ? null : process,
        "dream": dream == null ? null : dream,
        "specific": specific == null ? null : specific,
        "measurable": measurable == null ? null : measurable,
        "achievable": achievable == null ? null : achievable,
        "relevant": relevant == null ? null : relevant,
        "timeBound": timeBound == null ? null : timeBound,
        "dreammachine_id": dreammachineId == null ? null : dreammachineId,
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
