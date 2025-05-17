import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/data/const/export.dart';

class DotsbarItem extends StatelessWidget {

//this KEY for separate all calling of dotsBar => every call has its own different key 
//لحل مشكلة ارتباط كل DotsbarItem بنفس currentStep،

  final int totalSteps;   
  final int step;
  final String id;

  DotsbarItem({
    Key? key,
    required this.step,
    required this.id,
  }) : totalSteps = (id == 'calorie') ? 5 :(id == 'ibs') ? 4: 7;  

  @override
  Widget build(BuildContext context) {

    return GetBuilder<Calculationcontroller>(
      id: id,

      builder: (controller) {
        return Row(
          children: List.generate(totalSteps * 2 - 1, (index) {
           
            bool isActive = index== step*2-1 ;
            bool isCompleted = index<step*2-1 ;

            return index.isEven
                ? Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted || isActive ? CustomColors.green1 : CustomColors.grey6,
                  ),
                  child: Center(
                    child: Container(
                      width: 7.5,
                      height: 7.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCompleted || isActive ? CustomColors.darkblue3 : CustomColors.darkblue4,
                      ),
                    ),
                  ),
                )
                : Expanded(
                    child: Container(
                      height: 3.71,
                      color: isCompleted ? CustomColors.green1 : CustomColors.grey13,
                    ),
                  );
          }),
        );
      },
    );
  }
}
