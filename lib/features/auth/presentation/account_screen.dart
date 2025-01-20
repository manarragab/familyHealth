import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/profile/presentation/profile_screen.dart';
import 'package:abg/res/router/pages.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 70;
    LoginData user = sl<AuthCases>().getUser()?.data ?? LoginData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBar(CustomTrans.myAccount.tr),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                children: [
                  GetBuilder<AuthController>(builder: (logic) {
                    return customTileList(
                      leading: GestureDetector(
                        onTap: () {
                          Get.toNamed(CustomPage.myAccountPage);
                        },
                        child: Container(
                          height: height,
                          width: height,
                          child: Stack(
                            children: [
                              Container(
                                height: height,
                                width: height,
                                padding: const EdgeInsets.all(3),
                                child: CustomImage.network(
                                    logic.user?.image ?? "",
                                    fit: BoxFit.cover,
                                    borderRadius:
                                        BorderRadius.circular(height)),
                              ),
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.green,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      title: Text(
                        "${logic.user?.name ?? ""} ${logic.user?.name ?? ""}",
                        style: TFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text('${logic.user?.email}'),
                    );
                  }),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              color: CustomColors.backgroundScaffold,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Card(
                shape: OutlineInputBorder(
                    borderSide: const BorderSide(color: CustomColors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.toNamed(CustomPage.myAccountPage);
                        },
                        leading: getIcon(Icons.person_outline_sharp),
                        title: Text(CustomTrans.myAccount.tr),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                      const Divider(
                        color: CustomColors.grey,
                      ),
                      ListTile(
                        onTap: () {
                          Get.to(() => ProfileScreen(),
                              transition: Transition.fadeIn);
                        },
                        leading: getIcon(Icons.settings),
                        title: Text(CustomTrans.settings.tr),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Card(
                shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: CustomColors.lightGrey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  onTap: () {
                    Get.put(AuthController()).logOut();
                  },
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text(CustomTrans.logout.tr),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget customTileList({
  required Widget leading,
  double spacing = 10,
  required Widget title,
  Widget? subtitle,
  Widget? trailing,
}) {
  return Row(
    children: [
      leading,
      SizedBox(width: spacing),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            if (subtitle != null)
              Column(
                children: [
                  const SizedBox(height: 4),
                  subtitle,
                ],
              )
          ],
        ),
      ),
      if (trailing != null) trailing
    ],
  );
}

Widget getIcon(IconData icon) {
  return Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]),
    padding: const EdgeInsets.all(10),
    child: Icon(
      icon,
      color: CustomColors.secondary,
    ),
  );
}
