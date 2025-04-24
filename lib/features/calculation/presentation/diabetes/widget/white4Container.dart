import 'package:abg/data/const/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';

class White4container extends StatelessWidget {
  final String id;
  const White4container({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final calc = Get.find<Calculationcontroller>();

    return GetBuilder<Calculationcontroller>(
      id: id,
      builder: (_) {
        final bool selectedYes = calc.selectedRadio == "Yes";
        final bool selectedNo = calc.selectedRadio == "No";


        return Container(
          width: Get.width,
          height: 92,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Are you taking high blood pressure medication?",
                style: TFonts.inter(
                  color: CustomColors.darkblack1,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _radioOption(
                    text: "Yes",
                    selected: selectedYes,
                    onTap: () {
                      calc.selecting("Yes", id , true);
                
                    },
                  ),
                  _radioOption(
                    text: "No",
                    selected: selectedNo,
                    onTap: () {
                      calc.selecting("No", id , false );
                    
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _radioOption({
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CustomImage.asset(
            selected ? "assets/svg/checked.svg" : "assets/svg/uncheck.svg",
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TFonts.inter(
              color: CustomColors.darkblack1,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
