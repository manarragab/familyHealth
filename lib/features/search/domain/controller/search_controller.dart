import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/transfer/get_transfer/TransferModel.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/search/domain/cases/search_cases.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchGetxController extends MainGetxController with CustomStateMixin {
  TransferModel model = TransferModel();
  RefreshController refreshController = RefreshController();

  int _page = 1;

  onRefresh() async {
    model = await refreshData(
      model: model,
      futureMethod: () => sl<SearchCase>().getHistory(page: 1),
      controller: refreshController,
      checkIfEmpty: (data) {
        if (data is TransferModel) {
          if (data.data?.isEmpty ?? true) {
            data.status = StatusType.empty.index;
          }
        }
        return data;
      },
      getPage: (page) => _page = page,
    );
  }

  onLoadMore() async {
    model = await loadMoreData(
      model: model,
      futureMethod: () => sl<SearchCase>().getHistory(page: _page),
      controller: refreshController,
      getPage: (page) => _page = page,
      addModel: (data) {
        if (data is TransferModel) {
          model.data = model.data! + (data.data ?? []);
        }
        return model;
      },
      page: _page,
    );
  }
}
