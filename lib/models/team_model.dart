class TeamItem {
  int? count;
  List<Data>? data;

  TeamItem({this.count, this.data});

  TeamItem.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? position;
  String? image;
  String? committee;
  String? faculty;
  String? department;
  String? academicYear;
  String? governorate;
  String? bio;
  String? linkedIn;
  String? gmail;
  String? filter;


  Data(
      this.id,
      this.name,
      this.position,
      this.image,
      this.committee,
      this.faculty,
      this.department,
      this.academicYear,
      this.governorate,
      this.bio,
      this.linkedIn,
      this.gmail,
      this.filter
      );

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    image = json['image'];
    committee = json['committee'];
    faculty = json['faculty'];
    department = json['department'];
    academicYear = json['academic_year'];
    governorate = json['governorate'];
    bio = json['bio'];
    linkedIn = json['linkedIn'];
    gmail = json['gmail'];
    filter = json['filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['position'] = position;
    data['image'] = image;
    data['committee'] = committee;
    data['faculty'] = faculty;
    data['department'] = department;
    data['academic_year'] = academicYear;
    data['governorate'] = governorate;
    data['bio'] = bio;
    data['linkedIn'] = linkedIn;
    data['gmail'] = gmail;
    data['filter'] = filter;
    return data;
  }
}