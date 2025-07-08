import 'package:abg/data/const/export.dart';
import 'package:abg/domain_data/get_binding/get_binding.dart';
import 'package:abg/features/alarm/domain/controller/alarm_controller.dart';
import 'package:abg/features/alarm/presentation/alarm_screen.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/auth/presentation/login_screen.dart';
import 'package:abg/features/auth/presentation/my_account_screen.dart';
import 'package:abg/features/auth/presentation/sign_up_screen.dart';
import 'package:abg/features/calculation/presentation/DuedateCalc/dueDate_screen.dart';
import 'package:abg/features/calculation/presentation/IBS/ibsCalc1_screen.dart';
import 'package:abg/features/calculation/presentation/IBS/ibsCalc3_screen.dart';
import 'package:abg/features/calculation/presentation/IBS/ibsCalc4_screen.dart';
import 'package:abg/features/calculation/presentation/IBS/ibsCalc5_screen.dart';
import 'package:abg/features/calculation/presentation/IBS/ibsCalc6_screen.dart';
import 'package:abg/features/calculation/presentation/IBS/ibscalc2_screen.dart';
import 'package:abg/features/calculation/presentation/bodyWater/waterCalc_screen.dart';
import 'package:abg/features/calculation/presentation/calories/calorieCalc_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes1_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes2_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes3_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes4_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes5_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes6_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes7_screen.dart';
import 'package:abg/features/calculation/presentation/diabetes/diabetes8_screen.dart';
import 'package:abg/features/calculation/presentation/ovulation/ovulation2Calc_screen.dart';
import 'package:abg/features/calculation/presentation/ovulation/ovulation3Calc_screen.dart';
import 'package:abg/features/calculation/presentation/ovulation/ovulationCalc_screen.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/addfamily_screen.dart';
import 'package:abg/features/family/presentation/myfamily_screen.dart';
import 'package:abg/features/followUp/domain/controller/followUp_controller.dart';
import 'package:abg/features/followUp/presentation/followUp_screen.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:abg/features/home/presentation/home_screen.dart';
import 'package:abg/features/layout/domain/controller/layout_controller.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/medicalCalc_screen.dart';
import 'package:abg/features/layout/presentation/layout_screen.dart';
import 'package:abg/features/notification/domain/controller/notification_controller.dart';
import 'package:abg/features/notification/presentation/notification_screen.dart';
import 'package:abg/features/onboard/domain/controller/board_controller.dart';
import 'package:abg/features/onboard/presentation/onboard_screen.dart';
import 'package:abg/features/pills/domain/controller/pils_controller.dart';
import 'package:abg/features/pills/presentation/pills_screen.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';
import 'package:abg/features/progressTracker/presentation/progressTracker_screen.dart';
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
        binding: BindingsBuilder(() {
          Get.put(AuthController()).clearData();
        })),
    GetPage(
        name: registerScreen,
        page: () => SignUpScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(AuthController()).clearData();
        })),
    GetPage(
        name: layoutPage,
        page: () => LayoutScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          GetBinding();
          Get.put(LayoutController()).changeNavBarIndex(0);
        })),
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
        page: () => MyfamilyScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(FamilyController()).onRefresh();
        })),
    GetPage(
        name: followUp,
        page: () => FollowupScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(FollowupController());
        })),
    GetPage(
        name: progressTracker,
        page: () => ProgresstrackerScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(ProgresstrackerController());
        })),
    GetPage(
        name: calculation,
        page: () => MedicalcalcScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller()).onRefresh();
        })),
    GetPage(
        name: diabetes2Page,
        page: () => Diabetes2Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: diabetes1Page,
        page: () => const Diabetes1Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: diabetes3Page,
        page: () => Diabetes3Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: diabetes4Page,
        page: () => Diabetes4Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: diabetes5Page,
        page: () => Diabetes5Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: diabetes6Page,
        page: () => Diabetes6Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: diabetes7Page,
        page: () => Diabetes7Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: diabetes8Page,
        page: () => Diabetes8Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: dueDatePage,
        page: () => DuedateScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: ibsPage1,
        page: () => Ibscalc1Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: ibsPage2,
        page: () => Ibscalc2Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: ibsPage3,
        page: () => Ibscalc3Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: ibsPage4,
        page: () => Ibscalc4Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: ibsPage5,
        page: () => Ibscalc5Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: ibsPage6,
        page: () => Ibscalc6Screen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: homePage,
        page: () => Homescreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(HomeController());
        })),
    GetPage(
        name: ovulatePage,
        page: () => OvulationcalcScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: caloriePage,
        page: () => CaloriecalcScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: waterPage,
        page: () => WatercalcScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: pillsPage,
        page: () => PillsScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(PilsController());
        })),
    GetPage(
        name: ovulatePage2,
        page: () => Ovulation2calcScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: ovulatePage3,
        page: () => Ovulation3calcScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
    GetPage(
        name: addFamilyPage,
        page: () => AddfamilyScreen(),
        transition: Transition.fadeIn,
        binding: BindingsBuilder(() {
          Get.put(Calculationcontroller());
        })),
  ];

  static String addFamilyPage = '/addFamilyPage';
  static String pillsPage = '/pillsPage';
  static String caloriePage = '/caloriePage';
  static String waterPage = '/waterPage';
  static String ovulatePage = '/ovulatePage';
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
  static String calculation = "/calculation";
  static String myFamily = "/family_page";
  static String followUp = "/follow_up_page";
  static String progressTracker = "/progress_tracker_page";
  static String diabetes1Page = "/diabetes1";
  static String diabetes2Page = "/diabetes2";
  static String diabetes3Page = "/diabetes3";
  static String diabetes4Page = "/diabetes4";
  static String diabetes5Page = "/diabetes5";
  static String diabetes6Page = "/diabetes6";
  static String diabetes7Page = "/diabetes7";
  static String diabetes8Page = "/diabetes8";
  static String dueDatePage = "/duedate";
  static String ibsPage1 = "/ibsPage1";
  static String ibsPage2 = "/ibsPage2";
  static String ibsPage3 = "/ibsPage3";
  static String ibsPage4 = "/ibsPage4";
  static String ibsPage5 = "/ibsPage5";
  static String ibsPage6 = "/ibsPage6";
  static String ovulatePage1 = "/ovulatePage1";
  static String ovulatePage2 = "/ovulatePage2";
  static String ovulatePage3 = "/ovulatePage3";
}
