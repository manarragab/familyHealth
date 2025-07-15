
import 'package:abg/data/remote_data/response_model.dart';

class PostGroupMessageResponse  extends ResponseModel<MessagesResponse?>{
  MessagesResponse? data;
  num? status;
  String? message;

  PostGroupMessageResponse({this.data, this.status, this.message});

  PostGroupMessageResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : MessagesResponse.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}

class MessagesResponse {
  int? senderId;
  String? type;
  String? message;
  int? messageableId;
  String? messageableType;
  String? updatedAt;
  String? createdAt;
  int? id;

  MessagesResponse({this.senderId, this.type, this.message, this.messageableId, this.messageableType, this.updatedAt, this.createdAt, this.id});

  MessagesResponse.fromJson(Map<String, dynamic> json) {
    senderId = json["sender_id"];
    type = json["type"];
    message = json["message"];
    messageableId = json["messageable_id"];
    messageableType = json["messageable_type"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["sender_id"] = senderId;
    _data["type"] = type;
    _data["message"] = message;
    _data["messageable_id"] = messageableId;
    _data["messageable_type"] = messageableType;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}