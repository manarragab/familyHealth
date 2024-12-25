import 'dart:async';

import 'package:abg/data/const/export.dart';
import 'package:abg/features/onboard/domain/controller/board_controller.dart';
import 'package:abg/res/router/pages.dart';

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
    return Stack(
      children: [
        Container(
          color: Colors.white,
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/svg/background.png",
            fit: BoxFit.fitWidth,
            width: Get.width,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              TextButton(
                  onPressed: () {
                    Get.offAllNamed(CustomPage.loginPage);
                  },
                  child: Text(
                    CustomTrans.skip.tr,
                    style: TFonts.buttonStyleWhite,
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              margin: EdgeInsets.only(top: Get.height / 1.7),
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      itemCount: controller.boards.length,
                      controller: controller.pageController,
                      itemBuilder: (context, index) {
                        BoardModel board = controller.boards[index];
                        return Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            board.title,
                            textAlign: TextAlign.center,
                            style: TFonts.titleBoard,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  GetBuilder<BoardController>(builder: (logic) {
                    return Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              logic.pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            },
                            icon: Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.backButton),
                                child:
                                    SvgPicture.asset("assets/svg/back.svg"))),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                controller.boards.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => controller.pageController
                                    .animateToPage(entry.key,
                                        duration: controller.duration,
                                        curve: Curves.easeInOut),
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  margin: const EdgeInsetsDirectional.symmetric(
                                      vertical: 8, horizontal: 4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: controller.index == entry.key
                                          ? CustomColors.primary
                                          : CustomColors.grey),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              logic.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            },
                            icon: Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.primary),
                                child: SvgPicture.asset(
                                    "assets/svg/forward.svg"))),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void startAnimation() {}
}
