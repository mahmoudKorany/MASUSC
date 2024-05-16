class EventItem {
  int? count;
  List<Data>? data;

  EventItem({this.count, this.data});

  EventItem.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? image;
  String? brief;
  String? date;
  String? endDate;
  String? section;
  String? facebook;
  String? registration;
  String? location;
  String? status;
  String? phone;
  String? email;
  List<String>? topics;
  String? category;
  String? catId;
  String? type;

  Data(
      {this.id,
        this.title,
        this.image,
        this.brief,
        this.date,
        this.endDate,
        this.section,
        this.facebook,
        this.registration,
        this.location,
        this.status,
        this.phone,
        this.email,
        this.topics,
        this.category,
        this.catId,
        this.type,});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    brief = json['brief'];
    date = json['date'];
    endDate = json['end_date'];
    section = json['section'];
    facebook = json['facebook'];
    registration = json['registration'];
    location = json['location'];
    status = json['status'];
    phone = json['phone'];
    email = json['email'];
    topics = json['topics'].cast<String>();
    category = json['category'];
    catId = json['cat_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['brief'] = brief;
    data['date'] = date;
    data['end_date'] = endDate;
    data['section'] = section;
    data['facebook'] = facebook;
    data['registration'] = registration;
    data['location'] = location;
    data['status'] = status;
    data['phone'] = phone;
    data['email'] = email;
    data['topics'] = topics;
    data['category'] = category;
    data['cat_id'] = catId;
    data['type'] = type;
    return data;
  }
}