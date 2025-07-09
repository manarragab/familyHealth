import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';

class Pils2Screen extends StatelessWidget {
  const Pils2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.Pils.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Name pil",
                style: GoogleFonts.almarai(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.darkblue,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/pilsImage.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 40,
                  left: 30,
                  right: 30,
                  child: Row(
                    children: [
                      Image.asset("assets/images/whiteHome.png"),
                      const SizedBox(width: 10),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: CustomColors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset("assets/images/voice.png"),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Listen To The PIL",
                        style: GoogleFonts.almarai(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Image.asset("assets/images/dots.png"),
                    ],
                  ),
                ),

                Positioned(
                 top: 85,
                  left: 16,
                  right: 16,
                  child: Center(
                    child: Text(
                      "Back and Pelvic \n Pain In \n Pregnancy",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.almarai(
                        fontSize: 30, 
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 40,
                  left: (Get.width / 2) - (Get.width * 1 / 3) / 2,
                  child: Container(
                    width: Get.width * 1 / 3,
                    height: 40,
                    decoration: BoxDecoration(
                      color: CustomColors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Continue",
                            style: GoogleFonts.almarai(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset("assets/images/signn.png"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
