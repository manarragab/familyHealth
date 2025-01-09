import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/transfer/get_transfer/Transfer.dart';
import 'package:abg/data/models/transfer/get_transfer/TransferModel.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/search/domain/controller/search_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchScreen extends GetView<SearchGetxController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.history.tr),
      body: controller.obx((state) {
        TransferModel model = state;
        Map<String, List<Transfer>> transfers = {};
        // convertToDesign(model.data ?? []);
        sPrint.info("dates lenght::${transfers.keys.length}");
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoadMore,
          enablePullUp: true,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final e = transfers.entries.toList()[index];
              return Column(
                children: [
                  //customDivider(e.key),
                  ...List.generate(e.value.length, (index) {
                    return Container();
                  })
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: transfers.entries.length,
          ),
        );
      }, onTap: controller.onRefresh),
    );
  }
}
