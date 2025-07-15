import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/group/groups.dart';
import 'package:abg/data/remote_data/core.dart';
import 'package:abg/features/chat/domain/controller/chat_controller.dart';
import 'package:abg/features/chat/presentation/chat_screen.dart';
import 'package:abg/features/group/domain/controller/group_controller.dart';

class MyGroupCard extends GetView<GroupController> {
  final Groups data;
final String? id;
final bool? isJoined ;
  const MyGroupCard( {
    super.key,
    required this.data, this.id,
       this.isJoined, 
  });

  @override
  Widget build(BuildContext context) {
    return
    
    
     GestureDetector(
      onTap: () {
       
  if (isJoined==true || data.isJoined==true) {
  Get.to(() =>  ChatScreen(), arguments: data, binding: BindingsBuilder(() {
    Get.put(ChatController()).updateSelectedGroup(data);
  }));
}     
      },

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Circular Image
            Container(
               width: 60,
                  height: 60,
              padding: const EdgeInsets.all(4), // Green border width
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green, // Border color
              ),
              child: ClipOval(
                child: CustomImage.network(
                  data.image??demoImage, // Replace with the actual image URL
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12), 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(width: 12),
            Column(
              children: [
                Row(
                  children: [
       CustomImage.asset(
                    "assets/images/notify.png",
                    width: 20,
                    height: 20,
                   
                  ),
                  SizedBox(width: 5),
                  Text("${data.totalMessagesCount.toString() } ", style: TextStyle(fontSize: 12, color: Colors.grey[500]),),
                  ],
                  
                ),
            SizedBox(height: 5),
                // Join or Open Button
            ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                       isJoined==true  || data.isJoined==true ? Colors.black : const Color(0xffEE2D6C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () {
      
                    // if (data.pivot != null) {
                    //   Get.to(() => const ChatScreen(), binding: BindingsBuilder(() {
                    //     Get.put(ChatController()).updateSelectedGroup(data);
                    //   }));
                    // } else {
                    //   controller.joinGroup(data);
                    // }
      
      
      if (  isJoined==false  || data.isJoined==false){
      controller.joinGroup(data);
      }
      
                  },
                  child: Text(
                    isJoined==true  || data.isJoined==true? "opened" : "join",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
          ],
        ),
        ],)
      ),
    );
     
  }
}
