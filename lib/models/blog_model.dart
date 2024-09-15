class BlogItem {
  int? count;
  List<Data>? data;

  BlogItem({this.count, this.data});

  BlogItem.fromJson(Map<String, dynamic> json) {
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
  String? content;
  String? addDate;
  String? section;
  String? category;
  String? catId;

  Data(
      {this.id,
        this.title,
        this.image,
        this.brief,
        this.content,
        this.addDate,
        this.section,
        this.category,
        this.catId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    brief = json['brief'];
    content = json['content'];
    addDate = json['add_date'];
    section = json['section'];
    category = json['category'];
    catId = json['cat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['brief'] = brief;
    data['content'] = content;
    data['add_date'] = addDate;
    data['section'] = section;
    data['category'] = category;
    data['cat_id'] = catId;
    return data;
  }
}