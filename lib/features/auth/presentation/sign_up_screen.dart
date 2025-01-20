import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/res/common-widgets/custom_check_box.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends GetView<AuthController> {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  String? phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarLogo(),
      body: LoadingOverLay(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            children: [
              Text(
                CustomTrans.signUp.tr,
                style: TFonts.textTitleStyle(
                    fontSize: 18, fontWeight: TFontWights.bold),
              ),
              const SizedBox(height: 10),
              Text(
                CustomTrans.ifYouDontHaveAnyAccount,
                style: TFonts.textTitleStyle(
                    fontSize: 16, fontWeight: TFontWights.regular),
              ),
              const SizedBox(height: 10),
              Text(
                CustomTrans.signInNow.tr,
                style: TFonts.textTitleStyle(
                    fontSize: 16, fontWeight: TFontWights.regular),
              ),
              CustomPadding.heightButton,
              CustomTextField.nameTextField((value) {},
                  controller: controller.nameController
                  //  controller:
                  ),
              CustomPadding.smallHeight,
              CustomTextField.emailTextField((value) {},
                  controller: controller.emailController
                  //  controller:
                  ),
              CustomPadding.smallHeight,
              CustomTextField.phoneTextField((value) => phone = value,
                  controller: controller.phoneController
                  //  controller:
                  ),
              CustomPadding.smallHeight,
              CustomTextField.passwordTextField((value) => null,
                  isVisible: true,
                  changeVisible: () {},
                  controller: controller.passwordController
                  //  controller:
                  ),
              CustomPadding.smallHeight,
              CustomTextField.passwordTextField(
                (value) => null,
                isVisible: true,
                changeVisible: () {},
                validator: (value) {
                  if (controller.passwordController.text != value) {
                    return CustomTrans.wrongConfirmedPassword.tr;
                  }
                  return null;
                },
                hint: CustomTrans.confirmPassword.tr,
                //  controller:
              ),
              CustomPadding.height,
              checkboxListTile(
                value: false,
                onChanged: () {},
                title: CustomTrans.agreeToTermAndConditions.tr,
              ),
              checkboxListTile(
                value: false,
                onChanged: () {},
                title: CustomTrans.subscribeOurNewsletter.tr,
              ),
              CustomPadding.heightButton,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MainButton(
                  width: 100,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.register();
                    }
                  },
                  title: CustomTrans.signUp.tr,
                  textColor: CustomColors.white,
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: CustomTrans.alreadyHaveAnAccount.tr,
                    style: TFonts.inter(
                      color: const Color(0xff636363),
                      fontSize: TFontSizes.f16,
                    ),
                    children: [
                      TextSpan(
                        text: "   ${CustomTrans.login.tr}   ",
                        style: TFonts.inter(
                            color: CustomColors.secondary,
                            fontSize: TFontSizes.f16,
                            fontWeight: TFontWights.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(CustomPage.loginPage);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkboxListTile({
    required bool value,
    required Null Function() onChanged,
    required String title,
  }) {
    return InkWell(
      onTap: onChanged,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            CustomCheckBox(
              onTap: onChanged,
              isChecked: value,
            ),
            const SizedBox(width: 10),
            Text(title)
          ],
        ),
      ),
    );
  }
}
