import 'package:abg/data/const/export.dart';
import 'package:abg/features/verify_account/presentation/confirm_identity/confirm_identity_step_two_screen.dart';

class MainVerifyAccountScreen extends StatelessWidget {
  const MainVerifyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.requiredData.tr),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            children: [
              Text(
                CustomTrans.mainVerifyTitle.tr,
                style: TFonts.textTitleStyle(
                  fontWeight: TFontWights.medium,
                  fontSize: 14,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: const Color(0xffFAB8B8),
                  child: SvgPicture.asset(
                    'assets/svg/Combined-Shape.svg',
                    height: 20,
                  ),
                ),
                title: Text(CustomTrans.completeTheBasicInformation.tr),
                subtitle: Text(CustomTrans.enterYourRequiredPersonalData.tr),
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsetsDirectional.only(start: 18),
                child: Container(
                  width: 3,
                  height: 10,
                  color: CustomColors.red,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsetsDirectional.only(start: 18),
                child: Container(
                  width: 3,
                  height: 10,
                  color: CustomColors.red,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsetsDirectional.only(start: 18),
                child: Container(
                  width: 3,
                  height: 10,
                  color: CustomColors.red,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: const Color(0xffFAB8B8),
                  child: SvgPicture.asset(
                    'assets/svg/memo-circle-check.svg',
                    height: 20,
                  ),
                ),
                title: Text(CustomTrans.confirmIdentity.tr),
                subtitle: Text(CustomTrans
                    .uploadYourIdentityDocumentsToConfirmTheAccount.tr),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CustomTrans
                        .completeYourDataAndConfirmYourIdentityToFullyActivateYourAccount
                        .tr,
                    style: TFonts.textTitleStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...[
                    CustomTrans.enjoyExtraProtection.tr,
                    CustomTrans.getAccessToAllFeatures.tr,
                    CustomTrans.trackYourEarnings.tr,
                    CustomTrans.enhanceTrust.tr
                  ].map((e) {
                    return ListTile(
                      minVerticalPadding: 0.0,
                      minTileHeight: 30,
                      leading: SvgPicture.asset("assets/svg/check.svg"),
                      minLeadingWidth: 0.0,
                      title: Text(
                        e,
                        style: TFonts.textTitleStyle(
                          fontSize: 16,
                          fontWeight: TFontWights.medium,
                        ),
                      ),
                    );
                  }).toList()
                ],
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                MainButton(
                    title: CustomTrans.completeData.tr,
                    onPressed: () {
                      Get.to(() => ConfirmIdentity(),
                          transition: Transition.fadeIn);
                    }),
                const SizedBox(height: 10),
                MainButton(
                  title: CustomTrans.skip.tr,
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                )
              ],
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
