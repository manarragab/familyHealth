import 'package:abg/data/remote_data/response_model.dart';

/// status : 1
/// message : ""
/// data : [{"id":2,"name":"Hesham Abdelkhalek","image":"https://kaptanvip.com/dev/uploads/drivers/img-1654243807.jpg"}]

class TeamModel extends ResponseModel<List<TeamDriver>?> {
  TeamModel({
    this.status,
    this.message,
    this.data,
  });

  TeamModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TeamDriver.fromJson(v));
      });
    }
  }
  num? status;
  String? message;
  List<TeamDriver>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// name : "Hesham Abdelkhalek"
/// image : "https://kaptanvip.com/dev/uploads/drivers/img-1654243807.jpg"

class TeamDriver {
  TeamDriver({
    this.id,
    this.name,
    this.image,
  });

  TeamDriver.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
