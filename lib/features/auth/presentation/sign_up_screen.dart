import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/res/common-widgets/custom_check_box.dart';
import 'package:abg/res/configuration/bottom_sheet/date_picker.dart';
import 'package:abg/res/configuration/image/pick_image.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:abg/res/router/pages.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends GetWidget<AuthController> {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  String? phone = '';

  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;

  final agreeTerms = false.obs;
  final agreeSubscribe = false.obs;

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
                GetBuilder<AuthController>(builder: (logic) {
                    return GestureDetector(
                      onTap: () async {
                      final pickedFile = await Pick.pickImage(context); 
                        if (pickedFile != null) {
                          controller.postRegister.image = pickedFile;
                         
                        controller.update();
                      }
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 382,
                            height: 306.17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 0.5, color: CustomColors.lightBlue2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                             child: 
                              controller.postRegister.image != null
                                  ? Image.file(controller.postRegister.image!,
                                      fit: BoxFit.cover)
                                   : Image.asset("assets/images/cheker.png",
                                          fit: BoxFit.cover),
                            ),
                          ),
                         if (controller.postRegister.image == null )
                            Positioned.fill(
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset("assets/svg/camera.svg",
                                        width: 45, height: 40),
                                    const SizedBox(height: 8),
                                    Text("Add Photo",
                                        style: GoogleFonts.almarai(
                                            fontSize: 16,
                                            color: CustomColors.darkBlue2,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
              CustomPadding.heightButton,


              CustomTextField.nameTextField(
  (value) {
    controller.postRegister.name = value;
    print("name: ${controller.postRegister.name}");
  },
  controller: controller.nameController,
),


              CustomPadding.smallHeight,
              CustomTextField.datePickerTextField(
                  controller: controller.dateController,
                isRequired: true, 
                  prefixIconPath: "assets/svg/clender.svg",
                  hint: CustomTrans.dateOfBirth.tr,
                  onDatePickerPress: () { 
                    CustomDatePicker((date) {
                      controller.postRegister.dateOfBirth = date;
                      controller.dateController.text = date.stringDate;
                      print("date: ${controller.postRegister.dateOfBirth}");
                    }).showDatePicker(context);
                  }),
              CustomPadding.smallHeight,
              CustomTextField.emailTextField(
                (value) {
                  controller.postRegister.email = value;
                },
              ),
              CustomPadding.smallHeight,
              CustomTextField.phoneTextField(
                (value) => controller.postRegister.phone = value,
              ),
              CustomPadding.smallHeight,
           
CustomTextField.selectDropDown(
  (value) {
    controller.postRegister.gender = value.toString().split('.').last;
  return  controller.genderController.text = value;
  }, 
  validator: (val){
 if(val==null){
   return "Gender is required";
 }
  },
  hint: "Gender",
  controller: controller.genderController,
  allData: Gender.values,
  getValue: (val) => val.toString().split('.').last,
 
),


                          
                                        CustomPadding.smallHeight,

              Obx(() {
                return CustomTextField.passwordTextField(
                  (value) => controller.postRegister.password = value,
                  isVisible: hidePassword.value,
                  changeVisible: () {
                    hidePassword(!(hidePassword.value));
                  },
                );
              }),
              CustomPadding.smallHeight,
              Obx(() {
                return CustomTextField.passwordTextField(
                  (value) => {
                  
                  },
                  isVisible: hideConfirmPassword.value,
                  changeVisible: () {
                    hideConfirmPassword(!(hideConfirmPassword.value));
                  },
                  validator: (value) {
                    
                    if (value == null || value.isEmpty) {
                      return CustomTrans.mustHaveValue.tr;
                    }
                    if (controller.postRegister.password != value) {
                      return CustomTrans.wrongConfirmedPassword.tr;
                    }
                    return null;
                  },
                  hint: CustomTrans.confirmPassword.tr,
                  //  controller:
                );
              }),
              CustomPadding.height,
              Obx(() {
                return checkboxListTile(
                  value: agreeTerms.value,
                  onChanged: () {
                    agreeTerms(!agreeTerms.value);
                  },
                  title: CustomTrans.agreeToTermAndConditions.tr,
                );
              }),
              Obx(() {
                return checkboxListTile(
                  value: agreeSubscribe.value,
                  onChanged: () {
                    agreeSubscribe(!agreeSubscribe.value);
                  },
                  title: CustomTrans.subscribeOurNewsletter.tr,
                );
              }),
              CustomPadding.heightButton,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MainButton(
                  width: 100,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (!agreeTerms.value) {
                        showToast(
                            "${CustomTrans.needToAccept.tr} ${CustomTrans.termsAndConditions.tr}",
                            MessageErrorType.error);
                        return;
                      } else if (!agreeSubscribe.value) {
                        showToast(
                            "${CustomTrans.needToAccept.tr} ${CustomTrans.subscribeOurNewsletter.tr}",
                            MessageErrorType.error);
                        return;
                      }
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
                        text: "${CustomTrans.login.tr}   ",
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
