import 'package:abg/data/const/export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';

class White4container extends StatelessWidget {
  final String id;
  final String? title;
  final String? txt1;
  final String? txt2;

  const White4container({
    super.key,
    required this.id,
    this.title,
    this.txt1,
    this.txt2,
  });

  @override
  Widget build(BuildContext context) {
    final calc = Get.find<Calculationcontroller>();

    return GetBuilder<Calculationcontroller>(
      id: id,
      builder: (_) {
        return Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "Are you taking high blood pressure medication?",
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
                    text: txt1 ?? "Yes",
                    selected: calc.selectedRadio == (txt1 ?? "Yes"),
                    onTap: () => _handleSelection(txt1 ?? "Yes", true),
                  ),
                  _radioOption(
                    text: txt2 ?? "No",
                    selected: calc.selectedRadio == (txt2 ?? "No"),
                    onTap: () => _handleSelection(txt2 ?? "No", false),
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

  
  void _handleSelection(String text, bool isSelected) {
    final calc = Get.find<Calculationcontroller>();
    calc.selecting(text, id, isSelected);
    print("texttttttttttttttt ${calc.selectedRadio}");
  }

}
