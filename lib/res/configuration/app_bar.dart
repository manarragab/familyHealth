import 'package:abg/data/const/export.dart';

class CustomAppBar {
  static PreferredSizeWidget appBar(
    String title, {
    String subTitle = "",
    Widget? leadingWidget,
    List<Widget>? actions,
    bool centerTitle = true,
  }) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/svg/appbar_background_one_save.svg",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AppBar(
                centerTitle: centerTitle,
                actions: actions,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TFonts.appBarTitle(fontSize: 20.w),
                    ),
                    if (subTitle.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            subTitle,
                            style: TFonts.textBodyWhiteStyle,
                          ),
                        ],
                      )
                  ],
                ),
                iconTheme: const IconThemeData(color: Colors.white),
                leading: leadingWidget,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
            )
          ],
        ));
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
      actions: [
        Container(
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: onFilterPress,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 10.w, start: 10.w),
                  child: SvgPicture.asset(
                    "assets/svg/filter.svg",
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: onNotificationPress,
                borderRadius: BorderRadius.circular(50),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 10.w, start: 10.w),
                  child: SvgPicture.asset(
                    "assets/svg/notifications.svg",
                    color: Colors.black,
                  ),
                ),
              )
            ],
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
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      /* bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomTextField.searchField(
            (value) => onChange(value),
            controller: Get.find<FilterController>().searchController,
            hint: "${CustomTrans.write.tr} ${CustomTrans.advertiseNo.tr}",
          )),*/
    );
  }

  static chatAppBar({String? title}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65),
      child: AppBar(
        elevation: 1,
        leading: Container(),
        actions: [
          Container(
            padding: const EdgeInsets.only(top: 5),
            width: Get.width,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                CustomImage.asset("assets/lotties/icon.png",
                    width: 60,
                    height: 75,
                    borderRadius: BorderRadius.circular(75),
                    fit: BoxFit.contain),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title ?? CustomTrans.supportCenter.tr,
                  style: TFonts.inter(
                    fontSize: TFontSizes.f16,
                    color: CustomColors.primary,
                    fontWeight: TFontWights.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
