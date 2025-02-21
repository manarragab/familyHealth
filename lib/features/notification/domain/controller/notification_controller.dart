import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/notification/NotificationModel.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationController extends MainGetxController with CustomStateMixin {
  RefreshController refreshController = RefreshController();
  NotificationModel model = NotificationModel(
      status: 1, data: [NotificationData(title: "title", description: "des")]);
  final int _page = 1;

  onRefresh() async {
    change(model);
    // model = await refreshData(
    //   model: model,
    //   futureMethod: () => sl<NotificationCases>().notification(1.toString()),
    //   controller: refreshController,
    //   getPage: (page) => _page = page,
    // );
  }

  onLoadMore() async {
    //  model = await loadMoreData(
    //    model: model,
    //    futureMethod: () =>
    //        sl<NotificationCases>().notification(_page.toString()),
    //    controller: refreshController,
    //    getPage: (page) => _page = page,
    //    addModel: (data) {
    //      if (data is NotificationModel) {
    //        model.data = model.data! + (data.data ?? []);
    //        model.more = data.more;
    //      }
    //    },
    //    page: _page,
    //  );
  }
}
