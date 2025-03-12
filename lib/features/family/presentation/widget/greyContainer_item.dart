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
      padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 10),
      decoration: BoxDecoration(
          color: CustomColors.lightgrey,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
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
          const Spacer(),
          Column(
               children: [
              InkWell(
                onTap: (){

                },
                child: SvgPicture.asset("assets/svg/delete.svg")),
             SizedBox(height:22),
           
              Text(
                  "Details",
                  style: GoogleFonts.almarai(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.darkpinky),
                ),
            ],
          ),
        
        ],
      ),
    );
  }
}
