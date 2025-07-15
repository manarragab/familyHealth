import 'dart:io';

import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/models/chat/group/post_group_message.dart';
import 'package:abg/data/models/chat/group/post_message_response.dart';
import 'package:abg/data/models/group/groups.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/chat/domain/cases/chat_cases.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatController extends MainGetxController with CustomStateMixin {
  Groups? selectedGroup;

  TextEditingController messageController = TextEditingController();

  // Pushercontroller pusher = Pushercontroller();


  @override
  void onClose() {
    messageController.dispose();
    //pusher.dispose();
    super.onClose();
  }

  void updateSelectedGroup(Groups data) {
    selectedGroup = data;
    onRefresh();
  }

  // sendChat() async {
  //   loadingGetxController.showLoadingIcon();
  //   var response = await sl<ChatCases>().sendChatGroup(PostGroupMessage(
  //     message: messageController.text,
  //     messageType: "text",
  //     recipientId: selectedGroup!.id.toString(),
  //     type: "group",
  //   ));
  //   loadingGetxController.hideLoading();
  //   statusError.checkStatus(response, () {
  //     messageController.clear();
  //   });
  // }
  File? image;
  ChatModel model = ChatModel();
  RefreshController refreshController = RefreshController();

  int _page = 1;

  onRefresh() async {
    _page = 1;
    model = await refreshData(
      model: model,
      futureMethod: () =>
          sl<ChatCases>().chatGroup(selectedGroup!.id.toString()),
      controller: refreshController,
      checkIfEmpty: (data) {
        if (data is ChatModel) {
          if (data.data?.data?.isEmpty ?? true) {
            data.status = StatusType.empty.index;
          }
        }
        return data;
      },
      getPage: (page) => _page = page,
    );
    // pusher.pusherInit(selectedGroup!.id.toString());
  }

  onLoadMore() async {
    model = await loadMoreData(
      model: model,
      futureMethod: () =>
          sl<ChatCases>().chatGroup(selectedGroup!.id.toString(), page: _page),
      controller: refreshController,
      addModel: (data) {
        if (data is ChatModel) {
          model.data!.data = model.data!.data! + (data.data?.data ?? []);
          model.more = data.more;
        }
        return model;
      },
      getPage: (page) => _page = page,
      page: _page,
    );
  }



// sendChat() async {
// if (messageController.text.trim().isEmpty && image == null) return;

//     final text = messageController.text.trim();

//     loadingGetxController.showLoadingIcon();

//     var response = await sl<ChatCases>().sendChatGroup(PostGroupMessage(
//       message:  image != null? "" : text,
//       messageType: image != null? "image":"text",
//       recipientId: selectedGroup!.id.toString(),
//       type: "group",
//       image:   image ,
//     ));

// print("Response: ${image?.path.toString()}"); //it posted correctly
// //I/flutter (13031): Response: /data/user/0/com.apg.mint.mint/cache/scaled_Screenshot_1738931654.png

//     loadingGetxController.hideLoading();

//       statusError.checkStatus(response, () {
//       messageController.clear();

//       final newMessage = ChatMessage(
//         id: null, // لسه ملهاش id من الـ API
//         senderId: sl<AuthCases>().getUser()?.data?.id,
//         type: image != null? "image":"text",
//         message: image != null? image!.path: text,
//         createdAt: DateTime.now().toIso8601String(),
//         updatedAt: DateTime.now().toIso8601String(),
      
//       );

//       final ChatModel? currentModel = state;
//       final List<ChatMessage> currentMessages = currentModel?.data?.data ?? [];
//       currentMessages.insert(0, newMessage); // لأن الـ ListView reverse
//       currentModel?.data?.data = currentMessages;
//       image=null;
//       change(currentModel!, status: RxStatus.success());
    
//     });
//   }

sendChat() async {
  if (messageController.text.trim().isEmpty && image == null) return;

  final text = messageController.text.trim();
  loadingGetxController.showLoadingIcon();

  var response = await sl<ChatCases>().sendChatGroup(PostGroupMessage(
    message: image != null ? "" : text,
    messageType: image != null ? "image" : "text",
    recipientId: selectedGroup!.id.toString(),
    type: "group",
    image: image,
  ));

  print("📥 Response data from server: ${response.data}");

  loadingGetxController.hideLoading();

  statusError.checkStatus(response, () {
    messageController.clear();

    final String? imageUrl = response.data?.message;

    final newMessage = ChatMessage(
      id: response.data?.id,
      senderId: sl<AuthCases>().getUser()?.data?.id,
      type: image != null ? "image" : "text",
      message: image != null ? imageUrl : text,
      createdAt: response.data?.createdAt,
      updatedAt: response.data?.updatedAt,
    );

    print("✅ New image URL or text: ${newMessage.message}");

    final ChatModel? currentModel = state;
    final List<ChatMessage> currentMessages = currentModel?.data?.data ?? [];
    currentMessages.insert(0, newMessage);

    currentModel?.data?.data = currentMessages;
    image = null;
    change(currentModel!, status: RxStatus.success());
    update();
  });
}

bool isImageLoading = false;





}
