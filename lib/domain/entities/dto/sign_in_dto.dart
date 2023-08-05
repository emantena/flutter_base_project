
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["password"] = password;
    _data["returnSecureToken"] = returnSecureToken;
    return _data;
  }
}