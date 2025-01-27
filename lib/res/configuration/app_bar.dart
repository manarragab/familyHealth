import 'package:abg/data/const/export.dart';
import 'package:abg/res/common-widgets/custom_back_button.dart';

class CustomAppBar {
  static PreferredSizeWidget appBarLogo({
    List<Widget>? actions,
    bool displayLogo = true,
  }) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AppBar(
            centerTitle: true,
            actions: actions,
            title: displayLogo
                ? SvgPicture.asset("assets/svg/logo_appbar.svg")
                : const SizedBox(),
            iconTheme: const IconThemeData(color: Colors.white),
            leading: const CustomBackButton(),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ));
  }

  static PreferredSizeWidget appBar(
    String title, {
    String subTitle = "",
    Widget? leadingWidget,
    List<Widget>? actions,
    bool centerTitle = true,
  }) {
    return AppBar(
      centerTitle: centerTitle,
      actions: actions,
      title: Text(
        title,
        style: TFonts.appBarTitle(fontSize: 20.w),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      leading: leadingWidget,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

/*  static PreferredSizeWidget appBar(String title,
      {bool showBackButton = false,
      Function? getBackTap,
      List<Widget>? actions,
      bool useBlur = false,
      Color? color}) {
    return AppBar(
      flexibleSpace: useBlur
          ? ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            )
          : null,
      backgroundColor: color ?? CustomColors.white,
      actions: actions,
      title: Text(
        title,
        style: TFonts.appBarTitle(),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }*/

  static PreferredSizeWidget homeAppBar({
    Function()? onMenuPress,
    Function()? onNotificationPress,
    Function()? onFilterPress,
    required dynamic Function(String) onChange,
  }) {
    return AppBar(
      backgroundColor: Colors.transparent,
      excludeHeaderSemantics: true,
      elevation: 0,
      primary: true,
      title: SvgPicture.asset("assets/svg/logo2.svg"),
      actions: [
        InkWell(
          onTap: onNotificationPress,
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 20, start: 10),
            child: SvgPicture.asset(
              "assets/svg/Notification.svg",
              color: Colors.black,
            ),
          ),
        ),
      ],
      leading: InkWell(
        onTap: onMenuPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          //  padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SvgPicture.asset(
            "assets/svg/drawer_icon.svg",
          ),
        ),
      ),
    );
  }

  static chatAppBar(
      {String? title, required String leadingImage, required String subTitle}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65),
      child: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Container(
            padding: const EdgeInsets.only(top: 5),
            width: Get.width - 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(leadingImage),
                  radius: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? "",
                      style: TFonts.inter(
                        fontSize: TFontSizes.f16,
                        fontWeight: TFontWights.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle,
                      style: TFonts.inter(
                        fontSize: TFontSizes.f14,
                        fontWeight: TFontWights.regular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
