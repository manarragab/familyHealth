import 'package:abg/data/const/export.dart';
import 'package:abg/features/progressTracker/presentation/addPhoto_screen.dart';
import 'package:abg/features/progressTracker/presentation/widget/addPhoto.dart';
import 'package:flutter/material.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class PhototrackerScreen extends GetWidget<ProgresstrackerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.photoTracker.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CustomColors.darkblue,
              ),
            ),
            SizedBox(height: 25),
            MainButton(
              onPressed: () {
                Get.to(AddphotoScreen());
              },
              title: "Add photo tracker",
              radius: 10,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 20),
            ...List.generate(4, (index) {
              return Addphoto();
            }),
          ],
        ),
      ),
    );
  }
}
