import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_response.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/widget/dadContainer.dart';
import 'package:abg/features/profile/presentation/profile_screen.dart';
import 'package:abg/features/profile/presentation/widget/colored_container.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyprofileScreen extends StatefulWidget {
  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {
  RefreshController refreshController = RefreshController();
  AuthController authController = Get.find();
  FamilyController controller = Get.put(FamilyController());

  List<String> texts = [
    "Health Trackers",
    "My Period",
    "My Family",
    "My Son",
    "pills",
    "My interest"
  ];

  List<Color> colors = [
    CustomColors.lightBlue3,
    CustomColors.darkpinky,
    CustomColors.secondary,
    CustomColors.primary,
    CustomColors.lightyellow,
    CustomColors.lighttblue1
  ];

  @override
  Widget build(BuildContext context) {
    final user = sl<AuthCases>().getUser()?.data;
    print("ddddddddddddddddddddd ${authController.postRegister.name ?? ""}");

    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.Profile.tr),
        body: Padding(
          padding: EdgeInsets.only(left: 16),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //   "Hey ${user?.name ?? ""}",
                    "Hey ${authController.postRegister.name ?? ""}",
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.darkblue,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "How are you felling today?",
                    style: GoogleFonts.almarai(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.darkblue,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: const BoxDecoration(
                    // color: Colors.black
                    ),
                height: Get.height * 1.5 / 3,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      //   direction: Axis.vertical,
                      children: [
                        ...List.generate(texts.length, (index) {
                          return ColoredContainer(
                              text: texts[index], color: colors[index]);
                        }),
                      ],
                    ),
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Stack(children: [
                        Container(
                          width: Get.width * 1.73 / 3,
                          decoration: const BoxDecoration( 
                              ),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: user?.image != null
                              ? Image.network(
                                  user!.image!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/images/profileImage.png",
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          right: 85,
                          bottom: 5,
                          child: GestureDetector(
                            onTap: () async {
                              final pickFile = await Pick.pickImage(context);
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.darkblue,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: SvgPicture.asset(
                                    "assets/svg/whiteCamera.svg"),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Reminders",
                style: GoogleFonts.almarai(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.darkblue,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              controller.obx((state) {
                FamilyModel fam = state;
                List<Family> list = fam.data ?? [];
                return SizedBox(
                  height: 80,
                  child: SmartRefresher(
                    controller: refreshController,
                    onRefresh: () async {
                      await controller.onRefresh();
                      refreshController.refreshCompleted();
                    },
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        Family info = list[index];
                        return Container(
                          //  width: 145,
                          margin: const EdgeInsets.all(8),
                          child: Dadcontainer(
                            key: ValueKey(index),
                            index: index,
                            name: info.name ?? "",
                            weight: '500mg',
                            time: '1:20pm',
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: MainButton(
                  onPressed: () {
                    Get.to(ProfileScreen());
                  },
                  backgroundColor: Colors.redAccent,
                  width: Get.width * 2 / 3,
                  radius: 10,
                  title: CustomTrans.logOut.tr,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ));
  }
}
