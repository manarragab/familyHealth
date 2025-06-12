import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:abg/features/pills/domain/controller/pils_controller.dart';

import '../../../../data/const/export.dart';

class LayoutController extends MainGetxController {
  int currentIndex = 0;

  bool showIcons = false;

  void changeNavBarIndex(int index, {bool useUpdate = false}) {
    sPrint.info('change to index ($index)');
    switch (index) {
      case 0:
        Get.put(HomeController()).onRefresh();
        break;
      case 1:
        Get.put(PilsController());
        break;
      case 2:
        Get.put(FamilyController()).onRefresh();
        break;
      case 3:
        Get.put(FamilyController()).onRefresh();
        break;
    }
    currentIndex = index;
    if (useUpdate) {
      update();
    }
  }

  @override
  onInit() {
    //  PushNotificationsManager().getNotificationToken();
    //  PushNotificationsManager().getNotification();
    super.onInit();
  }

  /// to get cached user from sharedPreference
  LoginModel? get getUser => sl<AuthCases>().getUser();

  /// add user to sharedPreference
  set setUser(LoginModel? loginModel) {
    sl<AuthCases>().setUser(loginModel);
  }

  void showFloatIcons() {
    showIcons = !showIcons;
    update();
  }
}
