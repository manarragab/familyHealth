import 'package:abg/data/const/export.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    required this.message,
    required this.isImage,
    required this.fromMe,
    required this.avatar,
    Key? key,
  }) : super(key: key);
  final String message, avatar;
  final bool isImage;
  final bool fromMe;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: fromMe ? TextDirection.ltr : TextDirection.rtl,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
            radius: 25,
          ),
          const SizedBox(width: 10),
          Container(
            width: Get.width / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (fromMe ? CustomColors.primary : const Color(0xff8CB0C4))
                  .withOpacity(0.45),
            ),
            margin: const EdgeInsetsDirectional.only(end: 50),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: isImage
                ? CustomImage.network(message)
                : Text(
                    message,
                    style: TFonts.cardBody(
                        color: const Color(0xff30495E), fontSize: 16),
                  ),
          )
        ],
      ),
    );
  }
}
