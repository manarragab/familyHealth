import 'package:abg/data/const/export.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/features/followUp/domain/controller/followUp_controller.dart';

class ViewProgressScreen extends StatefulWidget {
  const ViewProgressScreen({super.key});

  @override
  State<ViewProgressScreen> createState() => _ViewProgressScreenState();
}

class _ViewProgressScreenState extends State<ViewProgressScreen> {
  // Separate controllers
  FollowupController controller1 = Get.find();
  FollowupController controller2 = Get.find();
  FollowupController controller3 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.followUp.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Center(
              child: Text(
                "View progress",
                style: GoogleFonts.almarai(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.darkblue,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing.",
              softWrap: true,
              style: GoogleFonts.almarai(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: CustomColors.darkblue,
              ),
            ),
            const SizedBox(height: 20),
            lineChart(controller1, "1"),
            const SizedBox(height: 15),
            lineChart(controller2, "2"),
            const SizedBox(height: 15),
            lineChart(controller3, "3"),
          ],
        ),
      ),
    );
  }

  Widget lineChart(FollowupController controller, String chartId) {
    return GetBuilder<FollowupController>(
      id: chartId,
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CustomColors.lightgreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Measuring blood pressure",
                    style: GoogleFonts.almarai(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.darkblue,
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: CustomColors.lighttblue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: controller.selectedPeriod,
                      dropdownColor: CustomColors.lighttblue,
                      style: GoogleFonts.almarai(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.greyy1,
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: CustomColors.greyy1,
                      ),
                      underline: const SizedBox(),
                      items: List.generate(controller.periods.length, (index) {
                        return DropdownMenuItem(
                          value: controller.periods[index].toString(),
                          child: Text(controller.periods[index].toString()),
                        );
                      }),
                      onChanged: (newValue) {
                        controller.updateSelectedPeriod(newValue!);
                        controller.update([chartId]);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 7,
                    minY: 0,
                    maxY: 150,
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(width: 2, color: CustomColors.greyy2),
                        bottom:
                            BorderSide(width: 2, color: CustomColors.greyy2),
                      ),
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                controller.days[value.toInt()],
                                style: GoogleFonts.almarai(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: CustomColors.darkblack2,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 10,
                          getTitlesWidget: (value, _) => Padding(
                            padding: const EdgeInsets.only(right: 3.5),
                            child: Text(
                              value.toInt().toString(),
                              textAlign: TextAlign.right,
                              style: GoogleFonts.almarai(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: CustomColors.darkblack2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: const FlGridData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: controller.data[controller.selectedPeriod] ?? [],
                        isCurved: true,
                        color: CustomColors.bluee,
                        dotData: const FlDotData(show: true),
                      ),
                      LineChartBarData(
                        spots: controller.data[controller.selectedPeriod]!
                            .map((spot) {
                          if (spot.x == 0 || spot.x == 5) {
                            return FlSpot(spot.x, spot.y);
                          } else if (spot.x == 3) {
                            return FlSpot(spot.x, spot.y + 30);
                          } else {
                            return FlSpot(spot.x, spot.y - 30);
                          }
                        }).toList(),
                        isCurved: true,
                        color: CustomColors.grenn,
                        dotData: const FlDotData(show: true),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
