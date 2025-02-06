import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/remote_data/response_model.dart';

/// data : {"sender_id":1,"type":"text","message":"message content is here","updated_at":"2025-02-06T11:08:56.000000Z","created_at":"2025-02-06T11:08:56.000000Z","id":2}
/// status : 200
/// message : "Message Sent Successfully!"

class SendGroupModel extends ResponseModel<ChatMessage?> {
  SendGroupModel({
    this.data,
    this.status,
    this.message,
  });

  SendGroupModel.fromJson(dynamic json) {
    data = json['data'] != null ? ChatMessage.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }
  ChatMessage? data;
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
