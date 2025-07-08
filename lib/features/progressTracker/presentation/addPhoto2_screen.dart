import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/presentation/done_screen.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';
import 'package:abg/features/progressTracker/presentation/widget/radioo.dart';
import 'package:abg/res/configuration/bottom_sheet/date_picker.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Addphoto2Screen extends GetView<ProgresstrackerController> {
  const Addphoto2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.habitTracker.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LoadingOverLay(
          child: ListView(
            children: [
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    color: CustomColors.darkBlue2,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 20),
              Text("Select the type",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    color: CustomColors.lightBlue2,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(ProgressType.values.length, (index) {
                  return Radioo( ID: "tracker" ,type: ProgressType.values[index]);
                }),
              ),
              const SizedBox(height: 16),
              Form(
                  child: Column(
                children: [
                  CustomTextField.nameTextField(
                    (val) {},
                    hint: "Name",
                  ),
                  const SizedBox(height: 16),
                  CustomTextField.paragraphTextField(
                    (value) {
                      // controller.postAlarm.description = value;
                    },
                    hint: "The message you want with the habit tracking",
                  ),
                  const SizedBox(height: 16),
                  CustomTextField.numberTextField(
                    (val) {},
                    hint: "Number of repetitions",
                  ),
                  const SizedBox(height: 16),
                  GetBuilder<ProgresstrackerController>(builder: (controller) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            CustomTextField.datePickerTextField(
                                hint: "Date",
                                controller: controller.date2Controller,
                                prefixIconPath: "assets/svg/clender.svg",
                                onDatePickerPress: () {
                                  CustomDatePicker((date) {
                                    controller.date2Controller.text =
                                        date.stringDate;
                                  }).showDatePicker(context);
                                }),
                            const SizedBox(height: 16),
                            CustomTextField.datePickerTextField(
                              prefixIconPath: "assets/svg/clock.svg",
                              controller: controller.timeController,
                              hint: CustomTrans.time.tr,
                              onDatePickerPress: () {
                                CustomDatePicker((time) {
                                  //  controller.postAlarm.alarmTime = date.stringTime24;
                                  controller.timeController.text =
                                      time.stringTime;
                                }).showTimePicker(context);
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  }),
                  const SizedBox(height: 16),
                  GetBuilder<ProgresstrackerController>(builder: (logic) {
                    return GestureDetector(
                      onTap: () async {
                        final pickedFile = await Pick.pickImage(context);
                        // if (pickedFile != null) {
                        // //  controller.postAlarm.image = pickedFile;
                        //  // controller.update();
                        // }
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 306.17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5, color: CustomColors.lightBlue2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              // chi
                              //ld: controller.postAlarm.image != null
                              //     ? Image.file(
                              //         controller.postAlarm.image!,
                              //         fit: BoxFit.cover,
                              //         width: 382,
                              //         height: 306.17,
                              //       )
                              child: Image.asset(
                                "assets/images/cheker.png",
                                fit: BoxFit.cover,
                                width: 382,
                                height: 306.17,
                              ),
                            ),
                          ),
                          //  if (controller.postAlarm.image == null)
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
