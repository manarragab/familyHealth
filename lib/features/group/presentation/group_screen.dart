import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/presentation/account_screen.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.settings.tr),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          Card(
            shape: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: getIcon(Icons.language),
                    title: Text(CustomTrans.changeLanguage.tr),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
