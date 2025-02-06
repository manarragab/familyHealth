import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/models/chat/group/post_group_message.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class ChatCases {
  DomainData _data;

  ChatCases(this._data);

  Future<ResponseModel<ChatData?>> chatGroup(String id, {int page = 1}) {
    return _data.chatGroup(id, page: page);
  }

  Future<ResponseModel<ChatMessage?>> sendChatGroup(PostGroupMessage post) {
    return _data.sendChatGroup(post);
  }
}
