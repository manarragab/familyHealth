import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/notification/NotificationModel.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/notification/domain/controller/notification_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.notifications.tr),
      body: controller.obx((state) {
        NotificationModel model = state;
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoadMore,
          child: ListView.separated(
            itemBuilder: (context, index) {
              NotificationData notification = model.data![index];
              return ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: CustomColors.primary,
                ),
                title: Text(notification.title ?? ""),
                subtitle: Text(notification.description ?? ""),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: model.data?.length ?? 0,
          ),
        );
      }),
    );
  }
}
