import 'package:abg/data/const/export.dart';
import 'package:abg/features/followUp/presentation/calculator1_screen.dart';
import 'package:abg/features/followUp/presentation/calculator2_screen.dart';
import 'package:abg/features/followUp/presentation/calculator3_screen.dart';
import 'package:abg/features/followUp/presentation/viewProgress_screen.dart';
import 'package:abg/features/followUp/presentation/widget/grey_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/features/followUp/domain/controller/followUp_controller.dart';

class FollowupScreen extends GetView<FollowupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.followUp.tr),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
                style: GoogleFonts.almarai(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.lighttblue),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.titles.length,
                  itemBuilder: (context, index) {
                    return GreyContainer(
                      onTapped: () {
                        switch (index) {
                          case 0:
                            Get.to(Calculator1Screen(
                              image: controller.images[index],
                            ));
                            break;
                          case 1:
                            Get.to(Calculator2Screen(
                              image: controller.images[index],
                            ));
                            break;
                          case 2:
                            Get.to(Calculator3Screen(
                              image: controller.images[index],
                            ));
                            break;
                        }
                      },
                      image: controller.images[index],
                      title: controller.titles[index],
                    );
                  }),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: MainButton(
                  onPressed: () {
                    Get.to(ViewProgressScreen());
                  },
                  title: "View progress",
                  withShadow: true,
                  radius: 10,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )),
    );
  }
}
