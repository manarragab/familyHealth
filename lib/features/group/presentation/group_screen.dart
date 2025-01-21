import 'package:abg/data/const/export.dart';
import 'package:abg/features/home/presentation/widget/dentistry_card.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myGroup.tr),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Share good news with friends....",
              style: TFonts.textTitleStyle(),
            ),
          ),
          ...List.generate(2, (index) {
            return MyGroupCard();
          }),
          const SizedBox(height: 10),
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Suggested groups",
              style: TFonts.textTitleStyle(),
            ),
          ),
          ...List.generate(2, (index) {
            return MyGroupCard();
          }),
        ],
      ),
    );
  }
}
