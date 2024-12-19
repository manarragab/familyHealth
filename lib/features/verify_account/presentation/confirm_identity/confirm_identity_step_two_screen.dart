import 'package:abg/data/const/export.dart';
import 'package:abg/features/verify_account/presentation/confirm_identity/widget/identity_step_widget.dart';
import 'package:abg/features/verify_account/presentation/success_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';

import 'widget/profile_picture_step_widget.dart';

class ConfirmIdentity extends StatelessWidget {
  ConfirmIdentity({Key? key}) : super(key: key);
  final List<String> steps = [
    CustomTrans.identityStep.tr,
    CustomTrans.verificationStep.tr,
    CustomTrans.confirmationStep.tr,
  ];

  var activeStep = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        CustomTrans.identityVerification.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                CustomTrans.improveAccountSecurity.tr,
                style: TFonts.textTitleStyle(
                    fontSize: 14, fontWeight: TFontWights.medium),
              ),
              const SizedBox(height: 10),
              EasyStepper(
                  activeStep: activeStep,
                  stepShape: StepShape.rRectangle,
                  stepBorderRadius: 15,
                  borderThickness: 2,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  stepRadius: 28,
                  finishedStepBorderColor: Colors.transparent,
                  finishedStepTextColor: Colors.transparent,
                  finishedStepBackgroundColor: Colors.transparent,
                  activeStepIconColor: Colors.transparent,
                  activeStepBackgroundColor: Colors.transparent,
                  activeStepBorderColor: Colors.transparent,
                  activeStepTextColor: Colors.transparent,
                  unreachedStepBackgroundColor: Colors.transparent,
                  finishedStepIconColor: Colors.transparent,
                  unreachedStepBorderColor: Colors.transparent,
                  unreachedStepIconColor: Colors.transparent,
                  unreachedStepTextColor: Colors.transparent,
                  showLoadingAnimation: false,
                  steps: steps
                      .asMap()
                      .entries
                      .toList()
                      .map(
                        (e) => EasyStep(
                          customStep: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CircleAvatar(
                                backgroundColor: e.key < activeStep
                                    ? Colors.green.withOpacity(0.5)
                                    : Colors.grey.withOpacity(0.5),
                                foregroundColor: Colors.white,
                                child: CircleAvatar(
                                  maxRadius: 12,
                                  backgroundColor: e.key < activeStep
                                      ? Colors.green.withOpacity(0.7)
                                      : Colors.grey.withOpacity(0.7),
                                  child: e.key < activeStep
                                      ? const Icon(Icons.check,
                                          size: 15, color: Colors.white)
                                      : Text((e.key + 1).toString(),
                                          style: TFonts.cardBody(
                                            fontSize: 12,
                                          )),
                                )),
                          ),
                          customTitle: Text(
                            e.value,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                      .toList(),
                  onStepReached: (index) {}),
              getBody(activeStep),
              const SizedBox(height: 10),
              MainButton(title: CustomTrans.next.tr, onPressed: () {}),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(int activeStep) {
    switch (activeStep) {
      case 0:
        return const IdentityStepWidget();
      case 1:
        return const ProfilePictureStepWidget();
      case 2:
        return const SuccessWidget();
      default:
        return Container();
    }
  }
}
