class UserModel {
  String? fullname;
  String? email;
  String? password;

  UserModel({this.fullname, this.email, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
