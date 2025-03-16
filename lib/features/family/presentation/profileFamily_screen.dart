import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_response.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/widget/dadContainer.dart';
import 'package:abg/features/family/presentation/widget/disease_card.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfilefamilyScreen extends StatefulWidget {
  final String? image;
  ProfilefamilyScreen({
    super.key,
    this.image,
  });

  @override
  State<ProfilefamilyScreen> createState() => _ProfilefamilyScreenState();
}

class _ProfilefamilyScreenState extends State<ProfilefamilyScreen> {
  RefreshController refreshController = RefreshController();
  FamilyController control = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.family.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: control.obx((state) {
          FamilyModel fam = state;
          List<Family> list = fam.data ?? [];
          return ListView(
            children: [
              _buildHeader(),
                                  const SizedBox(height: 20),

                Container(
                      width: double.infinity,
                      height: 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.5),
                        color: CustomColors.grey4,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2),
                            blurRadius: 4, 
                            offset:
                                const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
              _buildTitle("Reminders"),
              _buildFamilyList(list),
              const SizedBox(height: 12),
              _buildMedicalRecordTitle(),
              const SizedBox(height: 12),
              _buildDiseaseList(),
               const SizedBox(height: 50),
               Image.asset("assets/images/health.png")

            ],
          );
        }),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          Text("My Dad", style: GoogleFonts.almarai(fontSize: 20, fontWeight: FontWeight.w400, color: CustomColors.darkblue)),
          const SizedBox(height: 15),
          Container(
            width: 200,
            height: 160,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(widget.image ?? "", fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/QR.png"),
              const SizedBox(width: 7),
              Text("Omar Ahmed", style: GoogleFonts.almarai(fontSize: 16, fontWeight: FontWeight.w700, color: CustomColors.darkblue)),
            ],
          ),
          const SizedBox(height: 5),
          Text("Age: 50 year", style: GoogleFonts.almarai(fontSize: 12, fontWeight: FontWeight.w400, color: CustomColors.darkblue)),
          const SizedBox(height: 15),
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icons("assets/svg/chatIcon.svg"),
                icons("assets/svg/phone.svg"),
                icons("assets/svg/alarmIcon.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget icons(String image) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(color: CustomColors.lighttblue2, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SvgPicture.asset(image),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.almarai(fontSize: 18, fontWeight: FontWeight.w700, color: CustomColors.darkblue),
    );
  }

  Widget _buildFamilyList(List<Family> list) {
    return SizedBox(
      height: 80,
      child: SmartRefresher(
        controller: refreshController,
        onRefresh: () async {
          await control.onRefresh();
          refreshController.refreshCompleted();
        },
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            Family info = list[index];
            return Container(
              width: 145,
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
  }

  Widget _buildMedicalRecordTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitle("Medical record"),
        _buildTitle("More"),
      ],
    );
  }

  Widget _buildDiseaseList() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: control.disease.length,
        itemBuilder: (context, index) {
          return DiseaseCard(
            disease: control.disease[index],
            image: control.images[index],
          );
        },
      ),
    );
  }
}
