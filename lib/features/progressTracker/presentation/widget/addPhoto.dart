import 'package:abg/data/const/export.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';
class Addphoto extends GetWidget<ProgresstrackerController> {
  const Addphoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Name Photo Tracker",
                style: GoogleFonts.almarai(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.darkblue,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                height: 28,
                width: 104.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: CustomColors.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/svg/whiteCamera.svg'),
                    Text(
                      "add photo",
                      style: GoogleFonts.almarai(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.white2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 140,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Obx(() {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            height: 120,
                            width: Get.width * 1 / 4,
                            child: Image.asset(
                              "assets/images/cheker2.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Center(
                            child: Text(
                              "12/11/2012",
                              style: GoogleFonts.almarai(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.darkblue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
