
class SignInDto {
  String? email;
  String? password;
  bool? returnSecureToken;

  SignInDto({this.email, this.password, this.returnSecureToken});

  SignInDto.fromJson(Map<String, dynamic> json) {
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
    if(json["returnSecureToken"] is bool) {
      returnSecureToken = json["returnSecureToken"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["returnSecureToken"] = returnSecureToken;
    return data;
  }
}