import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/widget/greyContainer_item.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:abg/res/router/pages.dart';

class MyfamilyScreen extends GetView<FamilyController> {
   const MyfamilyScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.family.tr),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: controller.obx((state) {
  final model = state;
  List<Family> data = model?.data ?? [];

  return ListView.separated(
    itemCount: data.length,
    separatorBuilder: (_, __) => const SizedBox(height: 10),
    itemBuilder: (_, index) {
      final fam = data[index];
      //final id = fam.id.toString();
      return LoadingOverLay(
      id: fam.id.toString(),
        showLoadingOnly: true,
        child: GreycontainerItem(
          key: ValueKey(fam.id),
          image: fam.image ?? "",
          name: fam.name ?? "",
          kind: fam.relative ?? "",
          age: fam.age ?? 1,
          onDelete: () async {
            await controller.deleteFamily(fam.id!);
          },
          
        ),
      );
    },
  );
})),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          controller.clearData();
          Get.toNamed(CustomPage.addFamilyPage);
         
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
