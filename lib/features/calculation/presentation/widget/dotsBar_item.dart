import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/data/const/export.dart';

class DotsbarItem extends StatelessWidget {

//this KEY for separate all calling of dotsBar => every call has its own different key 
//لحل مشكلة ارتباط كل DotsbarItem بنفس currentStep،

 final String KEY;
  final int totalSteps;

  DotsbarItem({super.key, required this.KEY}) :
   totalSteps = (KEY == "diabetes1"|| KEY =="diabetes2"|| KEY =="diabetes3" ||
    KEY =="diabetes4"||KEY =="diabetes5"  )? 7 : 5;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(
      builder: (controller) {
        int currentStep = controller.getstep(KEY); 
        return Row(
          children: List.generate(totalSteps * 2 - 1, (index) {
            int stepIndex = index ~/ 2;
            bool isActive = stepIndex == currentStep;
            bool isCompleted = stepIndex < currentStep;

            return index.isEven
                ? GestureDetector(
                    onTap: () {
                      controller.updateStep(KEY, stepIndex);
                      controller.update([KEY]);
                    },
                    child: Container(
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
