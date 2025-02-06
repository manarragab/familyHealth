import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/remote_data/core.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/chat/domain/controller/chat_controller.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widget/chat_card.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.chatAppBar(
          leadingImage: demoImage, title: "title", subTitle: "20K Member"),
      body: Column(
        children: [
          Expanded(
            child: controller.obx((state) {
              ChatModel model = state;
              List<ChatMessage> data = model.data?.data ?? [];
              return SmartRefresher(
                controller: controller.refreshController,
                onRefresh: controller.onRefresh,
                onLoading: controller.onLoadMore,
                enablePullUp: true,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    ChatMessage message = data[index];
                    return ChatCard(
                      message: message.message ?? "",
                      isImage: message.type == "image",
                      fromMe: message.fromMe,
                      avatar: demoImage,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: data.length,
                ),
              );
            }, onTap: controller.onRefresh),
          ),
          CustomTextField.chat(
            controller: controller.messageController,
            onTap: controller.sendChat,
            (value) {},
          )
        ],
      ),
    );
  }
}
