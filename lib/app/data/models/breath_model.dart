class Breath {
  Id? iId;
  String? breathSettingId;
  String? name;
  int? duration;
  String? product;
  int? inhaleDuration;
  int? exhaleDuration;
  int? score;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;

  Breath(
      {this.iId,
      this.breathSettingId,
      this.name,
      this.duration,
      this.product,
      this.inhaleDuration,
      this.exhaleDuration,
      this.score,
      this.createdAt,
      this.updatedAt});

  Breath.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id?.fromJson(json['_id']) : null;
    breathSettingId = json['breath_setting_id'];
    name = json['name'];
    duration = json['duration'];
    product = json['product'];
    inhaleDuration = json['inhaleDuration'];
    exhaleDuration = json['exhaleDuration'];
    score = json['score'];
    createdAt = json['createdAt'] != null
        ? CreatedAt?.fromJson(json['createdAt'])
        : null;
    updatedAt = json['updatedAt'] != null
        ? CreatedAt?.fromJson(json['updatedAt'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (iId != null) {
      data['_id'] = iId?.toJson();
    }
    data['breath_setting_id'] = breathSettingId;
    data['name'] = name;
    data['duration'] = duration;
    data['product'] = product;
    data['inhaleDuration'] = inhaleDuration;
    data['exhaleDuration'] = exhaleDuration;
    data['score'] = score;
    if (createdAt != null) {
      data['createdAt'] = createdAt?.toJson();
    }
    if (updatedAt != null) {
      data['updatedAt'] = updatedAt?.toJson();
    }
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['$oid'] = oid;
    return data;
  }
}

class CreatedAt {
  int? date;

  CreatedAt({this.date});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['$date'] = date;
    return data;
  }
}
