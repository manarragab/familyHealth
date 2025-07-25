import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';

class MyAccountScreen extends GetView<AuthController> {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 100;
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myAccount.tr),
      body: GetBuilder<AuthController>(builder: (logic) {
        return LoadingOverLay(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          //   File? file = await Pick.pickImage(context);
                          //   if (file != null) {
                          //     controller.updateProfileImage(file);
                          //   }
                        },
                        child: SizedBox(
                          height: height,
                          width: height,
                          child: Stack(
                            children: [
                              Container(
                                height: height,
                                width: height,
                                padding: const EdgeInsets.all(3),
                                child: CustomImage.network(
                                    controller.user?.image ?? "",
                                    fit: BoxFit.cover,
                                    borderRadius:
                                        BorderRadius.circular(height)),
                              ),
                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.green,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField.nameTextField(
                      (value) {
                        controller.postRegister.name = value;
                      },
                      hint: "full name",
                    ),
                    const SizedBox(height: 10),
                    CustomTextField.emailTextField(
                      (value) {
                        controller.postRegister.email = value;
                      },
                      readOnly: true,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField.phoneTextField(
                      (value) {
                        controller.postRegister.phone = value;
                      },
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    MainButton(
                        width: Get.width,
                        title: CustomTrans.save.tr,
                        onPressed: () {
                          controller.updateProfile();
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    MainButton(
                        width: Get.width,
                        title: CustomTrans.cancel.tr,
                        backgroundColor: CustomColors.lightGrey,
                        textColor: CustomColors.primary,
                        onPressed: () {
                          Get.back();
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
