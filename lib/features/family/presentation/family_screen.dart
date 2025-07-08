import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FamilyScreen extends StatefulWidget {
  const FamilyScreen({super.key});

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  
  RefreshController refreshController = RefreshController();
  FamilyController control = Get.find();

  int selectedIndex = -1;
  late FamilyModel model;
  
  List<Family> get _filteredFamilyImages {
  final model = control.state;
  if (model == null) return [];
  final data = model.data ?? [];
  return data.where((f) => f.relative == FamilyType.values[selectedIndex].name).toList();
}

@override
void initState() {
  super.initState();
  control.reset();
}


  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myFamily.tr),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: control.obx((state) {
//           model = state;
//           List<Family> list=model.data??[];
//           return ListView(
//             children: [
//               _buildFamilyTypeGrid(),
//               const SizedBox(height: 14),
//               selectedIndex== -1 || _filteredFamilyImages.isEmpty  ? const SizedBox(): _buildImageStack(),
//               const SizedBox(height: 17),
//               _buildinfoersTitle(),
//               const SizedBox(height: 10),
//               _buildFamilyList(list),
//             ],
//           );
//         }),
//       ),
//     );
//   }

//   Widget _buildFamilyTypeGrid() {
//     return SizedBox(
//       height: 100,
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           mainAxisExtent: 40,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 12,
//         ),
//         itemCount: FamilyType.values.length,
//         itemBuilder: (context, index) {
//           return FamilytypeContainer(
//             index: index,
//             tapped: () => setState(() => selectedIndex = index),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildImageStack() {
//     return Stack(
//       children: [
//         _buildImageContainer(),
       
//         _buildImageLabel(),
//       ],
//     );
//   }


//  Widget _buildImageContainer() {
//   final matchingImages = _filteredFamilyImages;

//   if (matchingImages.isEmpty) {
//     return Container(
//       height: 350,
//       width: double.infinity,
//       clipBehavior: Clip.hardEdge,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(32),
//       ),
//       child: Image.asset("assets/images/cheker.png", fit: BoxFit.cover),
//     );
//   }

//   return SizedBox(
//     height: 350,
//     child: PageView.builder(
//       itemCount: matchingImages.length,
//       itemBuilder: (context, index) {
//         final fam = matchingImages[index];
//         return InkWell(
//           onTap: () {
//             Get.to(ProfilefamilyScreen(
//               image: fam.image ?? "",
//               title: fam.name ?? "",
//               age: fam.age ?? 1,
//               kind: FamilyType.values[selectedIndex].name ,
//             ));
//           },
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 4),
//             clipBehavior: Clip.hardEdge,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(32),
//             ),
//             child: CustomImage.network(
//               fam.image ?? "",
//               fit: BoxFit.cover,
//               ),
//           ),
//         );
//       },
//     ),
//   );
// }

//   Widget _buildImageLabel() {
//     return Positioned(
//       bottom: 20,
//       left: 20,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         height: 30,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Center(
//           child: Text(
//             FamilyType.values[selectedIndex].name,
//             style: GoogleFonts.almarai(
//               fontSize: 16,
//               fontWeight: FontWeight.w700,
//               color: CustomColors.lighttblue,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildinfoersTitle() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
//       children: [
//         Text(
//           "Reminders",
//           style: GoogleFonts.almarai(
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//             color: CustomColors.darkblue,
//           ),
//         ),
// InkWell(
//   onTap: (){
//     if(selectedIndex==-1){
//       Get.to(AddReminders(person:  "" ,));
//       }
//     Get.to(AddReminders(person:  FamilyType.values[selectedIndex].name ,));
//     print("personnnnnnn ${FamilyType.values[selectedIndex].name}");
//   },
//   child: Container(
//   padding: EdgeInsets.symmetric(horizontal: 10),
//       height: 30,
//           width: Get.width/2.3,
//           //clipBehavior: Clip.hardEdge,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             color: CustomColors.grey6,
        
//           ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//          Text(
//               "Add Reminders",
//               style: GoogleFonts.almarai(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//                 color: CustomColors.darkblue,
//               ),
//             ),
//            Spacer(),
//         Container(
//           height: 20,
//           width: 20,
//           //clipBehavior: Clip.hardEdge,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             color: CustomColors.primary,
        
//           ),
//           child: Icon(Icons.add, color: Colors.white, size: 18,),),
//       ],
//     ),
//   ),
// ),

        
//       ],
//     );
//   }
  

//   Widget _buildFamilyList(List<Family> list) {
//     return SizedBox(
//       height: 132,
//       child: SmartRefresher(
//         controller: refreshController,
//         onRefresh: () async {
//           await control.onRefresh();
//           refreshController.refreshCompleted();
//         },
//         child: ListView.builder(
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemCount: list.length,
//           itemBuilder: (context, index) {
//             Family info = list[index];
//             return Container(
//               margin: const EdgeInsets.all(8),
//               child: FamilyContainer(
//                 index: index,
//                 name: info.name ?? "",
//                 relation: info.relative ?? "",
//                 title: info.birthDate ?? "",
//                // dosage: "Not found",
//               //  time: info.createdAt ?? "",
//                 image: info.image ?? "",
//                 whenGetIT: 'After lunch',
//                 time: info.birthDate ?? "nn",
//               ),
//             );
//           },
//         )
//       ),

   );
  }
}
