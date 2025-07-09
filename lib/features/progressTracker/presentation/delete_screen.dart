import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';

class Delete extends StatelessWidget {
  const Delete({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              height: 378,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/all.png"),
                  const SizedBox(
                    height: 19,
                  ),
                  Text("Are you sure you deleted habit tracking?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.almarai(
                          fontSize: 20,
                          color: CustomColors.lighttblue2,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainButton(
                          onPressed: () {},
                          title: "yes",
                          width: Get.width * 1 / 4,
                          radius: 7,
                          withShadow: false,
                          height: 42,
                        ),
                        MainButton(
                          onPressed: () {
                            Get.back();
                          },
                          title: "no",
                          textColor: Colors.red,
                          backgroundColor: Colors.white,
                          borderColor: Colors.red,
                          width: Get.width * 1 / 4,
                          radius: 7,
                          withShadow: false,
                          height: 42,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
