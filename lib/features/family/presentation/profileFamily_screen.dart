import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/data/models/reminder_family/reminder_family.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/widget/dadContainer.dart';
import 'package:abg/features/family/presentation/widget/disease_card.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilefamilyScreen extends StatefulWidget {
  final String? image;
  final String? title;
  final int? age;
  final String? kind;

  ProfilefamilyScreen({
    super.key,
    this.image,
     this.title,
     this.age,
     this.kind,
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
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
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
              _buildDiseaseListForName(widget.title??""),
              const SizedBox(height: 20),
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
          Text(widget.kind.toString() ?? "Dad",
              style: GoogleFonts.almarai(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.darkblue)),
          const SizedBox(height: 15),
          Container(
            width: 200,
            height: 160,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: CustomImage.network(widget.image ?? "", fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/QR.png"),
              const SizedBox(width: 7),
              Text(widget.title??"",
                  style: GoogleFonts.almarai(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.darkblue)),
            ],
          ),
          const SizedBox(height: 5),
          Text("Age:  ${widget.age.toString() ?? "1"}  years",
              style: GoogleFonts.almarai(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.darkblue)),
          const SizedBox(height: 15),
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icons("assets/svg/chatIcon.svg"),
                InkWell(
                  onTap: () async {
                    HomeController homeControl = Get.find();
                    final remind =
                        homeControl.state.data?.familyReminders?.firstWhere(
                      (e) => e.name == widget.title,
                      orElse: () => FamilyReminders1(),
                    );

                    final Uri phoneUri =
                        Uri(scheme: 'tel', path: remind?.phone ?? "");
                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    } else {
                      Get.snackbar('Error', ('Could not launch $phoneUri'));
                    }
                  },
                  child: icons("assets/svg/phone.svg"),
                ),

                InkWell(
                  onTap: (){
                   Get.dialog(
                    AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))  ,
                      icon: CustomImage.asset("assets/images/all.png",height: 100,width: 100,),
                      content: Text("Sending a reminder notification about the medication appointment",
                      textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.darkblue)),
                  actions: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       MainButton(onPressed: (){},
                    title: "Send",
                    radius: 7,
                    width: Get.width/3.3,
                    height: 30,
                    ),
                     MainButton(onPressed: (){
                      Get.back();
                     },
                    title: "Cancel",
                    textColor: CustomColors.redd,
                    radius: 7,
                    width: Get.width/3.3,
                    backgroundColor: Colors.white,
                    borderColor: CustomColors.redd,
                    height: 30,
                    ),
                    ],
                   ),
                   SizedBox(height: 10,),
                  ],
                    )
                   ) ;
                  },
                  child: icons("assets/svg/alarmIcon.svg")),
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
      decoration: BoxDecoration(
          color: CustomColors.lighttblue2,
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SvgPicture.asset(image),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.almarai(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: CustomColors.darkblue),
    );
  }

  Widget _buildFamilyList(List<Family> list) {
    return SizedBox(
      height: 80,
      child: SmartRefresher(
        controller: refreshController,
        onRefresh: () async {
         // await control.onRefresh();
        //  refreshController.refreshCompleted();
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
                kind:widget.kind.toString() ,
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

  Widget _buildDiseaseListForName(String name) {
    HomeController controller = Get.find();

      return controller.obx((state) {
      HomeModel model = state;

      final remind = model.data?.familyReminders?.firstWhere(
        (e) => e.name == name,
      );

      if (remind == null || (remind.familyRecords?.isEmpty ?? true)) {
        return Center(child: const Text("No Diseases"));
      }

      final diseases = remind.familyRecords!
          .where((e) => (e.type ?? "").isNotEmpty)
          .map((e) => e.type!)
          .toList();

      return SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: diseases.length,
          itemBuilder: (context, index) {
            return DiseaseCard(
              disease: diseases[index],
              image: diseases[index]== MedicalType.BoneDisease.name?control.imagesDiseases[0] : 
              diseases[index]== MedicalType.BrainDisease.name?control.imagesDiseases[1] :
              diseases[index]== MedicalType.EarDisease.name?control.imagesDiseases[2] :
              diseases[index]== MedicalType.EyeDisease.name?control.imagesDiseases[3] :
              diseases[index]== MedicalType.GynecologyDisease.name?control.imagesDiseases[4] :
              diseases[index]== MedicalType.HeartDisease.name?control.imagesDiseases[5] :
             diseases[index]== MedicalType.KidneyDisease.name?control.imagesDiseases[6] :
             diseases[index]== MedicalType.LungDisease.name?control.imagesDiseases[7] :
             diseases[index]== MedicalType.MuscularDisorder.name?control.imagesDiseases[8] :
             diseases[index]== MedicalType.PillDisease.name?control.imagesDiseases[9] :
             diseases[index]== MedicalType.StomachDisease.name?control.imagesDiseases[10] :
              diseases[index]== MedicalType.LiverDisease.name?control.imagesDiseases[11] :
              diseases[index]== MedicalType.Diabetes.name?control.imagesDiseases[12] :
              diseases[index]== MedicalType.DentalDisease.name?control.imagesDiseases[13] :
              diseases[index]== MedicalType.DigestiveDisease.name?control.imagesDiseases[14] :
              diseases[index]== MedicalType.EndocrineDisorder.name?control.imagesDiseases[15] :
              diseases[index]== MedicalType.ImmuneDisorder.name?control.imagesDiseases[16] :
              diseases[index]== MedicalType.InfectiousDisease.name?control.imagesDiseases[17] :
              diseases[index]== MedicalType.NeurologicalDisorder.name?control.imagesDiseases[18] :
              diseases[index]== MedicalType.MentalHealth.name?control.imagesDiseases[19] :
              diseases[index]== MedicalType.PillDisease.name?control.imagesDiseases[20] :
              diseases[index]== MedicalType.ReproductiveDisease.name?control.imagesDiseases[21] :
              diseases[index]== MedicalType.SkinDisease.name?control.imagesDiseases[22] :
              diseases[index]== MedicalType.ThyroidDisease.name?control.imagesDiseases[23] :
              diseases[index]== MedicalType.UrinaryDisease.name?control.imagesDiseases[24] :"",


            );
          },
        ),
      );
    });
  }
}
