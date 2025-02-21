import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/auth/domain/controller/otp_controller.dart';
import 'package:abg/features/auth/presentation/otp_confirmation_view.dart';
import 'package:abg/features/auth/presentation/reset_password_screen.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';

class ForgetPasswordScreen extends GetView<AuthController> {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarLogo(displayLogo: false),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            CustomTrans.forgetPassword.tr,
            style: TFonts.textTitleStyle(
                fontSize: 18, fontWeight: TFontWights.bold),
          ),
          const SizedBox(height: 10),
          Text(
            CustomTrans.toCreateNewPasswordPlease.tr,
            style: TFonts.textTitleStyle(
                fontSize: 16, fontWeight: TFontWights.regular),
          ),
          const SizedBox(height: 10),
          Text(
            CustomTrans.followTheInstruction.tr,
            style: TFonts.textTitleStyle(
                fontSize: 16, fontWeight: TFontWights.regular),
          ),
          CustomPadding.heightButton,
          CustomTextField.emailTextField((value) => null,
              controller: controller.emailController),
          const SizedBox(height: 50),
          LoadingOverLay(
            showLoadingOnly: true,
            child: MainButton(
                title: CustomTrans.getCode.tr,
                onPressed: () {
                  Get.to(() => OtpConfirmationView(getCode: (code) {
                        Get.to(() => const ResetPasswordScreen("1234"));
                      }, resendCode: () {
                        Get.put(OTPController()).startCount();
                      }));

                  // controller.getCode(moveTo: true);
                }),
          )
        ],
      ),
    );
  }
}
