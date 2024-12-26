import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/auth/presentation/forget_password_screen.dart';
import 'package:abg/res/common-widgets/custom_check_box.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends GetView<AuthController> {
  LoginScreen({Key? key}) : super(key: key);
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
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CustomTrans.signIn.tr,
                        style: TFonts.textTitleStyle(
                            fontSize: 18, fontWeight: TFontWights.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        CustomTrans.toExploreOurAllTheFeatures.tr,
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
                      CustomTextField.emailTextField((value) => phone = value,
                          controller: controller.phoneController
                          //  controller:
                          ),
                      CustomPadding.heightButton,
                      CustomTextField.passwordTextField((value) => null,
                          isVisible: true,
                          changeVisible: () {},
                          controller: controller.passwordController
                          //  controller:
                          ),
                      CustomPadding.heightButton,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomCheckBox(onTap: () {}, isChecked: false),
                                const SizedBox(width: 5),
                                Text(
                                  CustomTrans.rememberMe.tr,
                                  style: TFonts.inter(color: Colors.black),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const ForgetPasswordScreen(),
                                    transition: Transition.fadeIn);
                              },
                              child: Text(
                                CustomTrans.forgotPassword.tr,
                                style: TFonts.inter(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomPadding.heightButton,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: MainButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.login();
                            }
                          },
                          title: CustomTrans.login.tr,
                          textColor: CustomColors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: CustomColors.third,
                            thickness: 1,
                          )),
                          const SizedBox(width: 10),
                          Text(CustomTrans.or.tr),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Divider(
                            color: CustomColors.third,
                            thickness: 1,
                          )),
                        ],
                      ),
                      const SizedBox(height: 15),
                      MainButton(
                        onPressed: () {},
                        title: "Sign In With google",
                        buttonWordStyle: TFonts.textTitleStyle(
                            fontWeight: TFontWights.regular),
                        backgroundColor: CustomColors.lightGrey,
                        withShadow: false,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffB3CBD8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    SvgPicture.asset("assets/svg/facebook.svg"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffB3CBD8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    "assets/svg/instegram.svg"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: const Color(0xffB3CBD8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset("assets/svg/x.svg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: CustomTrans.alreadyHaveAnAccount.tr,
                            style: TFonts.inter(
                              color: const Color(0xff636363),
                              fontSize: TFontSizes.f14,
                            ),
                            children: [
                              TextSpan(
                                text: "   ${CustomTrans.signUp.tr}   ",
                                style: TFonts.inter(
                                    color: CustomColors.secondary,
                                    fontSize: TFontSizes.f14,
                                    fontWeight: TFontWights.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(CustomPage.registerScreen);
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
              ]),
        )));
  }
}
