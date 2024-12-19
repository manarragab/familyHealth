import 'package:abg/data/const/export.dart';
import 'package:abg/res/router/pages.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar("user name",
          centerTitle: false,
          leadingWidget: const CircleAvatar(),
          subTitle: "test subtitle",
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.dark_mode_outlined,
                  color: Colors.white,
                  size: 25,
                ))
          ]),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            minTileHeight: 35,
            onTap: model[index].onTap,
            title: Text(
              model[index].name,
              style: TFonts.textTitleStyle(
                  color: model[index].color,
                  fontWeight: TFontWights.bold,
                  fontSize: 16),
            ),
            leading: SvgPicture.asset(model[index].icon),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10),
        itemCount: model.length,
      ),
    );
  }

  final List<CustomListModel> model = [
    CustomListModel(CustomTrans.subscribe.tr, "assets/svg/crown.svg", () {
      Get.toNamed(CustomPage.mainVerifyAccountScreen);
    }),
    CustomListModel(
        CustomTrans.promotions.tr, "assets/svg/gift-box-benefits.svg", () {}),
    CustomListModel(CustomTrans.ads.tr, "assets/svg/ad.svg", () {}),
    CustomListModel(CustomTrans.reports.tr, "assets/svg/report.svg", () {}),
    CustomListModel(CustomTrans.settings.tr, "assets/svg/settings.svg", () {}),
    CustomListModel(
        CustomTrans.supportCenter.tr, "assets/svg/support_icon.svg", () {}),
    CustomListModel(CustomTrans.logout.tr, "assets/svg/exit2.svg", () {},
        color: CustomColors.red),
  ];
}

class CustomListModel {
  String name, icon;
  Function() onTap;
  Color color;

  CustomListModel(this.name, this.icon, this.onTap,
      {this.color = CustomColors.black});
}
