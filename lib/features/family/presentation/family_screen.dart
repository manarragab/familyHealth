import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/profileFamily_screen.dart';
import 'package:abg/features/family/presentation/widget/familyType_container.dart';
import 'package:abg/features/home/presentation/widget/family_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../data/models/family/post_family/post_family_response.dart';

class FamilyScreen extends StatefulWidget {
  const FamilyScreen({super.key});

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  RefreshController refreshController = RefreshController();
  FamilyController control = Get.find();
  int selectedIndex = 0;
  late FamilyModel model;

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myFamily.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: control.obx((state) {
          model = state;
          List<Family> list=model.data??[];

          return ListView(
            children: [
              _buildFamilyTypeGrid(),
              const SizedBox(height: 14),
              _buildImageStack(),
              const SizedBox(height: 17),
              _buildinfoersTitle(),
              const SizedBox(height: 10),
              _buildFamilyList(list),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildFamilyTypeGrid() {
    return SizedBox(
      height: 100,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 40,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
        ),
        itemCount: FamilyType.values.length,
        itemBuilder: (context, index) {
          return FamilytypeContainer(
            index: index,
            tapped: () => setState(() => selectedIndex = index),
          );
        },
      ),
    );
  }

  Widget _buildImageStack() {
    return Stack(
      children: [
        _buildImageContainer(),
        _buildActionButtons(),
        _buildImageLabel(),
      ],
    );
  }

  Widget _buildImageContainer() {
    return Container(
     clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: InkWell(
        onTap: (){
          Get.to(ProfilefamilyScreen(image: _getImagePath(selectedIndex), title: FamilyType.values[selectedIndex].name,));
        },
        child: Image.asset(_getImagePath(selectedIndex), fit: BoxFit.cover)),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircleIcon("assets/svg/whiteCamera.svg"),
          _buildCircleIcon("assets/svg/whiteFolder.svg"),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(String assetPath) {
    return Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        color: CustomColors.darkpinky,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(assetPath),
      ),
    );
  }

  Widget _buildImageLabel() {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Text(
              FamilyType.values[selectedIndex].name,
              style: GoogleFonts.almarai(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: CustomColors.lighttblue,
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: CustomColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildinfoersTitle() {
    return Text(
      "Reminders",
      style: GoogleFonts.almarai(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: CustomColors.darkblue,
      ),
    );
  }

  Widget _buildFamilyList(List<Family> list) {
    return SizedBox(
      height: 132,
      child: SmartRefresher(
        controller: refreshController,
        onRefresh: () async {
          await control.onRefresh();
          refreshController.refreshCompleted();
        },
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            Family info = list[index];
            return Container(
              width: 150,
              margin: const EdgeInsets.all(8),
              child: FamilyContainer(
                index: index,
                name: info.name ?? "",
                relation: info.relative ?? "",
                title: info.name ?? "",
                dosage: "Not found",
              //  time: info.createdAt ?? "",
                image: info.image ?? "",
                whenGetIT: 'After lunch',
              ),
            );
          },
        )
      ),
    );

    
  }
  
  String _getImagePath(int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        return "assets/images/nono1.png";
      case 2:
        return "assets/images/grandMother.png";
      case 3:
        return "assets/images/nono2.png";
      case 4:
        return "assets/images/boyy.png";
      case 5:
        return "assets/images/girll.png";
      default:
        return "assets/images/cheker.png";
    }
  }
}
