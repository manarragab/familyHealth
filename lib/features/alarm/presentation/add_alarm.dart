import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/domain/controller/alarm_controller.dart';
import 'package:abg/features/alarm/presentation/widget/radio_item.dart';
import 'package:abg/res/configuration/bottom_sheet/date_picker.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAlarm extends GetView<AlarmController> {
  const AddAlarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.addAlarm.tr),
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
              Text("Alarm type",
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    color: CustomColors.lightBlue2,
                    fontWeight: FontWeight.w700,
                  )),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(AlarmType.values.length, (index) {
                  return RadioItem(type: AlarmType.values[index]);
                }),
              ),
              const SizedBox(height: 16),
              Form(
                  child: Column(
                children: [
                  CustomTextField.dynamicTextField((value) {
                    controller.postAlarm.title = value;
                  }, hint: "Name alarm"),
                  const SizedBox(height: 16),
                  CustomTextField.paragraphTextField(
                    (value) {
                      controller.postAlarm.description = value;
                    },
                    hint: "The message you want with the alarm",
                  ),
                  const SizedBox(height: 16),
                  CustomTextField.datePickerTextField(
                    prefixIconPath: "assets/svg/clender.svg",
                    controller: controller.alarmDateController,
                    onDatePickerPress: () {
                      CustomDatePicker((date) {
                        controller.postAlarm.alarmDate = date.stringDate;
                        controller.alarmDateController.text = date.stringDate;
                      }).showDatePicker(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField.datePickerTextField(
                    prefixIconPath: "assets/svg/clock.svg",
                    controller: controller.alarmTimeController,
                    hint: CustomTrans.time.tr,
                    onDatePickerPress: () {
                      CustomDatePicker((date) {
                        controller.postAlarm.alarmTime = date.stringTime24;
                        controller.alarmTimeController.text = date.stringTime;
                      }).showTimePicker(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  GetBuilder<AlarmController>(builder: (controller) {
                    return Column(
                      children: [
                        CheckboxMenuButton(
                            value: controller.postAlarm.isRepeatable,
                            onChanged: (value) {
                              controller.postAlarm.isRepeatable =
                                  value ?? false;
                              controller.update();
                            },
                            child: Text("Repeated",
                                style: GoogleFonts.almarai(
                                  fontSize: 16,
                                  color: CustomColors.lightBlue2,
                                  fontWeight: FontWeight.w700,
                                ))),
                        if (controller.postAlarm.isRepeatable)
                          Column(
                            children: [
                              const SizedBox(height: 16),
                              CustomTextField.datePickerTextField(
                                prefixIconPath: "assets/svg/clender.svg",
                                controller: controller.medicineStartController,
                                hint: "start date",
                                onDatePickerPress: () {
                                  CustomDatePicker((date) {
                                    controller.postAlarm.medicineStartDate =
                                        date.stringDate;
                                    controller.medicineStartController.text =
                                        date.stringDate;
                                  }).showDatePicker(context);
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomTextField.datePickerTextField(
                                prefixIconPath: "assets/svg/clender.svg",
                                controller: controller.medicineEndController,
                                hint: "end date",
                                onDatePickerPress: () {
                                  CustomDatePicker((date) {
                                    controller.postAlarm.medicineEndDate =
                                        date.stringDate;
                                    controller.medicineEndController.text =
                                        date.stringDate;
                                  }).showDatePicker(context);
                                },
                              ),
                            ],
                          )
                      ],
                    );
                  }),
                  const SizedBox(height: 16),
                  GetBuilder<AlarmController>(builder: (logic) {
                    return GestureDetector(
                      onTap: () async {
                        final pickedFile = await Pick.pickImage(context);
                        if (pickedFile != null) {
                          controller.postAlarm.image = pickedFile;
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
                                  width: 0.5, color: CustomColors.lightBlue2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: controller.postAlarm.image != null
                                  ? Image.file(
                                      controller.postAlarm.image!,
                                      fit: BoxFit.cover,
                                      width: 382,
                                      height: 306.17,
                                    )
                                  : Image.asset(
                                      "assets/images/cheker.png",
                                      fit: BoxFit.cover,
                                      width: 382,
                                      height: 306.17,
                                    ),
                            ),
                          ),
                          if (controller.postAlarm.image == null)
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
                        if(controller.postAlarm.id != null){
                          controller.updateAlarm();
                        }else {
                          controller.addAlarm();
                        }
                      },
                      radius: 10,
                      title: CustomTrans.addAlarm.tr,
                      fontSize: 24,
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
