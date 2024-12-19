import 'package:abg/data/const/export.dart';

class ProfilePictureStepWidget extends StatelessWidget {
  const ProfilePictureStepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            "assets/svg/photo.svg",
            height: 200,
          ),
        ),
        const SizedBox(height: 20),
        MainButton(
            width: 200,
            widget: SvgPicture.asset("assets/svg/camera.svg"),
            onPressed: () {}),
        const SizedBox(height: 20),
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              CustomTrans.idPhotoUploadInstructions.tr,
              style: TFonts.textTitleStyle(),
            )),
        const SizedBox(height: 10),
        ...[
          CustomTrans.officialGovernmentID.tr,
          CustomTrans.recentAndClearPhoto.tr,
          CustomTrans.noFiltersOrEdits.tr,
          CustomTrans.fullFaceVisibility.tr,
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
        }).toList(),
        const SizedBox(height: 10),
      ],
    );
  }
}
