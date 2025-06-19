
import 'package:abg/data/const/export.dart';
import 'package:abg/data/remote_data/core.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/res/router/pages.dart';

class CustomDrawer extends GetView<AuthController> {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    final user = sl<AuthCases>().getUser()?.data;
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: Stack(
                  children: [

                    // user?.image != null
                    //     ? Image.network(
                    //         user?.image ?? "",
                    //         fit: BoxFit.fill,
                    //         width: Get.width,
                    //       )
                       Image.asset(
                            "assets/images/drawer_header.png",
                            fit: BoxFit.fill,
                            width: Get.width,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: ListTile(
                        leading:  
  CircleAvatar(
    radius: 25,
    backgroundColor: Colors.grey.shade200,
    backgroundImage: authController.user?.image != null
        ? NetworkImage(authController.user?.image ??"" )
        : const AssetImage("assets/images/cheker.png") as ImageProvider,
  ),

                        title: Text(
                          // sl<AuthCases>().getUser()?.data?.name ?? "",
//authController.namee??"",
                          authController.user?.name??"",
                              // sl<AuthCases>().getUser()?.data?.name ?? "",
                          style: TFonts.textTitleWhiteStyle(),
                        ),
                        subtitle: Text(
                           authController.user?.phone?? "",
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
                    onTap: () {
                      Get.back();
                      e.onTap?.call();
                    },
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
        image: "assets/svg/calculator.svg",
        name: "calculations",
        onTap: () {
          Get.toNamed(CustomPage.calculation);
        }),
    DrawerItem(
        image: "assets/svg/follow_up.svg",
        name: CustomTrans.followUp.tr,
        onTap: () {
          Get.toNamed(CustomPage.followUp);
        }),
    DrawerItem(
        image: "assets/svg/progress_tracker.svg",
        name: CustomTrans.progressTracker.tr,
        onTap: () {
          Get.toNamed(CustomPage.progressTracker);
        }),
    DrawerItem(
        image: "assets/svg/group.svg",
        name: CustomTrans.myFamily.tr,
        onTap: () {
          // print("Navigating to MyfamilyScreen ${CustomPage.myFamily}");
          Get.toNamed(CustomPage.myFamily);
        }),
    DrawerItem(
        image: "assets/svg/liberary.svg", name: "My Liberary", onTap: () {}),
    DrawerItem(image: "assets/svg/bills.svg", name: "Pills", onTap: () {
                Get.toNamed(CustomPage.pillsPage);

    }),

    
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
