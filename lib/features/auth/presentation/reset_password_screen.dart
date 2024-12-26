import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';

class ResetPasswordScreen extends GetView<AuthController> {
  const ResetPasswordScreen(this.code, {Key? key}) : super(key: key);
  final String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarLogo(displayLogo: false),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              CustomTrans.resetPassword.tr,
              style: TFonts.textTitleStyle(),
            ),
            subtitle: Text(CustomTrans.enterTheNewPassword.tr),
          ),
          const SizedBox(height: 10),
          CustomTextField.passwordTextField(
            (value) => null,
            controller: controller.passwordController,
            isVisible: false,
            changeVisible: () {},
          ),
          CustomTextField.passwordTextField((value) => null,
              isVisible: true,
              changeVisible: () {},
              hint: CustomTrans.confirmPassword.tr,
              controller: controller.passwordController
              //  controller:
              ),
          const SizedBox(height: 20),
          LoadingOverLay(
            showLoadingOnly: true,
            child: MainButton(
                title: CustomTrans.done.tr,
                onPressed: () {
                  controller.setPassword(code);
                }),
          )
        ],
      ),
    );
  }
}
