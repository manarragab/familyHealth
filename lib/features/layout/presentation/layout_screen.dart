import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/profileFamily_screen.dart';
import 'package:abg/features/group/presentation/group_screen.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:abg/features/home/presentation/home_screen.dart';
import 'package:abg/features/layout/domain/controller/layout_controller.dart';
import 'package:abg/features/profile/presentation/profile_screen.dart';
import 'package:abg/res/configuration/print_types.dart';
import 'package:abg/res/injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/custom_bottom_navigation_bar.dart';

class LayoutScreen extends GetView<LayoutController> {
  LayoutScreen({Key? key}) : super(key: key);

  List<Widget> navigationBar = [
    Homescreen(),
    const Scaffold(),
    const ProfilefamilyScreen(),
    ProfileScreen(),
  ];

  Widget getNavigationBar(int index) {
    switch (index) {
      case 0:
        Get.put(HomeController()).onRefresh();
        break;
      case 1:
        break;
    }

    //   if (index == 2) {
    //     if (serviceController.model.data?.isEmpty ?? true) {
    //       sPrint.info('service.onRefresh');
    //       serviceController.onRefresh();
    //     }
    //   }
    return navigationBar[index];
  }

  bool checkLogin() {
    bool data = sl<AuthCases>().getUser() == null;
    sPrint.info('is Login :: $data');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentIndex != 0) {
          controller.changeNavBarIndex(0);
        } else {
          Get.back();
        }
        return false;
      },
      child: Scaffold(
        body: GetBuilder<LayoutController>(
          builder: (controller) {
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animate) =>
                    FadeTransition(
                      opacity: animate,
                      child: child,
                    ),
                child: getNavigationBar(controller.currentIndex));
          },
        ),
        bottomNavigationBar: GetBuilder<LayoutController>(builder: (logic) {
          return LayoutBottomNavBar(
            changeNavBarIndex: controller.changeNavBarIndex,
            currentIndex: controller.currentIndex,
          );
        }),
      ),
    );
  }
}
