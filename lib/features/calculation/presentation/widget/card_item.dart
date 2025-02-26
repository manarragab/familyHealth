import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItem extends StatefulWidget {
  final String image;
  final double? elevation;
  final String title;
  final String subTitle;

  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.elevation,
  });

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation,
      color: CustomColors.lightgrey5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: Image.asset(widget.image, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.almarai(
                        fontSize: 12,
                        color: CustomColors.darkBlue2,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subTitle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.almarai(
                        fontSize: 12,
                        color: CustomColors.darkBlue2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 14),
              alignment: Alignment.topCenter,
              width: 22,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: SvgPicture.asset(
                  isClicked
                      ? "assets/svg/filledLove.svg"
                      : "assets/svg/outlineLove.svg",

                  width: 22,
                  height: 18.85,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
