class SignUpResponseDto {
  String? kind;
  String? idToken;
  String? email;
  String? refreshToken;
  String? expiresIn;
  String? localId;

  SignUpResponseDto(
      {this.kind,
      this.idToken,
      this.email,
      this.refreshToken,
      this.expiresIn,
      this.localId});

  SignUpResponseDto.fromJson(Map<String, dynamic> json) {
    if (json["kind"] is String) {
      kind = json["kind"];
    }
    if (json["idToken"] is String) {
      idToken = json["idToken"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["refreshToken"] is String) {
      refreshToken = json["refreshToken"];
    }
    if (json["expiresIn"] is String) {
      expiresIn = json["expiresIn"];
    }
    if (json["localId"] is String) {
      localId = json["localId"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["kind"] = kind;
    data["idToken"] = idToken;
    data["email"] = email;
    data["refreshToken"] = refreshToken;
    data["expiresIn"] = expiresIn;
    data["localId"] = localId;
    return data;
  }
}
