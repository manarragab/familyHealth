import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/group/presentation/group_screen.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:abg/features/profile/domain/controller/profile_controller.dart';
import 'package:abg/features/profile/presentation/widget/colored_container.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyprofileScreen extends StatefulWidget {
  const MyprofileScreen({super.key});

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
                    "Hey ${authController.user?.name ?? ""}",
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
                          authController.user?.gender == "male"
                              ? profileController.texts.length - 1
                              : profileController.texts.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.toNamed(CustomPage.progressTracker);
                                break;
                              case 1:
                                Get.toNamed(CustomPage.myFamily);
                                break;
                              case 2:
                                Get.toNamed(CustomPage.pillsPage);
                                break;
                              case 3:
                                Get.to(const GroupScreen());
                                break;
                              case 4:
                                Get.toNamed(CustomPage.dueDatePage);
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
                                          image: authController.user?.image != null
                                              ? NetworkImage(
                                                  authController.user?.image ??
                                                      "")
                                             
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
                              top: Get.height / 3.55,
                              right: Get.width / 3.5,
                              child: GestureDetector(
                                onTap: () async {
                                  final pick = await Pick.pickImage(context);
                                  if (pick != null) {
                                   //authController.imageUrl = pick;
                            authController.updateProfileImage(pick);
                          
                                   // authController.updateProfile();
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
