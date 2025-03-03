import 'package:abg/data/const/export.dart';
import 'package:abg/features/home/presentation/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Done extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkblack,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 382,
                height: 367,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 167,
                            height: 167,
                            decoration: BoxDecoration(
                              color: CustomColors.lightgrey4,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 140.8,
                            height: 140.8,
                            decoration: BoxDecoration(
                              color: CustomColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset("assets/images/correctSign.png"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text("Thank you!",
                        style: GoogleFonts.almarai(
                            fontSize: 24,
                            color: CustomColors.third,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 19,
                    ),
                    Text("The alarm has been added \n successfully.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.almarai(
                            fontSize: 20,
                            color: CustomColors.third,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
               MainButton(              
                    onPressed: () {
                      Get.offAll(HomeScreen());
                    },
                    radius: 25,
                    title: CustomTrans.BacktoHome.tr,
                    fontSize: 24,
                  ),
            ],
          )),
    );
  }
}
