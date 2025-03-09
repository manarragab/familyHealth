import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';

class AddfamilyScreen extends StatelessWidget {
  const AddfamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.family.tr),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Add a family member",
                    style: GoogleFonts.almarai(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.darkblue),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 200,
                              height: 160.3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/images/cheker.png",
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 160.3,
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset("assets/svg/camera.svg",
                                      width: 45, height: 40),
                                  const SizedBox(height: 8),
                                  Text("Add Photo",
                                      style: GoogleFonts.almarai(
                                          fontSize: 16,
                                          color: CustomColors.darkBlue2,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
