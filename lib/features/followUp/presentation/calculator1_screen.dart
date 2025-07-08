import 'package:abg/features/followUp/presentation/viewProgress_screen.dart';
import 'package:abg/features/followUp/presentation/widget/greenyContainer.dart';
import 'package:abg/features/followUp/presentation/widget/whitey2Container.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator1Screen extends StatelessWidget {
  final String image;
  const Calculator1Screen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.followUp.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
            Greenycontainer(
                image: image,
                widg: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Enter your weight today",
                      style: GoogleFonts.almarai(
                        fontSize: 15,
                        color: CustomColors.darkblue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Whitey2container(
                        KEY: "one",
                        title1: "your weight",
                        title2: "(kg)",
                        measure: "kg"),
                    const SizedBox(
                      height: 23,
                    ),
                    MainButton(
                      withShadow: true,
                      onPressed: () {},
                      radius: 10,
                      height: 46,
                      backgroundColor: CustomColors.lighttblue,
                      titleWidget: Text(
                        CustomTrans.record.tr,
                        style: GoogleFonts.almarai(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                    color: CustomColors.lightgreen,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: CustomColors.green1,
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Normal Weight",
                          style: GoogleFonts.almarai(
                            fontSize: 16,
                            color: CustomColors.darkblue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
                      style: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkblue,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
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
          ),
        ));
  }
}
