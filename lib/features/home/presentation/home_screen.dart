import 'package:abg/data/const/export.dart';
import 'package:abg/data/remote_data/core.dart';
import 'package:abg/features/chat/presentation/chat_screen.dart';
import 'package:abg/features/group/presentation/group_screen.dart';
import 'package:abg/features/home/presentation/widget/doctor_card.dart';
import 'package:abg/features/home/presentation/widget/home_banaras_bar.dart';
import 'package:abg/res/router/pages.dart';

import 'widget/bill_card.dart';
import 'widget/custom_drawer.dart';
import 'widget/dentistry_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Greeting and mood emojis
            const Text(
              "Hey Amira",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "How are you feeling today?",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Spacer(),
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
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/100'),
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
                  4,
                  (index) => _buildReminderCard(
                    title: "Tablet Panadol",
                    subtitle: "After lunch 1:20pm",
                    dosage: "500mg",
                    isTaken: index % 2 == 0,
                  ),
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
                itemBuilder: (context, index) {
                  return _buildFamilyReminderCard(
                    name: "Mohamed",
                    relation: "Dad",
                    title: "Tablet Panadol",
                    dosage: "500mg",
                    time: "1:20pm",
                    isTaken: true,
                    image: 'https://via.placeholder.com/100',
                    whenGetIT: 'after launch',
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 10,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Pills",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(2, (index) {
              return PillCard();
            }),
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
                        Expanded(child: Placeholder()),
                        Text(
                          "test",
                          style: TFonts.textTitleStyle(),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 10,
              ),
            ),
            const SizedBox(height: 16),
            getTitle(
                title: "Group",
                onTapMore: () {
                  Get.to(() => GroupScreen(), transition: Transition.fadeIn);
                }),
            const SizedBox(height: 16),
            ...List.generate(2, (index) {
              return MyGroupCard();
            }),
            const SizedBox(height: 16),
            HomeBanarasBar(images: [
              demoImage,
              demoImage,
            ]),
            const SizedBox(height: 16),
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
                  child: DoctorCard());
            }),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildReminderCard({
    required String title,
    required String subtitle,
    required String dosage,
    required bool isTaken,
  }) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isTaken ? Colors.green[50] : Colors.grey[100],
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
              const SizedBox(width: 8),
              Icon(
                isTaken ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isTaken ? Colors.green : Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyReminderCard({
    required String name,
    required String relation,
    required String title,
    required String dosage,
    required String whenGetIT,
    required String time,
    required bool isTaken,
    required String image,
  }) {
    return Container(
      width: 190,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(image),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        relation,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Icon(
                isTaken ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isTaken ? Colors.green : Colors.grey,
                size: 25,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text(
                dosage,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                whenGetIT,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
              const SizedBox(width: 8),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          )
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
