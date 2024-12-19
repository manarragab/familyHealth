import 'package:abg/data/const/export.dart';
import 'package:abg/features/layout/domain/controller/layout_controller.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class LayoutBottomNavBar extends GetView<LayoutController> {
  final int currentIndex;
  final Function(int) changeNavBarIndex;

  LayoutBottomNavBar({
    Key? key,
    required this.changeNavBarIndex,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      activeIndex: currentIndex,
      onTap: changeNavBarIndex,
      backgroundColor: CustomColors.backgroundBottomSheetColor,
      tabBuilder: (int index, bool isActive) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SvgPicture.asset(
            isActive ? selectedIconList[index] : iconList[index],
            height: 20,
          ),
        );
      },
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
    );
  }

  List iconList = [
    "assets/svg/home_one_save.svg",
    "assets/svg/search_one_save.svg",
    "assets/svg/group_one_save.svg",
    "assets/svg/user_one_save.svg",
  ];

  List selectedIconList = [
    "assets/svg/selected_home.svg",
    "assets/svg/selected_search.svg",
    "assets/svg/selected_group.svg",
    "assets/svg/selected_user.svg",
  ];
}
