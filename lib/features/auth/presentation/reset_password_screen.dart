import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';

class ResetPasswordScreen extends GetView<AuthController> {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarLogo(displayLogo: false),
      body: Form(
        key: formKey,
        child: ListView(
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
            Obx(() {
              return CustomTextField.passwordTextField(
                (value) => controller.postRegister.password = value,
                isVisible: hidePassword.value,
                changeVisible: () {
                  hidePassword(!hidePassword.value);
                },
              );
            }),
            const SizedBox(height: 10),
            Obx(() {
              return CustomTextField.passwordTextField(
                (value) => null,
                isVisible: hideConfirmPassword.value,
                validator: (value) {
                  if (controller.postRegister.password != value) {
                    return CustomTrans.wrongConfirmedPassword.tr;
                  }
                  return null;
                },
                changeVisible: () {
                  hideConfirmPassword(!hideConfirmPassword.value);
                },
                hint: CustomTrans.confirmPassword.tr,

                //  controller:
              );
            }),
            const SizedBox(height: 20),
            LoadingOverLay(
              showLoadingOnly: true,
              child: MainButton(
                  title: CustomTrans.done.tr,
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      controller.setPassword();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
