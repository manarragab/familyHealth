import 'package:abg/data/const/export.dart';
import 'package:abg/domain_data/get_binding/get_binding.dart';
import 'package:abg/features/alarm/domain/controller/alarm_controller.dart';
import 'package:abg/features/alarm/presentation/alarm_screen.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/auth/presentation/login_screen.dart';
import 'package:abg/features/auth/presentation/my_account_screen.dart';
import 'package:abg/features/auth/presentation/sign_up_screen.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/myfamily_screen.dart';
import 'package:abg/features/layout/presentation/layout_screen.dart';
import 'package:abg/features/notification/domain/controller/notification_controller.dart';
import 'package:abg/features/notification/presentation/notification_screen.dart';
import 'package:abg/features/onboard/domain/controller/board_controller.dart';
import 'package:abg/features/onboard/presentation/onboard_screen.dart';
import 'package:abg/features/verify_account/domain/controller/main_verify_account_controller.dart';
import 'package:abg/features/verify_account/presentation/main_verify_account_screen.dart';
import 'package:get/get.dart';

import '../../my_app.dart';

class CustomPage {
  static List<GetPage> pages = [
    GetPage(
        name: loginPage,
        page: () => LoginScreen(),
        transition: Transition.fadeIn,
        binding: GetBinding()),
    GetPage(
        name: registerScreen,
        page: () => SignUpScreen(),
        transition: Transition.fadeIn,
        binding: GetBinding()),
    GetPage(
        name: layoutPage,
        page: () => LayoutScreen(),
        transition: Transition.fadeIn,
        binding: GetBinding()),
    GetPage(
        name: splashPage,
        page: () => const Splash(),
        transition: Transition.fadeIn,
        binding: GetBinding()),
    GetPage(
        name: onBoardPage,
        page: () => const BoardScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(BoardController());
        })),
    GetPage(
        name: myAccountPage,
        page: () => const MyAccountScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(AuthController()).updateMyAccountScreen();
        })),
    GetPage(
        name: notificationPage,
        page: () => const NotificationScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(NotificationController()).onRefresh();
        })),
    GetPage(
        name: mainVerifyAccountScreen,
        page: () => const MainVerifyAccountScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(MainVerifyAccountController());
        })),
    GetPage(
        name: myAlarm,
        page: () => const AlarmScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(AlarmController()).onRefresh();
        })),
         GetPage(
        name: myFamily,
        page: () =>  const MyfamilyScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
        Get.put(FamilyController()).onRefresh();
        })),
  ];

  static String layoutPage = '/layout';
  static String splashPage = '/';
  static String mapPage = '/map';
  static String homePage = '/home';
  static String navPage = '/nav';
  static String myAccountPage = '/my_account';

  // static String otpPage = '/otp';
  static const String loginPage = '/login';
  static const String notificationPage = '/notification';

  static String onBoardPage = "/on_board";

  static String registerScreen = "/register";
  static String mainVerifyAccountScreen = "/main_verify_account_screen";

  static String myAlarm = "/my_alarm_page";

    static String myFamily = "/family_page";

}
