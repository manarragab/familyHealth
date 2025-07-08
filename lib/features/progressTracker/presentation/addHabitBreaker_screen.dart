import 'dart:ffi';

import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/presentation/done_screen.dart';
import 'package:abg/features/home/presentation/home_screen.dart';
import 'package:abg/features/progressTracker/presentation/widget/radioo.dart';
import 'package:abg/res/configuration/bottom_sheet/bottom_sheets.dart';
import 'package:abg/res/configuration/bottom_sheet/date_picker.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AddhabitbreakerScreen extends GetView<ProgresstrackerController> {
  const AddhabitbreakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.habitBreaker.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LoadingOverLay(
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
              const SizedBox(height: 25),
              Form(
                  key: key,
                  child: Column(
                    children: [
                      CustomTextField.nameTextField(
                        (val) {},
                        hint: "Name",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Duration of time",
                        
                            style: GoogleFonts.almarai(
                              fontSize: 16,
                              color: CustomColors.lightBlue2,
                              fontWeight: FontWeight.w700,
                            
                            )),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(PeriodType.values.length, (index) {
                          return Radioo(ID: "breaker"  ,period: PeriodType.values[index]);
                        }),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField.dynamicTextField((value) {},
                          onTapped: () {}, hint: "Example 120 days"),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField.datePickerTextField(
                          hint: "Date of beginning",
                          controller: controller.date3Controller,
                          prefixIconPath: "assets/svg/clender.svg",
                          onDatePickerPress: () {
                            CustomDatePicker((date) {
                              controller.date3Controller.text = date.stringDate;
                            }).showDatePicker(context);
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField.paragraphTextField((val) {},
                          hint:
                              "Write down the reason you want to break the habit"),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: MainButton(
                          onPressed: () {
                          Get.dialog(
                       const Done(),
                       );
                          },
                          radius: 10,
                          title: CustomTrans.add.tr,
                          fontSize: 24,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
