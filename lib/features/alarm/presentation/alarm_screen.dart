import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/presentation/add_alarm.dart';
import 'package:abg/features/alarm/presentation/widget/alarm_item.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myAlarm.tr),
      body: ListView(
        children: [
          Center(
            child: MainButton(
              onPressed: () {

                Get.to(const AddAlarm());
              },
              radius: 10,
              title: CustomTrans.newAlarm.tr,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text(
                    'Today',
                    style: GoogleFonts.almarai(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: CustomColors.lightBlue2),
                  )),
              ...List.generate(3, (index) {
                return AlarmItem(
                  title: "Name alarm",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
                  date: "13/9/2024",
                  time: "01:30 pm",
                  onEdit: () {},
                  onDelete: () {},
                );
              })
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Friday',
                      style: GoogleFonts.almarai(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: CustomColors.lightBlue2),
                    ),
                    Text(
                      '13.9.2024 ',
                      style: GoogleFonts.almarai(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: CustomColors.lightBlue2),
                    ),
                  ],
                ),
              ),
              ...List.generate(3, (index) {
                return AlarmItem(
                  title: "Name alarm",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
                  date: "13/9/2024",
                  time: "01:30 pm",
                  onEdit: () {},
                  onDelete: () {},
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
