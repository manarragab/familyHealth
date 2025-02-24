import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Whitecontainer extends StatelessWidget{

final String image;
final String title;
final String subTitle;
final Color? col;

  const Whitecontainer({super.key , required this.image , required this.title ,
   required this.subTitle , this.col});

  @override
  Widget build(BuildContext context) {
    return  Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                        width: double.infinity,
                        height: 71,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: col??Colors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              image,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  title,
                                  style: GoogleFonts.almarai(
                                    color: CustomColors.darkBlue2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  subTitle,
                                  style: GoogleFonts.almarai(
                                    color: CustomColors.darkBlue2,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                  
  }





}