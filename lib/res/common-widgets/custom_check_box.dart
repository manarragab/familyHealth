import 'package:abg/data/const/export.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({required this.onTap, this.isChecked = false, Key? key})
      : super(key: key);
  final Function() onTap;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 2),
        child: SvgPicture.asset(isChecked
            ? "assets/svg/check-box-outline.svg"
            : "assets/svg/check-box.svg"),
      ),
    );
  }
}
