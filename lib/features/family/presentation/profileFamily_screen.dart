import 'package:abg/data/const/export.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilefamilyScreen extends StatelessWidget{
  final String? image;
  const ProfilefamilyScreen({super.key,  this.image,  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.family.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
            Center(
              child: Text("My Dad" , style: GoogleFonts.almarai(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: CustomColors.darkblue
              ),),
            ),
            Center(
              child: Container(
                width: 200,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Image.asset(image??"" , fit:BoxFit.cover,)),
            )
        ],)
      ),
    );
  }

}