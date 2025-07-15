import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/group/group_model.dart';
import 'package:abg/data/models/group/groups.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/chat/domain/controller/chat_controller.dart';
import 'package:abg/features/group/domain/controller/group_controller.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/image/custom_image.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailsScreen extends StatelessWidget {
  GroupController groupController = Get.find();
  final Groups dataGroup;
  ProfileDetailsScreen({super.key, required this.dataGroup});

  @override
  Widget build(BuildContext context) {
    final Groups group = Get.arguments;

    return Scaffold(
      appBar: CustomAppBar.appBar("Group Details"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: ClipOval(
                child: CustomImage.network(
                  group.image ?? "",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            group.title ?? "",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            group.description ?? "",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            "Members: ${group.membersCount ?? 0}",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const Spacer(),
          MainButton(
            onPressed: () {
              Get.dialog(AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                icon: CustomImage.asset(
                  "assets/images/all.png",
                  height: 100,
                  width: 100,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Are you sure you want to leave the group?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.almarai(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.darkblue)),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField.paragraphTextField(
                      controller: groupController.noteController,
                      (value) {
                        if (value.isNotEmpty) {
                          groupController.noteController.text = value;
                          print("valuee ${value}");
                        }
                      },
                      hint: "Type your reason here",
                    )
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LoadingOverLay(
                        showLoadingOnly: true,
                        child: MainButton(
                          onPressed: () {

                            groupController.leaveGroup(group);
                            Get.back();
                            groupController.noteController.clear();
                          },
                          withShadow: false,
                          height: 40,
                          title: "Yes",
                          radius: 7,
                          width: Get.width / 3.3,
                        ),
                      ),
                      MainButton(
                        onPressed: () {
                          Get.back();
                        },
                        withShadow: false,
                        height: 40,
                        title: "NO",
                        textColor: CustomColors.redd,
                        radius: 7,
                        width: Get.width / 3.3,
                        backgroundColor: Colors.white,
                        borderColor: CustomColors.redd,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ));
            },
            title: "Exit Group",
            radius: 30,
            fontSize: 18,
            backgroundColor: CustomColors.darkBlue2,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
