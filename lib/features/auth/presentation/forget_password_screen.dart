import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';

class ForgetPasswordScreen extends GetView<AuthController> {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.forgetPassword.tr),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              CustomTrans.forgetPassword.tr,
              style: TFonts.textTitleStyle(),
            ),
            subtitle: Text(CustomTrans.forgetPasswordLine.tr),
          ),
          const SizedBox(height: 10),
          CustomTextField.emailTextField((value) => null,
              controller: controller.emailController),
          const SizedBox(height: 50),
          LoadingOverLay(
            showLoadingOnly: true,
            child: MainButton(
                title: "${CustomTrans.send.tr} ${CustomTrans.code.tr}",
                onPressed: () {
                  controller.getCode(moveTo: true);
                }),
          )
        ],
      ),
    );
  }
}
