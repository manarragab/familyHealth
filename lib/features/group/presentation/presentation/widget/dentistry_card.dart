import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/group/groups.dart';
import 'package:abg/data/remote_data/core.dart';
import 'package:abg/features/chat/domain/controller/chat_controller.dart';
import 'package:abg/features/chat/presentation/chat_screen.dart';
import 'package:abg/features/group/domain/controller/group_controller.dart';

class MyGroupCard extends GetView<GroupController> {
  final Groups data;

  const MyGroupCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Circular Image
          Container(
            padding: const EdgeInsets.all(4), // Green border width
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green, // Border color
            ),
            child: ClipOval(
              child: CustomImage.network(
                demoImage, // Replace with the actual image URL
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12), // Space between image and text
          // Text and details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                // Description
                Text(
                  data.description ?? "",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Private Group and Members
                Text(
                  "Private group\n${data.membersCount ?? ""} members",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (data.pivot != null)
                TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    /*data. ?? */
                    "",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.pink,
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      data.pivot != null ? Colors.black : const Color(0xffEE2D6C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                onPressed: () {
                  if (data.pivot != null) {
                    Get.to(() => const ChatScreen(), binding: BindingsBuilder(() {
                      Get.put(ChatController()).updateSelectedGroup(data);
                    }));
                  } else {
                    controller.joinGroup(data);
                  }
                },
                child: Text(
                  data.pivot != null ? "open" : "join",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
