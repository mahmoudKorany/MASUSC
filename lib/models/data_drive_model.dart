class DataDrive {
  int? count;
  List<Data>? data;

  DataDrive({this.count, this.data});

  DataDrive.fromJson(Map<String, dynamic> json) {
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
  String? link11;
  String? link12;
  String? link21;
  String? link22;
  String? link31;
  String? link32;
  String? link41;
  String? link42;

  Data(
      {this.link11,
        this.link12,
        this.link21,
        this.link22,
        this.link31,
        this.link32,
        this.link41,
        this.link42});

  Data.fromJson(Map<String, dynamic> json) {
    link11 = json['link1_1'];
    link12 = json['link1_2'];
    link21 = json['link2_1'];
    link22 = json['link2_2'];
    link31 = json['link3_1'];
    link32 = json['link3_2'];
    link41 = json['link4_1'];
    link42 = json['link4_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link1_1'] = link11;
    data['link1_2'] = link12;
    data['link2_1'] = link21;
    data['link2_2'] = link22;
    data['link3_1'] = link31;
    data['link3_2'] = link32;
    data['link4_1'] = link41;
    data['link4_2'] = link42;
    return data;
  }
}