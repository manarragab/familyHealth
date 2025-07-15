import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/chat/chat_model.dart';
import 'package:abg/data/models/group/groups.dart';
import 'package:abg/data/remote_data/core.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/chat/domain/controller/chat_controller.dart';
import 'package:abg/features/chat/presentation/profile_details_screen.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widget/chat_card.dart';

class ChatScreen extends GetView<ChatController> {
   ChatScreen({Key? key}) : super(key: key);

final Groups dataGroup = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.chatAppBar(
          leadingImage: dataGroup.imagePath??"", title: dataGroup.title, subTitle: dataGroup.description ?? "",
          onTap: () {
            Get.to(() => ProfileDetailsScreen(
              dataGroup: dataGroup,
            ), arguments: dataGroup);
          }
          ),
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
                      avatar: dataGroup.imagePath ?? demoImage,
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

  // tapCamera: () async {
  //   final pickedFile = await Pick.pickImage(context);
  //   if (pickedFile != null) {
  //     controller.image = pickedFile;
  //   controller.messageController.text=pickedFile.path.split('/').last; // Set the file name as text
  //     controller.update();
  //   }
  // },


  tapCamera: () async {
  controller.isImageLoading = true;
  controller.update(); // علشان يعيد بناء الواجهة ويظهر اللودينج

  final pickedFile = await Pick.pickImage(context);

  if (pickedFile != null) {
    controller.image = pickedFile;
    controller.messageController.text = pickedFile.path.split('/').last;
  }

  controller.isImageLoading = false;
  controller.update(); // إعادة التحديث لإخفاء اللودينج
},

  image: controller.image, // ✅ تمرير الصورة هنا
  (value) {},
),

        ],
      ),
    );
  }
}
