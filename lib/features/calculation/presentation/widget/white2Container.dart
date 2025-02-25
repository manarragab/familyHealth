import 'package:abg/data/const/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_fonts/google_fonts.dart';

class White2container extends StatefulWidget {
  final String title1;
  final String title2;

  final String measure;

  const White2container(
      {super.key,
      required this.title1,
      required this.title2,
      required this.measure});

  @override
  State<White2container> createState() => _White2containerState();
}

class _White2containerState extends State<White2container> {
  double _currentValue = 60;

  final double _totalDuration = 100;
  final double _minValue = 1;
  final double _maxValue = 200;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(top: 13),
      width: double.infinity,
      height: 98,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Prevent extra space
        children: [
          Row(
            children: [
              Text(
                widget.title1,
                style: GoogleFonts.almarai(
                  fontSize: 12,
                  color: CustomColors.grey12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                widget.title2,
                style: GoogleFonts.almarai(
                  fontSize: 14,
                  color: CustomColors.grey12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 9),
          SizedBox(
            width: double.infinity,
            height: 15,
            child: FlutterSlider(
              onDragging: (handlerIndex, lowerValue, upperValue) {
                setState(() {
                  _currentValue = lowerValue;
                });
              },
              values: [_currentValue],
              max: _maxValue,
              min: _minValue,
              trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(
                  color: CustomColors.green1,
                ),
                inactiveTrackBar: BoxDecoration(
                  color: CustomColors.grey13,
                ),
                activeTrackBarHeight: 4,
                inactiveTrackBarHeight: 4,
              ),
              handler: FlutterSliderHandler(
                decoration: BoxDecoration(),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your height",
                style: GoogleFonts.almarai(
                  fontSize: 14,
                  color: CustomColors.grey12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                " ${_currentValue.toInt()} ${widget.measure}",
                style: GoogleFonts.almarai(
                  fontSize: 14,
                  color: CustomColors.green1,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
