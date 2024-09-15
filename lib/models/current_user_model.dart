class CurrentUser {
  String? dateTime;
  String? uid;
  String? phone;
  String? name;
  String? email;

  CurrentUser({this.dateTime, this.uid, this.phone, this.name, this.email});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    dateTime = json['dateTime'];
    uid = json['uid'];
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dateTime'] = dateTime;
    data['uid'] = uid;
    data['phone'] = phone;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}