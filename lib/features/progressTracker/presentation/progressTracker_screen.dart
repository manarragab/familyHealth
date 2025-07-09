import 'package:abg/data/const/export.dart';
import 'package:abg/features/followUp/presentation/widget/grey_container.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';
import 'package:abg/features/progressTracker/presentation/habitBreaker_screen.dart';
import 'package:abg/features/progressTracker/presentation/habitTracker_screen.dart';
import 'package:abg/features/progressTracker/presentation/photoTracker_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgresstrackerScreen extends GetView<ProgresstrackerController>{
  int select=0;

  ProgresstrackerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.progressTracker.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing" , style: GoogleFonts.almarai(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: CustomColors.darkblue
            ),),


          ...List.generate(controller.images.length,(index){
            return GreyContainer(image: controller.images[index], title:controller.titles[index], 
            onTapped: (){
              switch(index){
                case 0:
                Get.to(const PhototrackerScreen());
                break;

                case 1:
                Get.to(const HabittrackerScreen());
                break;

                case 2:
                Get.to(const HabitbreakerScreen());
                break;

              }
            });

          }),
          ],
        ),
      ),
    );
  }



  
}