import 'package:abg/data/const/export.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            "assets/svg/success.svg",
            height: 150,
          ),
          Text(
            CustomTrans.dataSubmittedSuccessfully.tr,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
