import 'package:abg/localization/all_keys.dart';
import 'package:abg/res/common-widgets/custm_button.dart';
import 'package:abg/res/configuration/app_bar.dart';
import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DuedateScreen extends StatefulWidget {
  @override
  State<DuedateScreen> createState() => _DuedateScreenState();
}

class _DuedateScreenState extends State<DuedateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.appBar(CustomTrans.dueDateCalc.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Due date Calculator",
                  style: GoogleFonts.almarai(
                    fontSize: 14,
                    color: CustomColors.darkBlue2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "The ovulation calculator will help you determine the key days when ovulation occurs, which are the days when the body is ready for pregnancy.",
                style: GoogleFonts.almarai(
                  fontSize: 15,
                  color: CustomColors.darkBlue2,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                //   width: 382,
                width: double.infinity,
                height: 412,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.lightpink1,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Due date",
                                  style: GoogleFonts.almarai(
                                    fontSize: 40,
                                    color: CustomColors.darkpink,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Calculator   ",
                                  style: GoogleFonts.almarai(
                                    fontSize: 30,
                                    color: CustomColors.darkpink,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              "assets/images/girl.png",
                              width: 181,
                              height: 149,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "The first day of the last menstrual cycle",
                      style: GoogleFonts.almarai(
                        fontSize: 14,
                        color: CustomColors.darkBlue2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Day",
                            style: GoogleFonts.almarai(
                              fontSize: 16,
                              color: CustomColors.darkBlue2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Month",
                            style: GoogleFonts.almarai(
                              fontSize: 16,
                              color: CustomColors.darkBlue2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Year",
                            style: GoogleFonts.almarai(
                              fontSize: 16,
                              color: CustomColors.darkBlue2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: 360,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: CustomColors.darkpink,
                          width: 2,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 30,
                                itemBuilder: (context, i) {
                                  return SizedBox(
                                    height: 42,
                                    child: Center(
                                      child: Text(
                                        "${i + 1}",
                                        style: GoogleFonts.almarai(
                                          fontSize: 16,
                                          color: CustomColors.darkBlue2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 12,
                                itemBuilder: (context, i) {
                                  return SizedBox(
                                    height: 42,
                                    child: Center(
                                      child: Text(
                                        "${i + 1}",
                                        style: GoogleFonts.almarai(
                                          fontSize: 16,
                                          color: CustomColors.darkBlue2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 100,
                                itemBuilder: (context, i) {
                                  return SizedBox(
                                    height: 42,
                                    child: Center(
                                      child: Text(
                                        "${2024 + i}",
                                        style: GoogleFonts.almarai(
                                          fontSize: 16,
                                          color: CustomColors.darkBlue2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    MainButton(
                      withShadow: true,
                      onPressed: () {},
                      radius: 10,
                      height: 46,
                      backgroundColor: CustomColors.darkpink,
                      titleWidget: Text(
                        CustomTrans.calculate.tr,
                        style: GoogleFonts.almarai(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
