import 'package:abg/res/configuration/print_types.dart';

class ResponseModel<T> {
  num? status;
  String? message;
  bool more = true;
  T? data;

  ResponseModel({this.status = 1, this.message = '', this.data});

  ResponseModel.fromJson(json) {
    status = json['status'];
    message = "${json['message'] ?? json['msg']}";
    status = json['status'];
    sPrint.info('status:: $status  ,, msg:$message');
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['status'] = status;
    json['message'] = message;
    return json;
  }
}
