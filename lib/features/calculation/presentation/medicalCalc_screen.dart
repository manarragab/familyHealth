import 'package:abg/data/const/enums.dart';
import 'package:abg/data/models/calculation/favourite/get_favourite/get_favourite.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/calculation/domain/controller/CalculationController.dart';
import 'package:abg/features/calculation/presentation/BmiCalc/BMIcalc_screen.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:abg/res/router/pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/features/calculation/presentation/widget/card_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MedicalcalcScreen extends StatefulWidget {
  @override
  State<MedicalcalcScreen> createState() => _MedicalcalcScreenState();
}

// class _MedicalcalcScreenState extends State<MedicalcalcScreen> {
//   List<Map<String, dynamic>> favoriteItems = [];
TextEditingController searchController = TextEditingController();

//   final List<Map<String, dynamic>> allItems = [
//     {
//       'index': 0,
//       'image': 'assets/images/BMI.png',
//       'title': 'BMI Calculator',
//       'subTitle':
//           "The BMI calculator is a powerful tool for assessing healthy weight and understanding your fitness level.",
//       'elevation': 2.3,
//     },
//     {
//       'index': 1,
//       'image': 'assets/images/baby.png',
//       'title': 'Due date Calculator',
//       'subTitle':
//           "Pregnancy and childbirth calculator provides information about the due date and helps understand the stages of pregnancy.",
//       'elevation': 2.3,
//     },
//     {
//       'index': 2,
//       'image': 'assets/images/diabetes.png',
//       'title': 'Diabetes Type2 Risk Calculator',
//       'subTitle':
//           'Helps determine the risk of developing type 2 diabetes in yor body.',
//       'elevation': 2.3,
//     },
//     {
//       'index': 3,
//       'image': 'assets/images/ibss.png',
//       'title': 'Symptom Checker For IBS Calculator',
//       'subTitle':
//           'Easily assess your risk of Irritable Bowel Syndrome (IBS) and take a proactive step toward better digestive health.',
//       'elevation': 2.3,
//     },
//     {
//       'index': 4,
//       'image': 'assets/images/fruits.png',
//       'title': 'Calorie Calculator',
//       'subTitle':
//           "This calculator can help you determine the types and amounts of food that suit your needs and track your daily food intake.",
//       'elevation': 2.3,
//     },
//     {
//       'index': 5,
//       'image': 'assets/images/water.png',
//       'title': 'Body water Calculator',
//       'subTitle':
//           "This calculator can help you determine the types and amounts of water that suit your needs and track your daily water intake.",
//       'elevation': 2.3,
//     },
//     {
//       'index': 6,
//       'image': 'assets/images/womb.png',
//       'title': 'Ovulation Calculator',
//       'subTitle':
//           "It provides an ovulation day calculator to determine the period when the egg is ready for fertilization",
//       'elevation': 2.3,
//     },
//   ];

//   List<Map<String, dynamic>> get filteredItems {
//     String query = searchController.text.toLowerCase();
//     if (query.isEmpty) return allItems;
//     return allItems
//         .where((item) => item['title'].toLowerCase().contains(query))
//         .toList();
//   }

//   void handleFavoriteToggle(bool isFav, Map<String, dynamic> item) {
//     setState(() {
//       if (isFav) {
//         if (!favoriteItems.any((e) => e['title'] == item['title'])) {
//           favoriteItems.add(item);
//         }
//       } else {
//         favoriteItems.removeWhere((e) => e['title'] == item['title']);
//       }
//     });
//   }

//   Widget buildCardItem(Map<String, dynamic> item) {
//     final isFav = favoriteItems.any((e) => e['title'] == item['title']);
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 7),
//       child: InkWell(
//         onTap: () {
//           switch (item['index']) {
//             case 0:
//               Get.to(BmicalcScreen());
//               break;
//             case 1:
//               Get.toNamed(CustomPage.dueDatePage);
//               break;
//             case 2:
//               Get.toNamed(CustomPage.diabetes1Page);
//               break;
//             case 3:
//               Get.toNamed(CustomPage.ibsPage1);
//               break;
//             case 4:
//               Get.toNamed(CustomPage.caloriePage);
//               break;
//             case 5:
//               Get.toNamed(CustomPage.waterPage);
//               break;
//             case 6:
//               Get.toNamed(CustomPage.ovulatePage);
//               break;
//           }
//         },
//         child: CardItem(
//           image: item['image'],
//           elevation: item['elevation'],
//           title: item['title'],
//           subTitle: item['subTitle'],
//           isFavorite: isFav,
//           onFavoriteToggle: (isNowFav) => handleFavoriteToggle(isNowFav, item),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar.appBar("Medical Calculators"),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: ListView(
//           children: [
//             const SizedBox(height: 10),
//             CustomTextField.searchField(
//               OnTap: () {},
//               (value) {
//                 setState(() {});
//               },
//               controller: searchController,
//               hint: "Search medical calculators",
//               padding: const EdgeInsets.only(right: 5),
//             ),
//             const SizedBox(height: 16),
//             if (favoriteItems.isNotEmpty && searchController.text.isEmpty) ...[
//               Text(
//                 "Favorite",
//                 style: GoogleFonts.almarai(
//                   fontSize: 18,
//                   color: CustomColors.darkBlue2,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               ...favoriteItems.map(buildCardItem),
//               const SizedBox(height: 16),
//             ],
//             Text(
//               "Most important medical calculations ",
//               style: GoogleFonts.almarai(
//                 fontSize: 18,
//                 color: CustomColors.darkBlue2,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             const SizedBox(height: 10),
//             ...filteredItems.map(buildCardItem),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _MedicalcalcScreenState extends State<MedicalcalcScreen> {
  final Calculationcontroller contr = Get.find();
  TextEditingController searchController = TextEditingController();

  List<Calculators> get calculators =>
      contr.getFavourite.data?.calculators ?? [];

  //the search query
  List<Calculators> get filteredItems {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) return calculators;
    return calculators
        .where((item) => (item.displayName  ?? '').toLowerCase().contains(query))
        .toList();
  }

  List<Calculators> get favoriteItems =>
      calculators.where((c) => c.isFavorite == true).toList();

  void handleFavoriteToggle(Calculators calculators) async {
    if (calculators.isFavorite != true) {
      await contr.addFavourites(calculators.name!, () {
        setState(() {
          calculators.isFavorite = true;
        });
      });
    } else {
      await contr.deleteFavourite(calculators.name!, () {
        setState(() {
          calculators.isFavorite = false;
        });
      });
    }
  }

  void navigateToPage(Calculators calculator) {
    final name = calculator.name?.toLowerCase();

    if (name == null) return;

    if (name == "bmi") {
      Get.to(BmicalcScreen());
    } else if (name == "pregnancy-tracker") {
      Get.toNamed(CustomPage.dueDatePage);
    } else if (name == "diabetes-calculator") {
      Get.toNamed(CustomPage.diabetes1Page);
    } else if (name == "ibs-symptom-assessment") {
      Get.toNamed(CustomPage.ibsPage1);
    } else if (name == "period-calculator") {
      Get.toNamed(CustomPage.ovulatePage);
    } else {
      // fallback page or nothing
      print("No matching page found.");
    }
  }

  Widget buildCardItem(Calculators calculator) {
   // int index = calculators.indexOf(calculator);
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: CardItem(
        image: calculator.icon ?? 'assets/images/BMI.png',
        title: calculator.displayName ?? 'Name',
        subTitle: calculator.description ?? 'Description',
        onPress: () => navigateToPage(calculator),
        fav: () => handleFavoriteToggle(calculator),
        isFavourite: calculator.isFavorite ?? false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.medicalCalc.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SmartRefresher(
          controller: contr.refreshControllerr,
          onRefresh: contr.onRefresh,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              CustomTextField.searchField(
                (value) => setState(() {}),
                controller: searchController,
                hint: CustomTrans.searchmedicalcalculators.tr,
                padding: const EdgeInsets.only(right: 5),
                OnTap: () {},
              ),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: contr.obx((state) {
                    GetFavourites getFavourites = state!;
                    List<Calculators> data = getFavourites.data?.calculators ?? [];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (favoriteItems.isNotEmpty &&
                            searchController.text.isEmpty) ...[
                          Text(
                            CustomTrans.favorite.tr,
                            style: GoogleFonts.almarai(
                              fontSize: 18,
                              color: CustomColors.darkBlue2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...favoriteItems.asMap().entries.map((entry) {
                            return buildCardItem(entry.value);
                          }).toList(),
                        ],
                        Text(
                      CustomTrans.mostimportantmedicalcalculations.tr,
                          style: GoogleFonts.almarai(
                            fontSize: 18,
                            color: CustomColors.darkBlue2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...List.generate(filteredItems.length, (index) {
                          final item = filteredItems[index];
                          return CardItem(
                            image: item.icon ?? 'assets/images/BMI.png',
                            title: item.displayName ?? 'Medical Calculators',
                            subTitle: item.description ?? '',
                            onPress: () => navigateToPage(item),
                            fav: () => handleFavoriteToggle(item),
                            isFavourite: item.isFavorite ?? false,
                          );
                        }),
                      ],
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
