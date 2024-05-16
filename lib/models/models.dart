class UserModel {
  String? name;
  String? phone;
  String? email;
  String? uid;

  UserModel(
      {required this.phone,
      required this.email,
      required this.name,
      required this.uid});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    uid = json['uid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateTime': DateTime.now().toString(),
      'phone': phone,
      'email': email,
      'uid': uid,
    };
  }
}
