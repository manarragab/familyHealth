import 'package:abg/data/const/export.dart';
import 'package:abg/features/family/presentation/addfamily_screen.dart';
import 'package:abg/features/family/presentation/widget/greyContainer_item.dart';

class MyfamilyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.myFamily.tr),
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 57),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                mainAxisExtent: 81,
              ),
              children: [
                GreycontainerItem(
                  image: "assets/images/grandFather.png",
                  name: "Omar Ahmed",
                  kind: "My Dad",
                  age: 50,
                ),
                GreycontainerItem(
                  image: "assets/images/grandMother.png",
                  name: "Mayada Hosni",
                  kind: "Mom",
                  age: 45,
                ),
                GreycontainerItem(
                  image: "assets/images/boyy.png",
                  name: "Mohamed Ahmed",
                  kind: "My Husband",
                  age: 35,
                ),
                GreycontainerItem(
                  image: "assets/images/girll.png",
                  name: "Hana Ahmed",
                  kind: "My Daughter",
                  age: 18,
                ),
                GreycontainerItem(
                  image: "assets/images/nono1.png",
                  name: "Mohamed Ahmed",
                  kind: "My Son",
                  age: 3,
                ),
                GreycontainerItem(
                  image: "assets/images/nono2.png",
                  name: "Yousef Ahmed",
                  kind: "My Son",
                  age: 10,
                ),
              ],
            ),
          ),
          Positioned(
              left: 16,
              bottom: 50,
              child: GestureDetector(
                  onTap: () {
                 Get.to(AddfamilyScreen());
                  },
                  child: Image.asset(
                    "assets/images/add.png",
                    width: 56,
                    height: 56,
                  )))
        ]));
  }
}
