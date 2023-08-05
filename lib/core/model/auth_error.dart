
class AuthError {
  Error? error;

  AuthError({this.error});

  AuthError.fromJson(Map<String, dynamic> json) {
    if(json["error"] is Map) {
      error = json["error"] == null ? null : Error.fromJson(json["error"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(error != null) {
      data["error"] = error?.toJson();
    }
    return data;
  }
}

class Error {
  int? code;
  String? message;
  List<Errors>? errors;

  Error({this.code, this.message, this.errors});

  Error.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["errors"] is List) {
      errors = json["errors"] == null ? null : (json["errors"] as List).map((e) => Errors.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    if(errors != null) {
      data["errors"] = errors?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String? message;
  String? domain;
  String? reason;

  Errors({this.message, this.domain, this.reason});

  Errors.fromJson(Map<String, dynamic> json) {
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["domain"] is String) {
      domain = json["domain"];
    }
    if(json["reason"] is String) {
      reason = json["reason"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    data["domain"] = domain;
    data["reason"] = reason;
    return data;
  }
}