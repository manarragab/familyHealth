import 'dart:ffi';

import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/presentation/done_screen.dart';
import 'package:abg/res/configuration/bottom_sheet/bottom_sheets.dart';
import 'package:abg/res/configuration/bottom_sheet/date_picker.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AddphotoScreen extends GetView<ProgresstrackerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.photoTracker.tr),
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
              SizedBox(height: 25),
              Form(
                  key: key,
                  child: Column(
                    children: [
                      CustomTextField.nameTextField(
                        (val) {},
                        hint: "Name",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextField.paragraphTextField((val) {},
                          hint: "The message you want with the tracker"),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextField.datePickerTextField(
                          hint: "Date",
                          controller: controller.date1Controller,
                          prefixIconPath: "assets/svg/clender.svg",
                          onDatePickerPress: () {
                            CustomDatePicker((date) {
                              controller.date1Controller.text = date.stringDate;
                            }).showDatePicker(context);
                          }),
                      SizedBox(
                        height: 16,
                      ),
                      GetBuilder<ProgresstrackerController>(builder: (logic) {
                        return GestureDetector(
                          onTap: () async {
                            final pickedFile = await Pick.pickImage(context);
                            if (pickedFile != null) {
controller.image=pickedFile;
controller.update();
                            }
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 382,
                                height: 306.17,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color: CustomColors.lightBlue2),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: controller.image != null
                                      ? Image.file(
                                          controller.image!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 306.17,
                                        ):
                                   Image.asset(
                                    "assets/images/cheker.png",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 306.17,
                                  ),
                                ),
                              ),
                              if (controller.image == null)
                              Positioned.fill(
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset("assets/svg/camera.svg",
                                          width: 45, height: 40),
                                      const SizedBox(height: 8),
                                      Text("Add Photo",
                                          style: GoogleFonts.almarai(
                                              fontSize: 16,
                                              color: CustomColors.darkBlue2,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextField.dropDownTextField(
                        onDropDownPress: () {
                          CustomBottomSheet.showDefaultListBottomSheet(
                            context,
                            data: FamilyType.values,
                            title: 'Select family member :-',
                            mainTitle: (index) {
                              return FamilyType.values[index].name;
                            },
                            onTap: (index) {
                              controller.familyController.text =
                                  FamilyType.values[index].name;
                              Get.back();
                            },
                          );
                        },
                        hint: "Select a family member (option)",
                        controller: controller.familyController,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: MainButton(
                          onPressed: () {
                           Get.dialog(
                       Done(),
                       );
                          },
                          radius: 10,
                          title: CustomTrans.add.tr,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
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
