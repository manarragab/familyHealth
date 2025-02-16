import 'package:abg/data/const/export.dart';
import 'package:abg/data/remote_data/core.dart';
import 'package:abg/res/router/pages.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/drawer_header.png",
                      fit: BoxFit.fill,
                      width: Get.width,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(demoImage),
                        ),
                        title: Text(
                          'Amira Mohamed',
                          style: TFonts.textTitleWhiteStyle(),
                        ),
                        subtitle: Text(
                          "32 years",
                          style: TFonts.textBodyWhiteStyle,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.only(bottom: 30),
            children: items
                .map(
                  (e) => ListTile(
                    onTap: e.onTap,
                    leading: CircleAvatar(
                      backgroundColor:
                          const Color(0xff30495E).withOpacity(0.85),
                      child: SvgPicture.asset(e.image!),
                    ),
                    title: Text(e.name ?? ""),
                  ),
                )
                .toList(),
          ))
        ],
      ),
    );
  }

  final List<DrawerItem> items = [
    DrawerItem(
        image: "assets/svg/folder.svg", name: "Medical Record", onTap: () {}),
    DrawerItem(
        image: "assets/svg/alarm.svg",
        name: CustomTrans.myAlarm.tr,
        onTap: () {
          Get.toNamed(CustomPage.myAlarm);
        }),
    DrawerItem(
        image: "assets/svg/calculator.svg", name: "calculations", onTap: () {}),
    DrawerItem(
        image: "assets/svg/follow_up.svg", name: "Follow Up", onTap: () {}),
    DrawerItem(
        image: "assets/svg/progress_tracker.svg",
        name: "Progress tracker",
        onTap: () {}),
    DrawerItem(image: "assets/svg/group.svg", name: "My Family", onTap: () {}),
    DrawerItem(
        image: "assets/svg/liberary.svg", name: "My Liberary", onTap: () {}),
    DrawerItem(image: "assets/svg/bills.svg", name: "Pills", onTap: () {}),
    DrawerItem(
        image: "assets/svg/doctor.svg", name: "Talk To Doctor", onTap: () {}),
    DrawerItem(
        image: "assets/svg/Notification.svg",
        name: "Notification",
        onTap: () {}),
    DrawerItem(
        image: "assets/svg/language.svg", name: "language", onTap: () {}),
    DrawerItem(
        image: "assets/svg/settings.svg", name: "Settings", onTap: () {}),
    DrawerItem(image: "assets/svg/support.svg", name: "Support", onTap: () {}),
  ];
}

class DrawerItem {
  String? name, image;
  Function()? onTap;

  DrawerItem({this.name, this.image, this.onTap});
}
