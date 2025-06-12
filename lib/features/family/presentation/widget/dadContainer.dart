import 'package:abg/data/const/export.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/todatActivity_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Dadcontainer extends StatefulWidget {
  final int index;
  final String name;
  final String weight;
  final String time;
  final String? icon;

  Dadcontainer({
    super.key,
    required this.name,
    required this.weight,
    required this.time,
    required this.index,
    this.icon,
  });

  @override
  State<Dadcontainer> createState() => _DadcontainerState();
}

class _DadcontainerState extends State<Dadcontainer> {
  FamilyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.choosen(widget.index);
        if (widget.index == 0) {
          Get.to(TodatactivityScreen());
        }
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        height: 57,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.greyyy,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.almarai(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.darkblue,
                  ),
                ),
                Text(
                  widget.weight,
                  style: GoogleFonts.almarai(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.darkblue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "After lunch",
                      style: GoogleFonts.almarai(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.darkblue,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.time,
                      style: GoogleFonts.almarai(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.darkblue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
