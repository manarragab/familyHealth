import 'package:abg/features/followUp/presentation/viewProgress_screen.dart';
import 'package:abg/features/followUp/presentation/widget/greenyContainer.dart';
import 'package:abg/features/followUp/presentation/widget/whitey1Container.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator3Screen extends StatelessWidget {
  final String image;
  const Calculator3Screen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.followUp.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
             Greenycontainer(
                title: "Measuring\nblood sugar",
                size: 33,
                centertxt: "Measuring blood pressure",
                heightt: 399,
                image: image,
                widg: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "  Enter your Measuring blood sugar today",
                      style: GoogleFonts.almarai(
                        fontSize: 15,
                        color: CustomColors.darkblue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      child:Whitey1container(
                          width: Get.width,
                          txt: "glucose level",
                          pressure: 120),
                    ),
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
                          "Normal blood pressure",
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
                    Get.to(const ViewProgressScreen());
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
