import 'package:abg/data/const/export.dart';
import 'package:abg/features/progressTracker/domain/controller/progressTracker_controller.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_fonts/google_fonts.dart';

class Audiobar extends StatefulWidget {

  final String KEY;

  const Audiobar({
    super.key,
    required this.KEY,
  });

  @override
  State<Audiobar> createState() => _AudiobarState();
}

class _AudiobarState extends State<Audiobar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgresstrackerController>(
      builder: (controller) {
        double currentValue = controller.getValue(widget.KEY);

        return Container(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width*0.85,
                height: 15,
                child: FlutterSlider(
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    controller.updateValue(widget.KEY, lowerValue);
                  },
                  values: [currentValue],
                  min: 0,
                  max: 100,
                  trackBar: FlutterSliderTrackBar(
                    activeTrackBar: BoxDecoration(
                      color: CustomColors.babyblue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    inactiveTrackBar: BoxDecoration(
                      color: CustomColors.lightgrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    activeTrackBarHeight: 15,
                    inactiveTrackBarHeight: 15,
                  ),
                  handler: FlutterSliderHandler(                
                    decoration: const BoxDecoration(),
                    child: Container(),
                  ),
                ),
              ),
             
              Text(
                "${currentValue.toInt()}%",
                style: GoogleFonts.almarai(
                  fontSize: 14,
                  color: CustomColors.lighttblue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
