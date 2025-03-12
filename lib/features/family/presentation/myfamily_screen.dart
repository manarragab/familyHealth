import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_MD.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';
import 'package:abg/features/family/presentation/widget/greyContainer_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyfamilyScreen extends GetView<FamilyController> {
  const MyfamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myFamily.tr),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: controller.obx((state) {
            FamilyModel model=state;
             List<Family> data=model.data?? [];
            return SmartRefresher(
              controller: controller.ref,
              onRefresh: controller.onRefresh,
              child: ListView.separated(
                itemCount: data.length,
                separatorBuilder: (context,index)=> const SizedBox(height: 10,),
                itemBuilder:  (context, index) {
                  Family fam=data[index];
                  return GreycontainerItem(
                    image: fam.image??"",
                    name: fam.name??"",
                    kind: fam.relative??"",
                    age: fam.age??1,
                  );
                },
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
