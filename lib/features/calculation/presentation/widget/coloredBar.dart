import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/data/const/export.dart';

class Coloredbar extends StatelessWidget {
  final List<String>? txt;
  final List<String>? txt2;
  final String? title;
  final String? subTitle; 
  final String id; 

  Coloredbar({super.key, this.txt, this.txt2  , this.title , this.subTitle, required this.id});

  final Calculationcontroller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.width;
    double barWidth = screenWidth - 80;

    return GetBuilder<Calculationcontroller>(
      id: id,
      builder: (context) {
        double indicatorPosition =
            ((controller.bmiValue - controller.minBmi) /
                (controller.maxBmi - controller.minBmi)) *
            barWidth;
          
controller.setId(id);

        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           id=="diabetes8"?SizedBox():    _buildNumberRow(),
              SizedBox(height: 5),
              _buildBar(barWidth, indicatorPosition),
              SizedBox(height: 5),
              _buildLabelRow(barWidth),
              SizedBox(height: 25),
              _buildBmiScore(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNumberRow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 74),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNumber(txt2?[0] ?? "18.5", 0),
          _buildNumber(txt2?[1] ?? "25", 1),
          _buildNumber(txt2?[2] ?? "30", 2),
        ],
      ),
    );
  }

  Widget _buildBar(double barWidth, double indicatorPosition) {
    return Stack(
      children: [
        SizedBox(
          width: barWidth,
          child: Row(
            children: [
              _buildBarSegment(barWidth * 0.25, Colors.blue, "low"),
              _buildBarSegment(barWidth * 0.25, Colors.green, "normal"),
              _buildBarSegment(barWidth * 0.25, Colors.yellow, "over"),
              _buildBarSegment(barWidth * 0.25, Colors.red, "obese"),
            ],
          ),
        ),
        Positioned(
          left: indicatorPosition.clamp(0, barWidth - 6),
          child: GestureDetector(
            
            onHorizontalDragUpdate: (details) {
              // controller.updateBmi(
              //     indicatorPosition + (details.delta.dx * controller.speedFactor * 2), // Faster cursor
              //     barWidth);
            },
            child: Container(
              width: 4,
              height: 30,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabelRow(double barWidth) {
    return Container(
      width: barWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLabel(txt?[0] ?? "low weight", 0),
          _buildLabel(txt?[1] ?? "normal weight", 1),
          _buildLabel(txt?[2] ?? "over weight", 2),
          _buildLabel(txt?[3] ?? "Obesity", 3),
        ],
      ),
    );
  }

  Widget _buildBmiScore() {
    return GetBuilder<Calculationcontroller>(
      builder: (context) => Column(
        children: [
          Text(
            title??"BMI score",
            style: GoogleFonts.almarai(
              fontSize: 30,
              color: CustomColors.darkblack1,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            ((controller.bmiValue * 10).ceil() / 10.0).toString(),
            key: ValueKey(id),
            style: GoogleFonts.almarai(
              fontSize: 40,
              color: CustomColors.green1,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 18),
 id=="diabetes8"? SizedBox() : Text(
            subTitle??"",
            style: GoogleFonts.almarai(
              fontSize: 16,
              color: CustomColors.darkblack1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarSegment(double width, Color color, String label) {
    return Container(
      key: ValueKey("bar_segment_$label"),
      width: width,
      height: 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.horizontal(
          left: color == Colors.blue ? Radius.circular(10) : Radius.zero,
          right: color == Colors.red ? Radius.circular(10) : Radius.zero,
        ),
      ),
    );
  }

  Widget _buildLabel(String text, int i) {
    return Text(
      txt?[i] ?? text,
     // key: ValueKey("label_$i"),
      style: GoogleFonts.almarai(
        fontSize: 13,
        color: CustomColors.darkblack1,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildNumber(String number, int index) {
    return Text(
      number,
      key: ValueKey("number_$index"),
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    );
  }
}
