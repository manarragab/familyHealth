import 'package:abg/data/remote_data/response_model.dart';

import 'Transfer.dart';

class TransferModel extends ResponseModel<List<Transfer>?> {
  TransferModel({
    this.status,
    this.msg,
    this.currentPage,
    this.data,
    this.perPage,
    this.count,
  });

  TransferModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json["message"];
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Transfer.fromJson(v));
      });
    }
    perPage = json['per_page'];
    count = json['count'];
  }
  num? status;
  String? msg;
  num? currentPage;
  List<Transfer>? data;
  num? perPage;
  num? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map["message"] = msg;
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['per_page'] = perPage;
    map['count'] = count;
    return map;
  }
}
