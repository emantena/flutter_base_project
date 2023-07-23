class User {
  String? name;
  String? email;
  String? photo;
  String? createAt;

  User({this.name, this.email, this.photo, this.createAt});

  User.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["photo"] is String) {
      photo = json["photo"];
    }
    if (json["createAt"] is String) {
      createAt = json["createAt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["photo"] = photo;
    data["createAt"] = createAt;
    return data;
  }
}
