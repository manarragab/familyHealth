import 'package:abg/data/const/export.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';

class BasicDataWidget extends StatelessWidget {
  const BasicDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField.nameTextField((value) {},
            hint: CustomTrans.firstName.tr),
        const SizedBox(height: 10),
        CustomTextField.nameTextField((value) {},
            hint: CustomTrans.lastName.tr),
        const SizedBox(height: 10),
        CustomTextField.datePickerTextField(
            prefixIconPath: "assets/svg/date.svg", onDatePickerPress: () {}),
        const SizedBox(height: 10),
        CustomTextField.dynamicTextField((value) {},
            hint: CustomTrans.gender.tr),
        const SizedBox(height: 10),
        CustomTextField.dropDownTextField(
          onDropDownPress: () {},
          hint: CustomTrans.country.tr,
        ),
        const SizedBox(height: 10),
        CustomTextField.dropDownTextField(
          onDropDownPress: () {},
          hint: CustomTrans.government.tr,
        ),
        const SizedBox(height: 10),
        CustomTextField.dropDownTextField(
          onDropDownPress: () {},
          hint: CustomTrans.city.tr,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
