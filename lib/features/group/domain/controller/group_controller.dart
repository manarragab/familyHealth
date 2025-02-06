import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/group/group_model.dart';
import 'package:abg/data/models/group/groups.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/group/domain/cases/group_case.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GroupController extends MainGetxController with CustomStateMixin {
  GroupModel model = GroupModel();
  RefreshController refreshController = RefreshController();

  onRefresh() async {
    model = await refreshData(
        model: model,
        futureMethod: () => sl<GroupCase>().groups(),
        controller: refreshController,
        getPage: (_) => _);
  }

  void joinGroup(Groups data) async {
    loadingGetxController.showLoading();
    var response = await sl<GroupCase>().joinGroup(data.id.toString());
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      onRefresh();
      Get.put(HomeController()).onRefresh();
    });
  }
}
