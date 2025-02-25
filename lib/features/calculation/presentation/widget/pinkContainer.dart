import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';

class Pinkcontainer extends StatelessWidget {
  final String title;
  final String image;
  final Widget widg;
  final double? heightt;
  final String? firstTxt;

  const Pinkcontainer({
    super.key,
    required this.title,
    required this.image,
    required this.widg,
    this.heightt,
    this.firstTxt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              firstTxt ?? "Due date Calculator",
              style: GoogleFonts.almarai(
                fontSize: 14,
                color: CustomColors.darkBlue2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "The ovulation calculator will help you determine the key days when ovulation occurs, which are the days when the body is ready for pregnancy.",
            style: GoogleFonts.almarai(
              fontSize: 15,
              color: CustomColors.darkBlue2,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            //   width: 382,
            width: double.infinity,
            height: heightt ?? 412,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.lightpink1,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
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
