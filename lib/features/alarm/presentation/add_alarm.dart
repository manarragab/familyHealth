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
          print("xxxxxxxxxxvvvv  ${ controller.postAlarm.type}");

                  return RadioItem(type: AlarmType.values[index]);
                }),
              ),
              const SizedBox(height: 16),
              Form(
                  child: Column(
                children: [
                  CustomTextField.dynamicTextField((value) {
                    controller.postAlarm.title = value;
                  }, controller: controller.nameController, hint: "Name alarm"),
                  const SizedBox(height: 16),
                  CustomTextField.paragraphTextField(
                    (value) {
                      controller.postAlarm.description = value;
                    },
                    controller: controller.messageController,
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
                      if(controller.alarmDateController.text ==null||controller.alarmDateController.text.isEmpty){
                        controller.postAlarm.alarmDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
                        controller.alarmDateController.text = DateFormat("yyyy-MM-dd").format(DateTime.now());
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField.datePickerTextField(
                    prefixIconPath: "assets/svg/clock.svg",
                    controller: controller.alarmTimeController,
                    hint: CustomTrans.time.tr,
                    onDatePickerPress: () {
                       
                      CustomDatePicker((date) {
                       // controller.postAlarm.alarmTime = date.stringTime24;
controller.postAlarm.alarmTime = DateFormat("HH:mm").format(date);
                        print("rrrrrrrrrrrrrr ${controller.postAlarm.alarmTime}");
                    //    controller.alarmTimeController.text = date.stringTime;
                    controller.alarmTimeController.text =   DateFormat("hh:mm a").format(date);

                      }).showTimePicker(context);
                      if(controller.alarmTimeController.text ==null||controller.alarmTimeController.text.isEmpty){
                        controller.postAlarm.alarmTime = DateFormat("hh:mm").format(DateTime.now());
                        controller.alarmTimeController.text = DateFormat("hh:mm a").format(DateTime.now());
                      }
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
                                   if(controller.medicineStartController.text ==null||controller.medicineStartController.text.isEmpty){
                        controller.postAlarm.alarmDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
                        controller.medicineStartController.text = DateFormat("yyyy-MM-dd").format(DateTime.now());
                      }
                                },
                              ),
                              const SizedBox(height: 16),
                              CustomTextField.datePickerTextField(
                                prefixIconPath: "assets/svg/clender.svg",
                                controller: controller.medicineEndController,
                                hint: "end date",
                                onDatePickerPress: () {
                                  CustomDatePicker((date) {
                                    controller.postAlarm.medicineEndDate = date.stringDate;
                                    controller.medicineEndController.text = date.stringDate;
                                  }).showDatePicker(context);
                                   if(controller.medicineEndController.text ==null||controller.medicineEndController.text.isEmpty){
                        controller.postAlarm.alarmDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
                        controller.medicineEndController.text = DateFormat("yyyy-MM-dd").format(DateTime.now());
                      }
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
                          controller.imageUrl = null;
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
                                  ? Image.file(controller.postAlarm.image!,
                                      fit: BoxFit.cover)
                                  : controller.imageUrl != null
                                      ? Image.network(controller.imageUrl!,
                                          fit: BoxFit.cover)
                                      : Image.asset("assets/images/cheker.png",
                                          fit: BoxFit.cover),
                            ),
                          ),
                          if (controller.postAlarm.image == null && controller.imageUrl==null )
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
                          controller.addAlarm();
              print("dddddddddddddd  ${controller.postAlarm.alarmTime}");

                        // if (controller.postAlarm.id != null) {
                        //   controller.updateAlarm();
                        // } else {
                        
                        // }
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
