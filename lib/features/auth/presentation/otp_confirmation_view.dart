import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/auth/domain/controller/otp_controller.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:pinput/pinput.dart';

class OtpConfirmationView extends GetView<OTPController> {
  OtpConfirmationView(
      {required this.getCode, required this.resendCode, Key? key})
      : super(key: key);
  String otp = '';
  Function(String) getCode;
  Function resendCode;

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<AuthController>();
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.verificationCode.tr),
      body: LoadingOverLay(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    CustomTrans.verificationCode.tr,
                    style: TFonts.textTitleStyle(),
                  ),
                  subtitle: Text(CustomTrans.enterVerificationCodeLine.tr),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: 5,
                    keyboardType: TextInputType.text,
                    defaultPinTheme: PinTheme(
                      width: 48,
                      height: 48,
                      textStyle: TextStyle(
                          fontSize: 20,
                          color: CustomColors.primary,
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                    ),
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    submittedPinTheme: PinTheme(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    showCursor: true,
                    onChanged: (value) {
                      otp = value;
                    },
                    onCompleted: (value) => getCode(value),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MainButton(
                    onPressed: () async {
                      // widget.controller.incrementCurrentStep();

                      if (otp.isNotEmpty) {
                        getCode(otp);
                      } else {
                        showToast(CustomTrans.please_enter_otp.tr,
                            MessageErrorType.error);
                      }
                    },
                    textColor: CustomColors.white,
                    title: CustomTrans.verify.tr),
                SizedBox(
                  height: 20.h,
                ),
                GetBuilder<OTPController>(builder: (controller) {
                  return SizedBox(
                      //height: 50.h,
                      width: Get.width,
                      child: Column(
                        children: [
                          Text(
                            CustomTrans.send_verification.tr,
                            textAlign: TextAlign.center,
                            style: TFonts.textTitleStyle(
                              color: CustomColors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                              child: Text(
                            "${controller.counter} ${CustomTrans.secondes.tr}",
                            textAlign: TextAlign.center,
                            style: TFonts.textTitleStyle(
                              color: CustomColors.grey,
                              fontSize: 14,
                            ),
                          )),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 110.w,
                            height: 40.h,
                            child: MainButton(
                              onPressed: () async {
                                if (controller.counter == 0) {
                                  resendCode();
                                }
                              },
                              title: CustomTrans.send,
                              textColor: Colors.white,
                              backgroundColor: controller.counter == 0
                                  ? CustomColors.primary
                                  : CustomColors.grey4,
                            ),
                          ),
                        ],
                      ));
                }),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 50.h,
                  width: Get.width,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: CustomColors.accentLight,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        CustomTrans.cancel,
                        style: TFonts.textTitleStyle(
                          color: CustomColors.grey,
                          fontSize: 14,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
