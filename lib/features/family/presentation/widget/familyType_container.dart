import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/myfamily_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FamilytypeContainer extends GetWidget<FamilyController>{
  final int index;
final VoidCallback tapped;
  const FamilytypeContainer( {super.key, required this.index ,required this.tapped,});
  @override
  Widget build(BuildContext context) {
    return Obx((){
  bool isSelected=controller.isSelect.value==index;
      return GestureDetector(
        onTap: (){
          controller.selected(index);
            tapped();
            
         if (index == 0){
       Get.to(MyfamilyScreen());
            }
        },
        child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        height: 40,     
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:isSelected? CustomColors.primary: CustomColors.white1,
            border:isSelected==false? Border.all(color: CustomColors.lighttblue1, width: 2) : null),
        child: Center(
          child: Text(FamilyType.values[index].name , style: GoogleFonts.almarai(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:isSelected? Colors.white: CustomColors.lighttblue1,
          ),),
        ),
            
            ),
      );
    }) ;
  }
}
