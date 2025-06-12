import 'package:abg/data/const/export.dart';
import 'package:abg/res/router/pages.dart';

class ProfileController extends MainGetxController{

List<String> texts=[
"Health Trackers",
"My Period",
"My Family",

"Pills",
"My Interest"
];

  // List<(String, dynamic)> texts = [
  //   ( "Health Trackers", Get.toNamed(CustomPage.myFamily)),
  //   ( "My Period", Get.toNamed(CustomPage.myFamily)),
  //   ("My Family", Get.toNamed(CustomPage.myFamily)),
  //   (  "My Son", Get.toNamed(CustomPage.myFamily)),
  //   ( "pills",  Get.toNamed(CustomPage.pillsPage)),
  //   ("My interest" , Get.toNamed(CustomPage.myFamily)),
  // ];


  List<Color> colors = [
    CustomColors.lightBlue3,
    CustomColors.darkpinky,
    CustomColors.secondary,
  
    CustomColors.lightyellow,
    CustomColors.lighttblue1
  ];


}