import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Coloredbar extends StatefulWidget {
  @override
  State<Coloredbar> createState() => _ColoredbarState();
}

class _ColoredbarState extends State<Coloredbar> {
  double bmiValue = 25;
  final double minBmi = 10;
  final double maxBmi = 40;
  final double speedFactor = 2.5;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double barWidth = screenWidth - 80;
    double indicatorPosition =
        ((bmiValue - minBmi) / (maxBmi - minBmi)) * barWidth;

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 74),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNumber("18.5"),
                _buildNumber("25"),
                _buildNumber("30"),
              ],
            ),
          ),
          SizedBox(height: 5),
          Stack(
            children: [
              SizedBox(
                width: barWidth,
                child: Row(
                  children: [
                    _buildBarSegment(barWidth * 0.25, Colors.blue),
                    _buildBarSegment(barWidth * 0.25, Colors.green),
                    _buildBarSegment(barWidth * 0.25, Colors.yellow),
                    _buildBarSegment(barWidth * 0.25, Colors.red),
                  ],
                ),
              ),
              Positioned(
                left: indicatorPosition.clamp(0, barWidth - 6),
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      double newPosition =
                          indicatorPosition + (details.delta.dx * speedFactor);
                      bmiValue =
                          ((newPosition / barWidth) * (maxBmi - minBmi)) +
                              minBmi;
                      bmiValue = bmiValue.clamp(minBmi, maxBmi);
                    });
                  },
                  child: Container(
                    width: 4,
                    height: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            width: barWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("low weight"),
                _buildLabel("normal weight"),
                _buildLabel("over weight"),
                _buildLabel("Obesity"),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "BMI score",
            style: GoogleFonts.almarai(
              fontSize: 30,
              color: CustomColors.darkblack1,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            ((bmiValue * 10).ceil() / 10.0).toString(),
            style: GoogleFonts.almarai(
              fontSize: 40,
              color: CustomColors.green1,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            "normal weight",
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

  Widget _buildBarSegment(double width, Color color) {
    return Container(
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

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.almarai(
        fontSize: 13,
        color: CustomColors.darkblack1,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildNumber(String number) {
    return Text(
      number,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    );
  }
}
