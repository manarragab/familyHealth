import 'dart:async';

import 'package:abg/domain_data/main_getx_controller/main_getx_controller.dart';

class OTPController extends MainGetxController {
  int counter = 120;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    counter = 120;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        counter--;
      }

      if (counter == 0) {
        timer.cancel();
      }
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  String otp = "";

  void startCount() {
    counter = 120;
    timer.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        counter--;
      }
      if (counter == 0) {
        timer.cancel();
      }
      update();
    });
  }
}
