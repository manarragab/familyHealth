import 'package:abg/data/remote_data/response_model.dart';

class ReadOnlyModel extends ResponseModel<ReadOnlyData?> {
  ReadOnlyModel({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  ReadOnlyModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? ReadOnlyData.fromJson(json['data']) : null;
    message = json['message'];
  }

  num? status;
  bool? success;
  ReadOnlyData? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }
}

class ReadOnlyData {
  ReadOnlyData({
    this.title,
    this.content,
    this.updatedAt,
  });

  ReadOnlyData.fromJson(dynamic json) {
    title = json['title'];
    content = json['content'];
    updatedAt = json['updated_at'];
  }

  String? title;
  String? content;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['content'] = content;
    map['updated_at'] = updatedAt;
    return map;
  }
}
