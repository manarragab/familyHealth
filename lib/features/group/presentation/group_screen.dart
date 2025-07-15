import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/group/group_model.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/group/domain/controller/group_controller.dart';
import 'package:abg/features/home/presentation/widget/dentistry_card.dart';

class GroupScreen extends GetView<GroupController> {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.myGroup.tr),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Share good news with friends....",
              style: TFonts.textTitleStyle(),
            ),
          ),
          controller.obx((state) {
            GroupModel model = state;
            return Column(
              children: [
                ...List.generate(model.data?.myGroups?.length ?? 0, (index) {
                  return MyGroupCard(data: model.data!.myGroups![index],
                  isJoined: true,
                  );
                }),
                const SizedBox(height: 10),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Suggested groups",
                    style: TFonts.textTitleStyle(),
                  ),
                ),
                ...List.generate(model.data?.suggestedGroups?.length ?? 0,
                    (index) {
                  return MyGroupCard(data: model.data!.suggestedGroups![index],
                  isJoined: false,
                  );
                }),
              ],
            );
          }),
        ],
      ),
    );
  }
}
