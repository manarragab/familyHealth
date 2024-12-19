import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/res/common-widgets/custom_check_box.dart';
import 'package:abg/res/common-widgets/custom_logo.dart';
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
      appBar: CustomAppBar.appBar(CustomTrans.signUp.tr),
      body: LoadingOverLay(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            children: [
              const Center(
                child: CustomLogo(height: 56, width: 148),
              ),
              const SizedBox(height: 20),
              Text(
                CustomTrans.registerLine.tr,
                style: TFonts.textTitleStyle(
                    fontSize: 16, fontWeight: TFontWights.regular),
              ),
              CustomPadding.heightButton,
              CustomTextField.emailTextField((value) => phone = value,
                  controller: controller.phoneController
                  //  controller:
                  ),
              CustomPadding.height,
              CustomTextField.passwordTextField((value) => null,
                  isVisible: true,
                  changeVisible: () {},
                  controller: controller.passwordController
                  //  controller:
                  ),
              CustomPadding.height,
              CustomTextField.passwordTextField((value) => null,
                  isVisible: true,
                  changeVisible: () {},
                  hint: CustomTrans.confirmPassword.tr,
                  controller: controller.passwordController
                  //  controller:
                  ),
              CustomPadding.height,
              CustomTextField.dynamicTextField((value) => null,
                  hint: CustomTrans.invitationCode.tr,
                  suffixIcon: SvgPicture.asset("assets/svg/partner.svg")),
              CustomPadding.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    CustomCheckBox(onTap: () {}, isChecked: false),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: CustomTrans.termsAndConditionsFirstLine.tr,
                          style: TFonts.inter(
                            color: Colors.black,
                            fontSize: TFontSizes.f14,
                          ),
                          children: [
                            TextSpan(
                              text: "   ${CustomTrans.terms.tr}   ",
                              style: TFonts.inter(
                                  color: CustomColors.primary,
                                  fontSize: TFontSizes.f14,
                                  fontWeight: TFontWights.bold),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: " ${CustomTrans.and.tr} ",
                              style: TFonts.inter(
                                  color: CustomColors.black,
                                  fontSize: TFontSizes.f14,
                                  fontWeight: TFontWights.bold),
                            ),
                            TextSpan(
                              text: "   ${CustomTrans.conditions.tr}   ",
                              style: TFonts.inter(
                                  color: CustomColors.primary,
                                  fontSize: TFontSizes.f14,
                                  fontWeight: TFontWights.bold),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomPadding.heightButton,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MainButton(
                  width: 100,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
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
                            color: CustomColors.primary,
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
}
