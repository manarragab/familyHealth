import 'package:abg/domain_data/main_getx_controller/main_getx_controller.dart';
import 'package:abg/res/configuration/print_types.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardController extends MainGetxController {
  @override
  onInit() {
    super.onInit();
    pageController.addListener(() {
      double? page = pageController.page;
      sPrint.info(page);
      if (isFixedNumber(page!)) {
        sPrint.info("work in page:: $page");
        index = page.toInt();
        update();
      }
    });
  }

  bool isFixedNumber(double number) {
    return number == number.toInt().toDouble();
  }

  @override
  dispose() {
    super.dispose();
    pageController.dispose();
  }

  List<BoardModel> boards = [
    BoardModel(
        'Your family’s health within your hands',
        "اكتشف فرصًا جديدة للربح والنمو مع نظام مستدام يصل بك إلى مستويات أعلى",
        'assets/svg/Online connection-amico.svg'),
    BoardModel(
        'Keep track of your health with our calculators and reminders',
        "أمانك أولوية—نضمن لك عمليات دفع وحماية بياناتك بأحدث التقنيات",
        'assets/svg/Mobile encryption-amico.svg'),
    BoardModel(
        'Our symptom checkers and library will keep your mind at ease',
        "ستثمر بثقة، واستمتع بدعم متواصل وشفافية كاملة في كل خطوة",
        'assets/svg/Good team-pana.svg'),
  ];

  Duration duration = const Duration(milliseconds: 300);
  PageController pageController = PageController();

  int index = 0;

  forward() {
    if (index < 2) {
      pageController.nextPage(duration: duration, curve: Curves.easeInOut);
      sPrint.info(index);
      ++index;
      update();
    } else {
      moveToLogin();
    }
  }

  moveToLogin() {
    Get.offAllNamed(CustomPage.loginPage);
  }
}

class BoardModel {
  String title, body, image;

  BoardModel(this.title, this.body, this.image);
}
