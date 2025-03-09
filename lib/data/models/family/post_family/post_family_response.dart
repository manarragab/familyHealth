import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/remote_data/response_model.dart';

class PostFamilyResponse extends ResponseModel<Family?> {
  PostFamilyResponse({
    this.data,
    this.status,
    this.message,
  });

  PostFamilyResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Family.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }
  @override
  Family? data;
  @override
  num? status;
  @override
  String? message;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}
