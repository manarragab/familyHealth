import 'package:abg/data/const/export.dart';
import 'package:abg/features/alarm/presentation/widget/alarm_item.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myAlarm.tr),
      body: Column(
        children: [
          Center(
            child: MainButton(
              onPressed: () {},
              radius: 10,
              title: CustomTrans.newAlarm.tr,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('today'),
              ...List.generate(2, (index) {
                return AlarmItem(
                  title: "title",
                  description: "description",
                  date: "date",
                  time: "time",
                  onEdit: () {},
                  onDelete: () {},
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
