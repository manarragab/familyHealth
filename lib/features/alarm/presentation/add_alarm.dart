import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/domain/controller/alarm_controller.dart';
import 'package:abg/features/alarm/presentation/widget/radio_item.dart';
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
            SizedBox(height: 20),
            Text("Alarm type",
                style: GoogleFonts.almarai(
                  fontSize: 16,
                  color: CustomColors.lightBlue2,
                  fontWeight: FontWeight.w700,
                )),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RadioItem(title: "Reminder"),
                RadioItem(title: "Medicine"),
                RadioItem(title: "Appointment"),
              ],
            ),
            SizedBox(height: 16),
            Form(
                child: Column(
              children: [
                Container(
                  height: 46,
                  width: 382,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.lightgrey3,
                  ),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: "Name alarm",
                      hintStyle: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkgrey3,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 120,
                  width: 382,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.lightgrey3,
                  ),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: "The message you want with the alarm",
                      hintStyle: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkgrey3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 46,
                  width: 382,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.lightgrey3,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: "Date",
                      hintStyle: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkgrey3,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset("assets/svg/clender.svg"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 46,
                  width: 382,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.lightgrey3,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: "Time",
                      hintStyle: GoogleFonts.almarai(
                        fontSize: 16,
                        color: CustomColors.darkgrey3,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset("assets/svg/clock.svg"),
                      ),
                    ),
                  ),
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
                              child: alarmCont.image.value != null
                                  ? Image.file(
                                      alarmCont.image.value!,
                                      fit: BoxFit.cover,
                                      width: 382,
                                      height: 306.17,
                                    )
                                  : Image.asset("assets/images/cheker.png",
                                      fit: BoxFit.cover,
                                      width: 382,
                                      height: 306.17),
                            ),
                          ),
                          if (alarmCont.image.value == null)
                            Positioned.fill(
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset("assets/svg/camera.svg",
                                        width: 45, height: 40),
                                    SizedBox(height: 8),
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
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: MainButton(
                    onPressed: () {
                      Get.to(const AddAlarm());
                    },
                    radius: 10,
                    title: CustomTrans.addAlarm.tr,
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
