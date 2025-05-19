import 'package:abg/data/const/export.dart';
import 'package:flutter/widgets.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';

class QuestionsItem extends GetView<Calculationcontroller> {
  final bool? value;
  final ValueChanged<bool?> onChanged;
  final String question;

  const QuestionsItem({
    super.key,
    required this.question,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TFonts.almarai(
              fontSize: 12.w,
              color: CustomColors.darkblue3,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: ()=> onChanged(true),
                child: Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: value,
                      onChanged: onChanged,
                    ),
                    const Text('Yes'),
                  ],
                ),
              ),
              InkWell(
                onTap: ()=> onChanged(false),
                child: Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: value,
                      onChanged: onChanged,
                    ),
                    const Text('No'),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
