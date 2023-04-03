class Login {
  Id? iId;
  String? userId;
  String? username;
  String? email;
  String? mobile;
  String? provider;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;
  CreatedAt? birthday;
  String? mobileCountryCode;
  String? notificationToken;

  Login({
    this.iId,
    this.userId,
    this.username,
    this.email,
    this.mobile,
    this.mobileCountryCode,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.birthday,
    this.notificationToken,
  });

  Login.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    mobileCountryCode = json['mobileCountryCode'] ?? null;
    provider = json['provider'];
    createdAt = json['createdAt'] != null
        ? new CreatedAt.fromJson(json['createdAt'])
        : null;
    updatedAt = json['updatedAt'] != null
        ? new CreatedAt.fromJson(json['updatedAt'])
        : null;
    birthday = json['birthday'] != null
        ? new CreatedAt.fromJson(json['birthday'])
        : null;
    notificationToken = json['notificationToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['provider'] = this.provider;
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt!.toJson();
    }
    if (this.updatedAt != null) {
      data['updatedAt'] = this.updatedAt!.toJson();
    }
    if (this.birthday != null) {
      data['birthday'] = this.birthday!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}
