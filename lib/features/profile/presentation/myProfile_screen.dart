import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:abg/features/profile/domain/controller/profile_controller.dart';
import 'package:abg/features/profile/presentation/profile_screen.dart';
import 'package:abg/features/profile/presentation/widget/colored_container.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';

class MyprofileScreen extends StatefulWidget {
  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {
  final RefreshController refreshController = RefreshController();
  final AuthController authController = Get.find();
  final FamilyController controller = Get.put(FamilyController());
  final ProfileController profileController = Get.put(ProfileController());
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final user = sl<AuthCases>().getUser()?.data;

    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.Profile.tr),
      body: LoadingOverLay(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: ListView(
            children: [
              // Greeting
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey ${authController.postRegister.name ?? ""}",
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.darkblue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "How are you feeling today?",
                    style: GoogleFonts.almarai(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.darkblue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Profile Tiles + Image
              SizedBox(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          authController.postRegister.gender == "male"
                              ? profileController.texts.length - 1
                              : profileController.texts.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.toNamed(CustomPage.progressTracker);
                                break;
                              case 1:
                                Get.toNamed(CustomPage.dueDatePage);
                                break;
                              case 2:
                                Get.toNamed(CustomPage.myFamily);
                                break;
                              case 3:
                                Get.toNamed(CustomPage.pillsPage);
                                break;
                            }
                          },
                          child: ColoredContainer(
                            text: profileController.texts[index],
                            color: profileController.colors[index],
                          ),
                        );
                      }),
                    ),
                    // Avatar inside semi-circle

                    GetBuilder<AuthController>(builder: (logic) {
                      return LoadingOverLay(
                        showLoadingOnly: true,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: Get.width / 2.2,
                                height: Get.height / 3,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(120),
                                    bottomLeft: Radius.circular(120),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GetBuilder<AuthController>(
                                      builder: (controller) {
                                    return Container(
                                      width: Get.width / 2.2,
                                      height: Get.height / 3,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(120),
                                          bottomLeft: Radius.circular(120),
                                        ),
                                        image: DecorationImage(
                                          image: authController.user?.image !=
                                                  null
                                              ? NetworkImage(
                                                  authController.user?.image ??
                                                      "")
                                              : controller.imageUrl != null
                                                  ? FileImage(
                                                      controller.imageUrl!)
                                                  : const AssetImage(
                                                          "assets/images/cheker.png")
                                                      as ImageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 6,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 220,
                              right: 110,
                              child: GestureDetector(
                                onTap: () async {
                                  final pick = await Pick.pickImage(context);
                                  if (pick != null) {
                                    authController.updateProfileImage(pick);
                                  }
                                },
                                child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: CustomColors.lightBlue2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: CustomImage.asset(
                                          "assets/svg/camera.svg",
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            // Profile Tiles + Image
           

              // Reminders
              Text(
                "Reminders",
                style: GoogleFonts.almarai(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.darkblue,
                ),
              ),
              const SizedBox(height: 10),

              homeController.obx((value) {
                HomeModel model = value;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(model.data?.reminders?.length ?? 0,
                        (index) {
                      final remind = model.data!.reminders![index];
                      final alarmTime = DateFormat.jm().format(
                          DateFormat("HH:mm:ss").parse(remind.alarmTime));
                      return _buildReminderCard(
                        title: remind.title ?? "",
                        subtitle: alarmTime,
                        dosage: remind.description ?? "",
                      );
                    }),
                  ),
                );
              }),

              // Family List
              // controller.obx((state) {
              //   FamilyModel fam = state;
              //   List<Family> list = fam.data ?? [];
              //   return SizedBox(
              //     height: 80,
              //     child: SmartRefresher(
              //       controller: refreshController,
              //       onRefresh: () async {
              //         await controller.onRefresh();
              //         refreshController.refreshCompleted();
              //       },
              //       child: ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: list.length,
              //         itemBuilder: (context, index) {
              //           final info = list[index];
              //           return Container(
              //             margin: const EdgeInsets.all(8),
              //             child: Dadcontainer(
              //               key: ValueKey(index),
              //               index: index,
              //               name: info.name ?? "",
              //               weight: '500mg',
              //               time: '1:20pm',
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //   );
              // }),

              const SizedBox(height: 20),

              // Logout Button
              Center(
                child: MainButton(
                  onPressed: () => Get.to(ProfileScreen()),
                  backgroundColor: Colors.redAccent,
                  width: Get.width * 2 / 3,
                  radius: 10,
                  title: CustomTrans.logOut.tr,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReminderCard({
    required String title,
    required String subtitle,
    required String dosage,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: TFonts.textTitleStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Text(dosage, style: TFonts.bodyBoard),
            ],
          ),
          const SizedBox(height: 8),
          Text(subtitle,
              style: TFonts.textTitleStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
