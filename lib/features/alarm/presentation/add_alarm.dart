import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/domain/controller/alarm_controller.dart';
import 'package:abg/features/alarm/presentation/done_screen.dart';
import 'package:abg/features/alarm/presentation/widget/radio_item.dart';
import 'package:abg/res/configuration/bottom_sheet/date_picker.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({Key? key}) : super(key: key);

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  final AlarmController alarmCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.addAlarm.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                CustomTextField.dynamicTextField((value) {},
                    hint: "Name alarm"),
                const SizedBox(height: 16),
                CustomTextField.paragraphTextField(
                  (value) {},
                  hint: "The message you want with the alarm",
                ),
                const SizedBox(height: 16),
                CustomTextField.datePickerTextField(
                  prefixIconPath: "assets/svg/clender.svg",
                  onDatePickerPress: () {
                    CustomDatePicker((date) {}).showDatePicker(context);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField.datePickerTextField(
                  prefixIconPath: "assets/svg/clock.svg",
                  hint: CustomTrans.time.tr,
                  onDatePickerPress: () {
                    CustomDatePicker((date) {}).showTimePicker(context);
                  },
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    alarmCont.pickImage();
                  },
                  child: Obx(() => Stack(
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
                              child: alarmCont.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : alarmCont.image.value != null
                                      ? Image.file(
                                          alarmCont.image.value!,
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
                          if (alarmCont.image.value == null &&
                              !alarmCont.isLoading.value)
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
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: MainButton(
                    onPressed: () {
                      Get.to(Done());
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
    );
  }
}
