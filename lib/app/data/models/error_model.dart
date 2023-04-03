class Error {
  bool? error;
  String? errorMessage;

  Error({this.error, this.errorMessage});

  Error.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorMessage = json['error-message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['error'] = error;
    data['error-message'] = errorMessage;
    return data;
  }
}
