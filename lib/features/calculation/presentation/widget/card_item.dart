
import 'package:abg/data/models/calculation/favourite/get_favourite/get_favourite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/data/const/export.dart';
class CardItem extends StatelessWidget {
  final String image;
  final void Function()? onPress;
  final void Function()? fav;
    final String title;
    final String subTitle;
final Calculators? favouriteModel;
  const CardItem({
    super.key,
      required this.image, this.onPress, this.fav, required this.title, required this.subTitle, this.favouriteModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
onPress?.call();
      },
      child: Card(
        elevation: 0.2,
        color: CustomColors.lightgrey5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 90,
                height: 90,
                child: CustomImage.asset(image, fit: BoxFit.cover),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.almarai(
                          fontSize: 12,
                          color: CustomColors.darkBlue2,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subTitle,
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
              const SizedBox(width: 10),
              Container(
                margin: const EdgeInsets.only(top: 14),
                width: 22,
                child: GestureDetector(
                  onTap: () {
                   fav?.call();

                  },
                  child: SvgPicture.asset(
                    favouriteModel?.isFavorite == true
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
      ),
    );
  }
}
