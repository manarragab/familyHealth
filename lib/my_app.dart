import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/localization/change_language.dart';
import 'package:abg/res/notification/push_notification.dart';
import 'package:flutter/gestures.dart';

import 'data/remote_data/core.dart';
import 'domain_data/get_binding/get_binding.dart';
import 'localization/Translation.dart';
import 'res/configuration/context.dart';
import 'res/router/getx_router.dart';
import 'res/router/pages.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(419, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: initData.title,
              // scrollBehavior: AppScrollBehavior(),
              theme: Context.getThemeData(),
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: widget!,
                );
              },
              initialBinding: GetBinding(),
              translations: Translation(),
              locale: Locale(TLang.getLocalLang().name),
              fallbackLocale: const Locale('en'),
              getPages: CustomPage.pages,
            ));
  }
}

class NotFoundPage extends StatelessWidget {
  NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('not Found page'),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
/*  final loginController = Get.find<AuthController>();

  // late AnimationController _controller;
  getData() async {
    log((await CustomDeviceInfo().getDevice()).toString());
    loginController.getSetting();
  }*/

  @override
  void initState() {
    super.initState();
    PushNotificationsManager().requestNotificationPermissions();
    PushNotificationsManager().getNotificationToken();
    PushNotificationsManager().getNotification();
    PushNotificationsManager().subscribeClient();
    // getData();
    sPrint.warning('checkIFSelected:: ${TLang.checkIFSelectLocal()}');
    Future.delayed(const Duration(seconds: 1), () {
      sPrint.info('getUser:: ${sl<AuthCases>().getUser() != null}');
      //   if (sl<AuthCases>().getUser() != null) {
     // CustomGet.offNamed(CustomPage.layoutPage);
      // } else {
         CustomGet.offNamed(CustomPage.onBoardPage);
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
    //  _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.accentLight,
      body: Center(
        child: CustomImage.asset('assets/svg/plane.svg',
            fit: BoxFit.fitWidth, width: Get.width, height: Get.height),
      ),
    );
  }
}
