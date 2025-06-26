import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_response.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/widget/dadContainer.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
class TodatactivityScreen extends GetView<FamilyController> {
  final String name;
  final String kind;
  const TodatactivityScreen({Key? key, required this.name, required this.kind}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FamilyController>();

    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.family.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: controller.obx((state) {
          FamilyModel fam = state;
          List<Family> list = fam.data ?? [];
          
          return ListView(
            children: [
              Center(
                child: Text(
                  kind,
                  style: GoogleFonts.almarai(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.darkblue,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Image.asset("assets/images/drugs.png"),
              const SizedBox(height: 10),
              Text(
                "120/80 is considered “normal” or healthy blood pressure.",
                style: GoogleFonts.almarai(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.darkblue,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Today",
                style: GoogleFonts.almarai(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.darkblue,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Medicine",
                    style: GoogleFonts.almarai(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.darkblue,
                    ),
                  ),
                  Container(
                    width: 173,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: CustomColors.primary,
                    ),
                    child: Center(
                      child: Text(
                       name,
                        style: GoogleFonts.almarai(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: CustomColors.white2,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 60,
                  mainAxisSpacing: 3,
                   

                ),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Family data = list[index];
                  return Dadcontainer(
                    name: data.name ?? "",
                   // kind: "500mg",
                    time: '1:20pm',
                    index: index,
                    icon: index==1? "assets/svg/pinkSign.svg": null,
                  );
                },
              ),

              SizedBox(height: 15,),

              Image.asset("assets/images/health.png"),
            ],
          );
        }),
      ),
    );
  }
}
