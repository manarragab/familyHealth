import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_response.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/widget/dadContainer.dart';
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
  RefreshController  refreshController=RefreshController();

FamilyController control=Get.put(FamilyController());

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
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.Profile.tr),
        body: Padding(
          padding: EdgeInsets.only(left: 16),
          child:  ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey Amira",
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.darkblue,
                    ),
                  ),
                  SizedBox(
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
              SizedBox(
                height: 25,
              ),
             Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Wrap(
        direction: Axis.vertical,
        children: [
          ...List.generate(texts.length, (index) {
            return ColoredContainer(
                text: texts[index], color: colors[index]);
          }),
        ],
      ),
    ),
   
    Stack(
     children: [
  Container(
    margin: EdgeInsets.only(bottom: 12 ),
    child: Image.asset(
            "assets/images/profileImage.png",
            fit: BoxFit.none,
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
              height:32 ,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.darkblue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: SvgPicture.asset("assets/svg/whiteCamera.svg"),
              ),
            ),
          ),
        )

     ]
      
     
    ),
    
  ],
),

              SizedBox(height: 5,),

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

   control.obx((state){
    FamilyModel fam=state;
    List<Family> list=fam.data??[];
    return  SizedBox(
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
      ),);
   }) ,

            ],
          ),
        ));
  }
}
