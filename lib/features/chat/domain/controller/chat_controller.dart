import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/models/chat/group/post_group_message.dart';
import 'package:abg/data/models/group/groups.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/chat/domain/cases/chat_cases.dart';
import 'package:abg/features/chat/domain/controller/pusherController.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatController extends MainGetxController with CustomStateMixin {
  Groups? selectedGroup;

  TextEditingController messageController = TextEditingController();

  Pushercontroller pusher = Pushercontroller();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose();
    pusher.dispose();
    super.onClose();
  }

  void updateSelectedGroup(Groups data) {
    selectedGroup = data;
    onRefresh();
  }

  sendChat() async {
    loadingGetxController.showLoadingIcon();
    var response = await sl<ChatCases>().sendChatGroup(PostGroupMessage(
      message: messageController.text,
      messageType: "text",
      recipientId: selectedGroup!.id.toString(),
      type: "group",
    ));
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      messageController.clear();
    });
  }

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
    pusher.pusherInit(selectedGroup!.id.toString());
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
}
