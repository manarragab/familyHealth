import 'package:abg/data/const/export.dart';
import 'package:abg/data/remote_data/core.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.chatAppBar(
          leadingImage: demoImage, title: "title", subTitle: "20K Member"),
      body: ListView.separated(
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(demoImage),
                ),
                const SizedBox(width: 10),
                Container(
                  width: Get.width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.primary.withOpacity(0.45),
                  ),
                  margin: const EdgeInsetsDirectional.only(end: 50),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('test'),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
        itemCount: 10,
      ),
    );
  }
}
