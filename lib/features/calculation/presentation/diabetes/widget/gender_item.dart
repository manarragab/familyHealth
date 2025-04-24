import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/res/configuration/fonts.dart';
import 'package:flutter/widgets.dart';

class GenderItem extends GetWidget<Calculationcontroller> {
  final String id;
  const GenderItem( {required this.id, super.key});
  
  @override
 Widget build(BuildContext context) {
  return GetBuilder<Calculationcontroller>(
    id: id,
    builder: (_) {
      final bool maleSel   = controller.selectt == "male";
      final bool femaleSel = controller.selectt == "female";


      return Padding(
        padding: const EdgeInsets.symmetric(horizontal:0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            genderBox(
              label: "Male",
              asset: "assets/images/male.png",
              selected: maleSel,
              onTap: () {
                controller.selectGender("male" , id);
             
                
              },
            ),
            genderBox(
              label: "Female",
              asset: "assets/images/female.png",
              selected: femaleSel,
              onTap: () {
                controller.selectGender("female" , id);
              }
            ),
          ],
        ),
      );
    },
  );
}
}

      Widget genderBox({
        required String label,
        required String asset,
        required bool selected,
        required VoidCallback onTap,
      }) =>
          GestureDetector(
            onTap: onTap,
            child: Column(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(asset),
                       
                        opacity: selected ? 0.5 : 1.0, 
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  label,
                  style: TFonts.inter(
                    color: CustomColors.darkblack1,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
