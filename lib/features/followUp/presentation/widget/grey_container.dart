import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';

class GreyContainer extends StatelessWidget {
  final String image;
  final String title;
  final String? subTitle;
  final VoidCallback onTapped;

  const GreyContainer({
    super.key,
    required this.image,
    required this.title,
    this.subTitle,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.grey0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.almarai(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.darkblue,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subTitle ??
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing",
                    softWrap: true,
                    style: GoogleFonts.almarai(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.darkblue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
