import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';

import '../../../../data/const/export.dart';

class LayoutController extends MainGetxController {
  int currentIndex = 0;

  bool showIcons = false;

  void changeNavBarIndex(int index) {
    sPrint.info('change to index ($index)');
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:  
        break;
      case 4:
        break;
    }
    currentIndex = index;
    update();
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
