import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/home/domain/cases/home_cases.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends MainGetxController with CustomStateMixin {
  RefreshController refreshController = RefreshController();

  HomeModel model = HomeModel();
  int _page = 1;

  onRefresh() async {
    model = await refreshData(
      model: model,
      futureMethod: () => sl<HomeCases>().home(),
      controller: refreshController,
      checkIfEmpty: (data) {
        /* if (data is HomeModel) {
          if (data.data?.isEmpty ?? true) {
            data.status = StatusType.empty.index;
            sPrint.info('empty:: ${data.status}');
          }
        }*/
        return data;
      },
      getPage: (page) => _page = page,
    );
  }
}
