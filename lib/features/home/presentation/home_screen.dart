import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/data/models/reminder/reminder.dart';
import 'package:abg/data/models/reminder_family/reminder_family.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/group/domain/controller/group_controller.dart';
import 'package:abg/features/group/presentation/group_screen.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:abg/features/home/presentation/widget/doctor_card.dart';
import 'package:abg/features/home/presentation/widget/family_container.dart';
import 'package:abg/features/home/presentation/widget/home_banaras_bar.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'widget/bill_card.dart';
import 'widget/custom_drawer.dart';
import 'widget/dentistry_card.dart';

class Homescreen extends GetWidget<HomeController> {
  Homescreen({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    FamilyController familyController = Get.put(FamilyController());
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar.homeAppBar(
        onChange: (value) {},
        onMenuPress: () {
          if (!scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.openDrawer();
          }
        },
        onNotificationPress: () {
          //  Get.toNamed(CustomPage.notificationPage);
        },
      ),
      drawer: CustomDrawer(),
      body: LoadingOverLay(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            child: ListView(
              children: [
                // Greeting and mood emojis
                Text(
                  "Hey ${controller.user?.name ?? ""}",
                  style: TFonts.textTitleStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      "How are you feeling today?",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const Spacer(),
                    CustomImage.asset("assets/svg/emojis.svg",
                        height: 25, fit: BoxFit.fitWidth)
                  ],
                ),
                const SizedBox(height: 16),

                // Search bar
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: authController.user?.image != null
                          ? NetworkImage(authController.user?.image ?? "")
                          : const AssetImage("assets/images/cheker.png")
                              as ImageProvider,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "What are you looking for?",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                controller.obx((value) {
                  HomeModel model = value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Reminders Section
                      const Text(
                        "Reminders",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            model.data?.reminders?.length ?? 0,
                            (index) {
                              Reminders remind = model.data!.reminders![index];
                              final alarmTime = DateFormat.jm().format(
                                  DateFormat("HH:mm:ss")
                                      .parse(remind.alarmTime));
                              return _buildReminderCard(
                                title: remind.title ?? "",
                                subtitle: alarmTime,
                                dosage: remind.description ?? "",
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Family Reminders Section
                      const Text(
                        "Family Reminders Today",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        height: 125,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.data?.familyReminders?.length ?? 0,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            FamilyReminders remind =
                                model.data!.familyReminders![index];
                            return FamilyContainer(
                              index: index,
                              name: remind.name ?? "",
                              relation: remind.relative ?? "",
                              image: remind.image ?? "",
                              whenGetIT: remind.phone ?? "",
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (false)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Pills",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ...List.generate(2, (index) {
                              return const PillCard();
                            }),
                          ],
                        ),

                      if (false)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const Text(
                              "Progress tracker",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 100,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: 115,
                                    child: Column(
                                      children: [
                                        const Expanded(child: Placeholder()),
                                        Text(
                                          "test",
                                          style: TFonts.textTitleStyle(),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 10),
                                itemCount: 10,
                              ),
                            ),
                          ],
                        ),

                      const SizedBox(height: 16),
                      getTitle(
                          title: "Group",
                          onTapMore: () {
                            Get.to(() => const GroupScreen(),
                                transition: Transition.fadeIn,
                                binding: BindingsBuilder(() {
                              Get.put(GroupController()).onRefresh();
                            }));
                          }),
                      const SizedBox(height: 16),
                      ...List.generate(model.data?.groups?.length ?? 0,
                          (index) {
                        return MyGroupCard(data: model.data!.groups![index]);
                      }),
                      if (model.data?.banners?.isNotEmpty ?? false)
                        const SizedBox(height: 16),
                      if (model.data?.banners?.isNotEmpty ?? false)
                        HomeBanarasBar(
                            images: model.data?.banners
                                    ?.map((e) => e.image ?? "")
                                    .toList() ??
                                []),

                      const SizedBox(height: 16),
                      if (false)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Best doctors",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ...List.generate(2, (index) {
                              return InkWell(
                                  onTap: () {
                                    //    Get.to(() => ChatScreen());
                                  },
                                  child: const DoctorCard());
                            }),
                          ],
                        )
                    ],
                  );
                }),
                const SizedBox(height: 16),
              ],
            ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TFonts.textTitleStyle(fontSize: 14),
              ),
              const SizedBox(width: 8),
              Text(
                dosage,
                style: TFonts.bodyBoard,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subtitle,
                style: TFonts.textTitleStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget getTitle({required String title, required Null Function() onTapMore}) {
    return Row(
      children: [
        Text(
          title,
          style: TFonts.textTitleStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTapMore,
          child: const Text(
            "More",
            style: TextStyle(
              fontSize: 14,
              fontWeight: TFontWights.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
