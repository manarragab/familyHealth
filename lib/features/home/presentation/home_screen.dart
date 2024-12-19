import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/transfer/get_transfer/Transfer.dart';
import 'package:abg/data/models/transfer/get_transfer/TransferModel.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:
            CustomImage.asset("assets/svg/kaptan.svg", width: 125, height: 30),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: CustomColors.primary,
              size: 25,
            ),
          ),
        ],
      ),
      body: controller.obx((state) {
        TransferModel model = state;
        Map<String, List<Transfer>> transfers =
            convertToDesign(model.data ?? []);
        sPrint.info("dates lenght::${transfers.keys.length}");
        return LoadingOverLay(
          child: SmartRefresher(
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
                    customDivider(e.key),
                    ...List.generate(e.value.length, (index) {
                      return Container();
                    })
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: transfers.entries.length,
            ),
          ),
        );
      }, onTap: controller.onRefresh),
    );
  }
}

Widget customDivider(String date) {
  return Row(
    children: [
      const Expanded(
          child: Divider(
        color: Color(0xffCED7DE),
        height: 4,
        thickness: 3,
      )),
      const SizedBox(width: 10),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xffE3E3E3)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          date,
          style: TFonts.inter(color: CustomColors.black),
        ),
      ),
      const SizedBox(width: 10),
      const Expanded(
          child: Divider(
        color: Color(0xffCED7DE),
        height: 4,
        thickness: 3,
      )),
    ],
  );
}

Map<String, List<Transfer>> convertToDesign(List<Transfer> list) {
  Map<String, List<Transfer>> details = {};
  list.forEach((e) {
    try {
      DateTime dateTime = DateTime.parse(e.startDate ?? "");
      List<Transfer> data = details[dateTime.stringDate] ?? [];
      data.add(e);
      details[dateTime.stringDate] = data;
    } catch (e, s) {
      sPrint.error(e, s);
    }
  });
  sPrint.info('dates:: ${details.keys}');
  return details;
}
