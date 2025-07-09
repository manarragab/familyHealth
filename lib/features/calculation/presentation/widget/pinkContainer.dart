import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';

class Pinkcontainer extends StatelessWidget {
  final String title;
  final String image;
  final Widget widg;
  final double? heightt;
  final String? firstTxt;
  final String? desc;

  const Pinkcontainer({
    super.key,
    required this.title,
    required this.image,
    required this.widg,
    this.heightt,
    this.firstTxt, this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              firstTxt ?? CustomTrans.ovulationCalculator.tr,
              style: GoogleFonts.almarai(
                fontSize: 14,
                color: CustomColors.darkBlue2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
  desc??   CustomTrans.ovulationCalculatorWill.tr,
            style: GoogleFonts.almarai(
              fontSize: 15,
              color: CustomColors.darkBlue2,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 15, left: 15,right: 15),
            //   width: 382,
            width: double.infinity,
          
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.lightpink1,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.almarai(
                                fontSize: 40,
                                color: CustomColors.darkpink,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Calculator",
                              style: GoogleFonts.almarai(
                                fontSize: 30,
                                color: CustomColors.darkpink,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          image,
                          width: 181,
                          height: 149,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: widg,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
