import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';

class White2container extends StatefulWidget {
  
  final String title1;
  final String title2;
  final String measure;
  final String KEY;

  const White2container({
    super.key,
    required this.title1,
    required this.title2,
    required this.measure,
    required this.KEY,
  });

  @override
  State<White2container> createState() => _White2containerState();
}

class _White2containerState extends State<White2container> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(
      builder: (controller) {
        double currentValue = controller.getValue(widget.KEY);

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
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    widget.title1,
                    style: GoogleFonts.almarai(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    widget.title2,
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      color: Colors.grey,
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
                    controller.updateValue(widget.KEY, lowerValue);
                  },
                  values: [currentValue],
                  max: 300,
                  min: 20,
                  trackBar: FlutterSliderTrackBar(
                    activeTrackBar: BoxDecoration(
                      color: Colors.green,
                    ),
                    inactiveTrackBar: BoxDecoration(
                      color: Colors.grey[300],
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
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your height",
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "${currentValue.toInt()} ${widget.measure}",
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
