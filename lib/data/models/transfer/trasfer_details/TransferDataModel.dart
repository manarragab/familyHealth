import 'package:abg/data/remote_data/response_model.dart';

import 'Data.dart';

class TransferDetailsModel extends ResponseModel<TransferDetails?> {
  TransferDetailsModel({
    this.status,
    this.msg,
    this.data,
  });

  TransferDetailsModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json["message"];
    data = json['data'] != null ? TransferDetails.fromJson(json['data']) : null;
  }
  num? status;
  String? msg;
  TransferDetails? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map["message"] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
