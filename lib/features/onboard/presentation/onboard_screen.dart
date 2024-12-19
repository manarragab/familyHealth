import 'dart:async';

import 'package:abg/data/const/export.dart';
import 'package:abg/features/onboard/domain/controller/board_controller.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/gestures.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final controller = Get.put(BoardController());
  late Timer t;

  @override
  void initState() {
    t = Timer.periodic(const Duration(seconds: 5), (timer) {
      sPrint.info('timer');
      if (controller.index + 1 >= controller.boards.length) {
        controller.index = 0;
      } else {
        controller.index = controller.index + 1;
      }
      controller.pageController.animateToPage(controller.index,
          duration: controller.duration, curve: Curves.easeInOut);
      controller.update();
    });
    super.initState();
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: CustomImage.asset('assets/icons/logo_without_background.svg',
            height: 50, fit: BoxFit.contain),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GetBuilder<BoardController>(builder: (logic) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.boards.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.pageController.animateToPage(
                        entry.key,
                        duration: controller.duration,
                        curve: Curves.easeInOut),
                    child: Container(
                      width: controller.index == entry.key ? 32 : 4,
                      height: 4,
                      margin: const EdgeInsetsDirectional.symmetric(
                          vertical: 8, horizontal: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: controller.index == entry.key
                              ? CustomColors.primary
                              : CustomColors.grey),
                    ),
                  );
                }).toList(),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: PageView.builder(
                itemCount: controller.boards.length,
                controller: controller.pageController,
                itemBuilder: (context, index) {
                  BoardModel board = controller.boards[index];
                  return Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(
                            board.title,
                            style: TFonts.titleBoard,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            board.body,
                            textAlign: TextAlign.center,
                            style: TFonts.bodyBoard,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 382,
                            width: double.infinity,
                            child: CustomImage.asset(board.image),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MainButton(
              title: CustomTrans.signUp.tr,
              onPressed: () {
                Get.toNamed(CustomPage.registerScreen);
              },
              width: 343.w,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: CustomTrans.alreadyHaveAnAccount.tr,
                  style: TFonts.inter(
                    color: const Color(0xff636363),
                    fontSize: TFontSizes.f14,
                  ),
                  children: [
                    TextSpan(
                      text: "   ${CustomTrans.login.tr}   ",
                      style: TFonts.inter(
                          color: CustomColors.primary,
                          fontSize: TFontSizes.f14,
                          fontWeight: TFontWights.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(CustomPage.loginPage);
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void startAnimation() {}
}
