import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';

class Greenycontainer extends StatelessWidget {
  final String? title;
  final String? image;
  final Widget widg;
  final double? heightt;
  final String? firstTxt;
  final String? centertxt;
  final double? size;

  const Greenycontainer(
      {super.key,
      this.title,
      this.image,
      required this.widg,
      this.heightt,
      this.firstTxt,
      this.centertxt,
      this.size});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Text(
            centertxt ?? "Measuring weight",
            style: GoogleFonts.almarai(
              fontSize: 14,
              color: CustomColors.darkBlue2,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          height: heightt ?? 426,
          decoration: BoxDecoration(
              color: CustomColors.lightgreen,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? "weight ",
                            style: GoogleFonts.almarai(
                              fontSize: size ?? 40,
                              color: CustomColors.green1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Recording",
                            style: GoogleFonts.almarai(
                              fontSize: 26,
                              color: CustomColors.green1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      image ?? "",
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: widg,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
