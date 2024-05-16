
class MagazineItem {
  int? count;
  List<Data>? data;

  MagazineItem({this.count, this.data});

  MagazineItem.fromJson(Map<String, dynamic> json) {
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
  String? url;
  String? description;
  String? image;

  Data({this.id, this.name, this.url, this.description, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}