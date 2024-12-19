import 'package:abg/data/const/export.dart';
import 'package:abg/res/configuration/bottom_sheet/date_picker.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        CustomTrans.filter.tr,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: CustomTextField.datePickerTextField(
                    prefixIconPath: "",
                    onDatePickerPress: () {
                      CustomDatePicker((date) {
                        sPrint.info('date::: ${date.toString()}');
                      }).showDatePicker(context);
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
