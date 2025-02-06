import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';

/// image : ""
/// type : "group"
/// recipient_id : "4"
/// message_type : "text"
/// message : "message content is here"

class PostGroupMessage {
  PostGroupMessage({
    this.image,
    this.type,
    this.recipientId,
    this.messageType,
    this.message,
  });

  PostGroupMessage.fromJson(dynamic json) {
    image = json['image'];
    type = json['type'];
    recipientId = json['recipient_id'];
    messageType = json['message_type'];
    message = json['message'];
  }
  File? image;
  String? type;
  String? recipientId;
  String? messageType;
  String? message;

  Future<Map<String, dynamic>> toJson() async {
    final map = <String, dynamic>{};
    if (image != null) {
      map['image'] = await MultipartFile.fromFile(image!.path);
    }
    map['type'] = type;
    map['recipient_id'] = recipientId;
    map['message_type'] = messageType;
    map['message'] = message;
    return map;
  }
}
