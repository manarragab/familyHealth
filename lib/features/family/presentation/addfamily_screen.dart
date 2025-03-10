import 'dart:io';

import 'package:abg/data/const/export.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/widget/textField_item.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:google_fonts/google_fonts.dart';

class AddfamilyScreen extends GetView<FamilyController> {
  AddfamilyScreen({super.key});
  FormState k = FormState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.family.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Center(
              child: Text(
                "Add a family member",
                style: GoogleFonts.almarai(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.darkblue),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Form(
                key: key,
                child: ListView(
                  children: [
                    GetBuilder<FamilyController>(builder: (logic) {
                      return GestureDetector(
                        onTap: () async {
                          final pickFile = await Pick.pickImage(context);
                          if (pickFile != null) {
                            controller.postFam.image = pickFile as String?;
                            controller.update();
                          }
                        },
                        child: Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                width: 200,
                                height: 160.3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: controller.postFam.image != null
                                      ? Image.file(
                                          controller.postFam.image as File,
                                          fit: BoxFit.cover,
                                          width: 200,
                                          height: 160.3,
                                        )
                                      : Image.asset(
                                          "assets/images/cheker.png",
                                          fit: BoxFit.cover,
                                          width: 200,
                                          height: 160.3,
                                        ),
                                ),
                              ),
                            ),
                            if (controller.postFam.image == null)
                              Positioned.fill(
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/svg/camera.svg",
                                        width: 45,
                                        height: 40,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "Add Photo",
                                        style: GoogleFonts.almarai(
                                          fontSize: 16,
                                          color: CustomColors.darkBlue2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    TextfieldItem(hint: "Full Name"),
                    const SizedBox(height: 20),
                    TextfieldItem(
                      hint: "Date of birth",
                      icon: "assets/svg/clender.svg",
                    ),
                    const SizedBox(height: 20),
                    TextfieldItem(
                      hint: "phone",
                    ),
                    const SizedBox(height: 20),
                    TextfieldItem(
                      hint: "Medical record",
                      icon: "assets/svg/select.svg",
                      padding: 19,
                      tap: () {},
                    ),
                    const SizedBox(height: 20),
                    TextfieldItem(
                      hint: "Select someone",
                      icon: "assets/svg/select.svg",
                      padding: 19,
                      tap: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: MainButton(
                        onPressed: () {
                          // controller.addFamily();
                        },
                        radius: 25,
                        title: CustomTrans.Add.tr,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Center(
                      child: Text(
                        "Does he have an account?",
                        style: GoogleFonts.almarai(
                          fontSize: 20,
                          color: CustomColors.darkBlue2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
