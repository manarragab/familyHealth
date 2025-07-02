import 'dart:io';

import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
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
                          controller.postFam.name = val;
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
                            final now =
                                DateFormat('yyyy-MM-dd').format(DateTime.now());
                            controller.dateController.text = now;
                            controller.postFam.brithDate = now;
                          }
                        },
                      ),

                      const SizedBox(height: 20),
                      CustomTextField.phoneTextField(
                        controller: controller.phoneController,
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
                          final tempSelected = [...controller.selectedDiseases];
                          TextEditingController searchController =
                              TextEditingController();
                          List<MedicalType> filteredList = [
                            ...MedicalType.values
                          ];

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  void filterSearch(String query) {
                                    setState(() {
                                      filteredList = MedicalType.values
                                          .where((item) => item.name
                                              .toLowerCase()
                                              .contains(query.toLowerCase()))
                                          .toList();
                                    });
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 20, 16, 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Medical record",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),

                                        // 🔍 Search field
                                        CustomTextField.searchField(
                                          (value) {
                                            filterSearch(value);
                                          },
                                          OnTap: () {},
                                          padding: EdgeInsets.zero,
                                          controller: searchController,
                                          hint: "Search disease...",
                                        ),
                                        const SizedBox(height: 10),

                                        // 📝 List of checkboxes
                                        SizedBox(
                                          height: 400,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children:
                                                  filteredList.map((item) {
                                                final isSelected =
                                                    tempSelected.contains(item);
                                                return CheckboxListTile(
                                                  value: isSelected,
                                                  onChanged: (bool? selected) {
                                                    setState(() {
                                                      if (selected == true) {
                                                        tempSelected.add(item);
                                                      } else {
                                                        tempSelected
                                                            .remove(item);
                                                      }
                                                    });
                                                  },
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  title: Text(
                                                    item.name,
                                                    style: TextStyle(
                                                      color: isSelected
                                                          ? Colors.green
                                                          : Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  activeColor: Colors.green,
                                                  checkColor: Colors.white,
                                                  side: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 2,
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        // ✅ Confirm button
                                        MainButton(
                                          width: Get.width / 3.5,
                                          onPressed: () {
                                            controller.selectedDiseases =
                                                tempSelected;
                                            controller.familyDiseaseController
                                                    .text =
                                                tempSelected
                                                    .map((e) => e.name)
                                                    .join(" , ");
                                            controller.postFam.medicalRecord =
                                                tempSelected
                                                    .map((e) => e.name)
                                                    .toList();
                                            print(
                                                "medical record ${controller.postFam.medicalRecord}");
                                            Get.back();
                                            controller.selectedDiseases.clear();
                                          },
                                          title: "confirm",
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },

                        // onDropDownPress: () {
                        //   final tempSelected = [...controller.selectedDiseases];
                        //   TextEditingController searchController =
                        //       TextEditingController();
                        //   List<MedicalType> filteredList = [
                        //     ...MedicalType.values
                        //   ];

                        //   showModalBottomSheet(
                        //     context: context,
                        //     isScrollControlled: true,
                        //     shape: const RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.vertical(
                        //           top: Radius.circular(20)),
                        //     ),
                        //     builder: (context) {
                        //       return StatefulBuilder(
                        //         builder: (context, setState) {
                        //           void filterSearch(String query) {
                        //             setState(() {
                        //               filteredList = MedicalType.values
                        //                   .where((item) => item.name
                        //                       .toLowerCase()
                        //                       .contains(query.toLowerCase()))
                        //                   .toList();
                        //             });
                        //           }

                        //           return Padding(
                        //             padding: const EdgeInsets.fromLTRB(
                        //                 16, 20, 16, 16),
                        //             child: Column(
                        //               mainAxisSize: MainAxisSize.min,
                        //               children: [
                        //                 const Text("Medical record",
                        //                     style: TextStyle(
                        //                         fontSize: 18,
                        //                         fontWeight: FontWeight.bold)),
                        //                 const SizedBox(height: 10),

                        //                 // 🔍 Search Field
                        //                 CustomTextField.searchField(
                        //                   (value) {
                        //                     filterSearch(value);
                        //                   },
                        //                   OnTap: () {},
                        //                   padding: EdgeInsets.zero,
                        //                   controller: searchController,
                        //                   hint: "Search disease...",
                        //                 ),
                        //                 const SizedBox(height: 10),

                        //                 // ✅ Grid of results
                        //                 SizedBox(
                        //                   height: 400,
                        //                   child: GridView.count(
                        //                     crossAxisCount: 2,
                        //                     mainAxisSpacing: 10,
                        //                     crossAxisSpacing: 10,
                        //                     childAspectRatio: 3.5,
                        //                     children: filteredList.map((item) {
                        //                       final isSelected =
                        //                           tempSelected.contains(item);
                        //                       return GestureDetector(
                        //                         onTap: () {
                        //                           setState(() {
                        //                             isSelected
                        //                                 ? tempSelected
                        //                                     .remove(item)
                        //                                 : tempSelected
                        //                                     .add(item);
                        //                           });
                        //                         },
                        //                         child: Container(
                        //                           alignment: Alignment.center,
                        //                           decoration: BoxDecoration(
                        //                             color: isSelected
                        //                                 ? Colors.green
                        //                                     .withOpacity(0.2)
                        //                                 : Colors.grey.shade200,
                        //                             border: Border.all(
                        //                                 color: isSelected
                        //                                     ? Colors.green
                        //                                     : Colors.grey),
                        //                             borderRadius:
                        //                                 BorderRadius.circular(
                        //                                     10),
                        //                           ),
                        //                           child: Text(
                        //                             item.name,
                        //                             style: TextStyle(
                        //                               color: isSelected
                        //                                   ? Colors.green
                        //                                   : Colors.black,
                        //                               fontWeight:
                        //                                   FontWeight.w600,
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       );
                        //                     }).toList(),
                        //                   ),
                        //                 ),
                        //                 const SizedBox(height: 10),

                        //                 ElevatedButton(
                        //                   onPressed: () {
                        //                     controller.selectedDiseases =
                        //                         tempSelected;
                        //                     controller.familyDiseaseController
                        //                             .text =
                        //                         tempSelected
                        //                             .map((e) => e.name)
                        //                             .join(" , ");
                        //                     controller.postFam.medicalRecord =
                        //                         tempSelected
                        //                             .map((e) => e.name)
                        //                             .toList();
                        //                     Get.back();
                        //                     controller.selectedDiseases.clear();
                        //                   },
                        //                   child: const Text("Confirm"),
                        //                 ),
                        //               ],
                        //             ),
                        //           );
                        //         },
                        //       );
                        //     },
                        //   );
                        // },
                      ),

                      const SizedBox(height: 20),
                      CustomTextField.dropDownTextField(
                          controller: controller.selectSomeoneController,
                          hint: "Select someone",
                          onDropDownPress: () {
                            CustomBottomSheet.showDefaultListBottomSheet(
                                context,
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
