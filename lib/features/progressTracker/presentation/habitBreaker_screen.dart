import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/presentation/widget/alarm_item.dart';
import 'package:abg/features/progressTracker/presentation/addHabitBreaker_screen.dart';
import 'package:abg/features/progressTracker/presentation/addPhoto2_screen.dart';
import 'package:abg/features/progressTracker/presentation/clenderHabitBreaker_screen.dart';
import 'package:abg/features/progressTracker/presentation/delete_screen.dart';
import 'package:abg/features/progressTracker/presentation/nameHabitTracker_screen.dart';
import 'package:abg/features/progressTracker/presentation/widget/anime.dart';
import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitbreakerScreen extends StatelessWidget {
  const HabitbreakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.habitBreaker.tr),
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
            const SizedBox(
              height: 20,
            ),
            MainButton(
              onPressed: () {
                Get.to(AddhabitbreakerScreen());
              },
              radius: 10,
              title: CustomTrans.AddHabitBreaker.tr,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 15,
            ),
            ...List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  Get.to(ClenderhabitbreakerScreen());
                },
                child: AlarmItem(
                  //container: 
                  title: "Name habit breaker",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
                  date: "13/9/2024",
                  time: "01.30 pm",
                //  onEdit: () {},
                  onDelete: () {
                Get.dialog(
                  const Delete(),
                );
                  }, image: '',
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
