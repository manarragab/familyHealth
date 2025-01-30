import 'package:abg/data/const/export.dart';
import 'package:abg/data/remote_data/core.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';

import 'widget/chat_card.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.chatAppBar(
          leadingImage: demoImage, title: "title", subTitle: "20K Member"),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                return ChatCard(
                  message: 'test $index',
                  isImage: false,
                  fromMe: index.isEven,
                  avatar: demoImage,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              itemCount: 10,
            ),
          ),
          CustomTextField.chat(
            (value) {},
          )
        ],
      ),
    );
  }
}
