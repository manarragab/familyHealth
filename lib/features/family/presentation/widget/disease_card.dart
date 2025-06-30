import 'package:abg/data/const/export.dart';
import 'package:google_fonts/google_fonts.dart';


class DiseaseCard extends StatelessWidget {
  final String image;
  final String disease;

  const DiseaseCard({super.key, required this.image, required this.disease});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: CustomColors.grey0,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 40, color: Colors.green),
              const SizedBox(height: 6),
              Text(
                disease,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.almarai(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
