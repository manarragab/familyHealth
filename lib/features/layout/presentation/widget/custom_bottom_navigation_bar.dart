import 'package:abg/data/const/export.dart';
import 'package:abg/features/layout/domain/controller/layout_controller.dart';
import 'package:abg/res/nav_bar/animated_bottom_nav/src/fluid_nav_bar.dart';
import 'package:abg/res/nav_bar/animated_bottom_nav/src/fluid_nav_bar_icon.dart';
import 'package:abg/res/nav_bar/animated_bottom_nav/src/fluid_nav_bar_style.dart';

class LayoutBottomNavBar extends GetView<LayoutController> {
  final int currentIndex;
  final Function(int) changeNavBarIndex;

  const LayoutBottomNavBar({
    Key? key,
    required this.changeNavBarIndex,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluidNavBar(
      icons: [
        FluidNavBarIcon(
          svgPath: "assets/svg/home_mint.svg",
          selectedBackgroundColor: const Color(0xFF86CD4B),
        ),
        FluidNavBarIcon(
          svgPath: "assets/svg/books.svg",
          selectedBackgroundColor: const Color(0xFF86CD4B),
        ),
        FluidNavBarIcon(
          svgPath: "assets/svg/family.svg",
          selectedBackgroundColor: const Color(0xFF86CD4B),
        ),
        FluidNavBarIcon(
          svgPath: "assets/svg/people.svg",
          selectedBackgroundColor: const Color(0xFF86CD4B),
        ),
      ],
      onChange: changeNavBarIndex,
      style: const FluidNavBarStyle(
          barBackgroundColor: Color(0xFF30495E),
          iconBackgroundColor: Color(0xFF30495E),
          iconSelectedForegroundColor: Colors.white,
          iconUnselectedForegroundColor: Colors.white),
    );
  }
}
