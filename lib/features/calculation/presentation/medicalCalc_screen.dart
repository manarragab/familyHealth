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

  /// Returns the entire list of calculators from the controller
  List<Calculators> get calculators =>
      contr.getFavourite.data?.calculators ?? [];

  /// List of filtered items based on the search query
  List<Calculators> get filteredItems {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) return calculators;
    return calculators
        .where((item) => (item.displayName ?? '').toLowerCase().contains(query))
        .toList();
  }

  List<Calculators> get favoriteItems =>
      calculators.where((c) => c.isFavorite == true).toList();

  void handleFavoriteToggle(Calculators item, int index) async {
    setState(() {
      item.isFavorite = !(item.isFavorite ?? false);
    });

    CalculationTypes? type;
    switch (index) {
      case 0:
        type = CalculationTypes.bmi;
        break;
      case 1:
        type = CalculationTypes.pregnancyTracker;
        break;
      case 2:
        type = CalculationTypes.diabetesCalculator;
        break;
      case 3:
        type = CalculationTypes.ibsSymptomAssessment;
        break;
      case 4:
        type = CalculationTypes.periodCalculator;
        break;
    }

    if (type != null) {
      if (item.isFavorite == true) {
        await contr.addFavourites(type);
      } else {
        await contr.deleteFavourite(type.name);
      }
    }
  }

  void navigateToPage(int index) {
    switch (index) {
      case 0:
        Get.to(BmicalcScreen());
        break;
      case 1:
        Get.toNamed(CustomPage.dueDatePage);
        break;
      case 2:
        Get.toNamed(CustomPage.diabetes1Page);
        break;
      case 3:
        Get.toNamed(CustomPage.ibsPage1);
        break;
      case 4:
        Get.toNamed(CustomPage.caloriePage);
        break;

      // case 5:
      //   Get.toNamed(CustomPage.waterPage);
      //   break;
      // case 6:
      //   Get.toNamed(CustomPage.ovulatePage);
      //   break;
    }
  }

  Widget buildCardItem(Calculators item, int index) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: contr.obx((state) {
          GetFavourites getFavourites = state!;
          List<Calculators> data = getFavourites.data?.calculators ?? [];
          return CardItem(
            image: contr.calcImages[index],
            title: item.displayName ?? 'Name',
            subTitle: item.description ?? 'Description',
            onPress: () => navigateToPage(index),
            fav: () => handleFavoriteToggle(item, index),
          );
        }));
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
                hint: "Search medical calculators",
                padding: const EdgeInsets.only(right: 5),
                OnTap: () {},
              ),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: contr.obx((state) {
                    GetFavourites getFavourites = state!;
                    List<Calculators> data =
                        getFavourites.data?.calculators ?? [];
                    return Column(
                      children: [
                        if (favoriteItems.isNotEmpty &&
                            searchController.text.isEmpty) ...[
                          Text(
                            "Favorite",
                            style: GoogleFonts.almarai(
                              fontSize: 18,
                              color: CustomColors.darkBlue2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...favoriteItems.asMap().entries.map((entry) {
                            int mainIndex = calculators.indexOf(entry.value);
                            return buildCardItem(entry.value, mainIndex);
                          }).toList(),
                          const SizedBox(height: 16),
                        ],
                        ...List.generate(data.length, (index) {
                          return CardItem(
                            image: data[index].icon ?? 'assets/images/BMI.png',
                            title: data[index].displayName ??
                                'Medical Calculators',
                            subTitle: data[index].description ?? '',
                            // isFavorite: item.isFavorite ?? false,
                            // onTap: () => navigateToPage(index),
                            // onFavoriteToggle: (isNowFav) => handleFavoriteToggle(item, index),
                          );
                        }),
                        Text(
                          "Most important medical calculations",
                          style: GoogleFonts.almarai(
                            fontSize: 18,
                            color: CustomColors.darkBlue2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        //   Text(
                        //  calculators[0].displayName ?? 'Medical Calculators',
                        //   style: GoogleFonts.almarai(
                        //     fontSize: 18,
                        //     color: CustomColors.darkBlue2,
                        //     fontWeight: FontWeight.w700,
                        //   ),
                        // ),
                        const SizedBox(height: 10),

                        ...filteredItems.asMap().entries.map((entry) {
                          int mainIndex = calculators.indexOf(entry.value);
                          return buildCardItem(entry.value, mainIndex);
                        }).toList(),
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
