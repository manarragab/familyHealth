import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';

class GreycontainerItem extends StatelessWidget {
  final String image;
  final String name;
  final String kind;
  final int age;

  const GreycontainerItem({
    super.key,
    required this.image,
    required this.name,
    required this.kind,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
          color: CustomColors.lightgrey,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset(
            image,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.almarai(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.darkblue),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  kind,
                  style: GoogleFonts.almarai(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.darkblue),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Age: $age years",
                  style: GoogleFonts.almarai(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.darkblue),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Text(
              "Details",
              style: GoogleFonts.almarai(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.darkpinky),
            ),
          )
        ],
      ),
    );
  }
}
