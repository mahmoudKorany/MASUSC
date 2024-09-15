class Prices {
  int? _count;
  List<Data>? _data;

  Prices({int? count, List<Data>? data}) {
    if (count != null) {
      _count = count;
    }
    if (data != null) {
      _data = data;
    }
  }

  int? get count => _count;
  set count(int? count) => _count = count;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  Prices.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = _count;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? _id;
  String? _date;
  String? _image;

  Data({String? id, String? date}) {
    if (id != null) {
      _id = id;
    }
    if (date != null) {
      _date = date;
    }
    if (_image != null) {
      _image = _image;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get date => _date;
  set date(String? date) => _date = date;
  String? get image => _image;
  set image(String? image) => _image = image;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _date = json['date'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['date'] = _date;
    data['image'] = _image;
    return data;
  }
}