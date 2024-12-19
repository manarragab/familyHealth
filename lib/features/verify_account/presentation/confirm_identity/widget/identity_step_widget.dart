import 'package:abg/data/const/export.dart';
import 'package:abg/res/common-widgets/custom_check_box.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';

class IdentityStepWidget extends StatelessWidget {
  const IdentityStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (true) {
      return Column(
        children: [
          Center(
            child: Image.asset(
              "assets/images/id-card@2x.png",
              height: 200,
            ),
          ),
          /*    Center(
            child: Text(CustomTrans.captureIDPhoto.tr),
          ),*/
          const SizedBox(height: 20),
          MainButton(
              width: 200,
              widget: SvgPicture.asset("assets/svg/camera.svg"),
              onPressed: () {}),
          const SizedBox(height: 20),
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                CustomTrans.uploadIDInstructions.tr,
                style: TFonts.textTitleStyle(),
              )),
          const SizedBox(height: 10),
          ...[
            CustomTrans.ensureIDVisibility.tr,
            CustomTrans.avoidShadowsAndReflections.tr,
            CustomTrans.takeFlatPhoto.tr,
            CustomTrans.clearPhoto.tr
          ].map((e) {
            return ListTile(
              minVerticalPadding: 0.0,
              minTileHeight: 30,
              leading: SvgPicture.asset("assets/svg/check.svg"),
              minLeadingWidth: 0.0,
              title: Text(
                e,
                style: TFonts.textTitleStyle(
                  fontSize: 16,
                  fontWeight: TFontWights.medium,
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 10),
        ],
      );
    }
    return Column(
      children: [
        CustomTextField.dropDownTextField(
          onDropDownPress: () {},
          hint: CustomTrans.country.tr,
        ),
        const SizedBox(height: 20),
        ListTile(
          minVerticalPadding: 0.0,
          minTileHeight: 30,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0.0,
          title: Text(CustomTrans.idCard.tr),
          leading: CustomCheckBox(onTap: () {}),
          onTap: () {},
        ),
        ListTile(
          minVerticalPadding: 0.0,
          minTileHeight: 30,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0.0,
          title: Text(CustomTrans.passport.tr),
          leading: CustomCheckBox(onTap: () {}),
          onTap: () {},
        ),
        ListTile(
          minVerticalPadding: 0.0,
          minTileHeight: 30,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0.0,
          title: Text(CustomTrans.driversLicense.tr),
          leading: CustomCheckBox(onTap: () {}),
          onTap: () {},
        ),
      ],
    );
  }
}
