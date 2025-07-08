import 'package:abg/data/const/export.dart';
import 'package:abg/res/generate_material_color.dart';
import 'package:google_fonts/google_fonts.dart';

class Context {
  BuildContext context;

  Context(this.context);

  static ThemeData getThemeData() {
    return ThemeData(
      // main colors of the app
      useMaterial3: false,
      primaryColor: CustomColors.primary,
      primaryColorLight: CustomColors.primaryOpacity70,
      disabledColor: CustomColors.grey,
      scaffoldBackgroundColor: CustomColors.backgroundScaffold,
      iconTheme: IconThemeData(color: CustomColors.fontColor, size: 20.h),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: CardThemeData(
          shape: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColors.lightGrey),
              borderRadius: BorderRadius.circular(10))),
      listTileTheme: ListTileThemeData(
          titleTextStyle: TFonts.inter(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          subtitleTextStyle: TFonts.inter(color: Colors.black, fontSize: 14)),
      brightness: Brightness.light,
      dividerColor: Colors.transparent,
      unselectedWidgetColor: CustomColors.grey4,
      platform: TargetPlatform.iOS,
      primarySwatch: generateMaterialColor(CustomColors.primary),
      primaryIconTheme: IconThemeData(
        color: CustomColors.primary,
      ),
      fontFamily: GoogleFonts.almarai().fontFamily,
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: CustomColors.primary),
        elevation: 0,
        toolbarHeight: 70.h,
        centerTitle: true,
      ),
    );
  }

  double getHeight() {
    return MediaQuery.of(context).size.height * 1.h;
  }

  double getWidth() {
    return MediaQuery.of(context).size.width * 1.h;
  }

  ThemeData getTheme() {
    return Theme.of(context);
  }
}
