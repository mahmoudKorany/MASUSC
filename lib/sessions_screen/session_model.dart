class Sessions {
  int? count;
  List<Data>? data;

  Sessions({this.count, this.data});

  Sessions.fromJson(Map<String, dynamic> json) {
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
  String? sessionName;
  String? time;
  String? date;
  String? day;
  String? committeeName;
  String? presentedBy;
  String? place;
  String? link;

  Data(
      {this.id,
        this.sessionName,
        this.time,
        this.date,
        this.day,
        this.committeeName,
        this.presentedBy,
        this.place,
        this.link});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionName = json['session_name'];
    time = json['time'];
    date = json['date'];
    day = json['day'];
    committeeName = json['committee_name'];
    presentedBy = json['presented_by'];
    place = json['place'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['session_name'] = sessionName;
    data['time'] = time;
    data['date'] = date;
    data['day'] = day;
    data['committee_name'] = committeeName;
    data['presented_by'] = presentedBy;
    data['place'] = place;
    data['link'] = link;
    return data;
  }
}