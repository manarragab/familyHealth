import 'package:abg/data/const/export.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/res/injection.dart';

/// data : {"current_page":1,"data":[{"id":2,"sender_id":1,"type":"text","message":"message content is here","created_at":"2025-02-06T11:08:56.000000Z","updated_at":"2025-02-06T11:08:56.000000Z"}],"last_page":1}
/// status : 200
/// message : "Success"

class ChatModel extends ResponseModel<ChatData?> {
  ChatModel({
    this.data,
    this.status,
    this.message,
  });

  ChatModel.fromJson(dynamic json) {
    data = json['data'] != null ? ChatData.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
    if (data != null) {
      more = (data?.currentPage ?? 0) < (data?.lastPage ?? 0);
    }
  }

  ChatData? data;
  num? status;
  String? message;

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

/// current_page : 1
/// data : [{"id":2,"sender_id":1,"type":"text","message":"message content is here","created_at":"2025-02-06T11:08:56.000000Z","updated_at":"2025-02-06T11:08:56.000000Z"}]
/// last_page : 1

class ChatData {
  ChatData({
    this.currentPage,
    this.data,
    this.lastPage,
  });

  ChatData.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ChatMessage.fromJson(v));
      });
    }
    lastPage = json['last_page'];
  }

  num? currentPage;
  List<ChatMessage>? data;
  num? lastPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['last_page'] = lastPage;
    return map;
  }
}

/// id : 2
/// sender_id : 1
/// type : "text"
/// message : "message content is here"
/// created_at : "2025-02-06T11:08:56.000000Z"
/// updated_at : "2025-02-06T11:08:56.000000Z"

class ChatMessage {
  ChatMessage({
    this.id,
    this.senderId,
    this.type,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  ChatMessage.fromJson(dynamic json) {
    id = json['id'];
    senderId = json['sender_id'];
    type = json['type'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  num? senderId;
  String? type;
  String? message;
  String? createdAt;
  String? updatedAt;

  get fromMe => sl<AuthCases>().getUser()?.data?.id == senderId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sender_id'] = senderId;
    map['type'] = type;
    map['message'] = message;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
