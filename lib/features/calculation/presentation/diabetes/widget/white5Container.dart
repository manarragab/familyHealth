import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:abg/res/configuration/fonts.dart';
import 'package:flutter/material.dart';

class White5container extends StatefulWidget {
  final String id;
  final String Q;
  final List<String> options;

  const White5container(
      {super.key, required this.Q, required this.options, required this.id});

  @override
  State<White5container> createState() => _White5containerState();
}

class _White5containerState extends State<White5container> {
  String? diabetes7;
  String? diabetes6;

  String? rad;
  Calculationcontroller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Calculationcontroller>(
        id: widget.id,
        builder: (_) {
          return Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(7),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: Text(
                      widget.Q,
                      style: TFonts.inter(
                        color: CustomColors.darkblack1,
                        fontSize: 12.w,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ...widget.options.map((options) {
                    return RadioListTile(
                      dense: true,
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      contentPadding: EdgeInsets.zero,
                      activeColor: CustomColors.green1,
                      title: Text(
                        options,
                        style: TFonts.inter(
                          color: CustomColors.grey12,
                          fontSize: 14.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      value: options,
                      groupValue: rad,
                      onChanged: (String? val) {
                        setState(() {
                          rad = val ?? "";
                          controller.update([widget.id]);
                          // widget.id=="diabetes7"? diabetes7=rad : diabetes6=rad ;
                        });
                      },
                    );
                  })
                ],
              ));
        });
  }
}
