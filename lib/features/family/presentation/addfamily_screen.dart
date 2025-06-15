import 'dart:io';

import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/family_screen.dart';
import 'package:abg/res/configuration/bottom_sheet/bottom_sheets.dart';
import 'package:abg/res/configuration/bottom_sheet/date_picker.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class AddfamilyScreen extends GetView<FamilyController> {
  List x = ["h", "jj"];
  AddfamilyScreen({super.key});
  FormState k = FormState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.family.tr),
      body: LoadingOverLay(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Add a family member",
                  style: GoogleFonts.almarai(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.darkblue),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: Form(
                  key: key,
                  child: ListView(
                    children: [
                      GetBuilder<FamilyController>(builder: (logic) {
                        return GestureDetector(
                          onTap: () async {
                            final pickFile = await Pick.pickImage(context);
                            if (pickFile != null) {
                              controller.postFam.image = pickFile;
                              controller.update();
                            }
                          },
                          child: Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  height: 160.3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: controller.postFam.image != null
                                        ? Image.file(
                                            controller.postFam.image as File,
                                            fit: BoxFit.cover,
                                            width: 200,
                                            height: 160.3,
                                           )
                                        : Image.asset(
                                            "assets/images/cheker.png",
                                            fit: BoxFit.cover,
                                            width: 200,
                                            height: 160.3,
                                          ),
                                  ),
                                ),
                              ),
                              if (controller.postFam.image == null)
                                Positioned.fill(
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svg/camera.svg",
                                          width: 45,
                                          height: 40,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "Add Photo",
                                          style: GoogleFonts.almarai(
                                            fontSize: 16,
                                            color: CustomColors.darkBlue2,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 20),
                      CustomTextField.nameTextField(
                        controller: controller.nameController,
                        (val) {
                          controller.postFam.name=val;
                        },
                        hint: "Full Name",
                      ),
                      const SizedBox(height: 20),
                     CustomTextField.datePickerTextField(
  hint: "Date of birth",
  prefixIconPath: "assets/svg/clender.svg",
  controller: controller.dateController,
  onDatePickerPress: () async {
    CustomDatePicker((date) {
      controller.postFam.brithDate = date.stringDate;
      controller.dateController.text = date.stringDate;
    }).showDatePicker(context);

    if (controller.dateController.text.isEmpty) {
      final now = DateFormat('yyyy-MM-dd').format(DateTime.now());
      controller.dateController.text = now;
      controller.postFam.brithDate = now;
    }
  },
),

                      const SizedBox(height: 20),
                      CustomTextField.phoneTextField(
                        controller:controller.phoneController ,
                        (val) {
                          controller.postFam.phone = val;
                        },
                        hint: "Phone",
                      ),
                      const SizedBox(height: 20),
                    

         CustomTextField.dropDownTextField(
                          controller: controller.familyDiseaseController,
                          hint: "Medical record",
                          onDropDownPress: () {
                            CustomBottomSheet.showDefaultListBottomSheet(context,
                                title: "Medical record:-",
                                data: MedicalType.values, mainTitle: (index) {
                              return MedicalType.values[index].name;
                            }, onTap: (index) {
                              controller.familyDiseaseController.text =
                                  MedicalType.values[index].name;
                              controller.postFam.medicalRecord = MedicalType.values[index].name;
                              Get.back();
                            });
                          }),


                     const SizedBox(height: 20),
                      CustomTextField.dropDownTextField(
                          controller: controller.selectSomeoneController,
                          hint: "Select someone",
                          onDropDownPress: () {
                            CustomBottomSheet.showDefaultListBottomSheet(context,
                                title: "Select someone :-",
                                data: FamilyType.values, mainTitle: (index) {
                              return FamilyType.values[index].name;
                            }, onTap: (index) {
                              controller.selectSomeoneController.text =
                                  FamilyType.values[index].name;
                              controller.postFam.relative =
                                  FamilyType.values[index].name;
                              Get.back();
                            });
                          }),
                      const SizedBox(height: 20),
                      Center(
                        child: MainButton(
                          onPressed: () {
                         
                          controller.addFamily();
                          },
                          radius: 25, 
                          title: CustomTrans.add.tr,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                     
         
                      //      const SizedBox(
                      //   height: 23,
                      // ),
                      // InkWell(
                      //   onTap: (){
                      //     Get.to(FamilyScreen());
                      //   },
                      //   child: const Text("family" , style: TextStyle(color: Colors.blue),)),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
