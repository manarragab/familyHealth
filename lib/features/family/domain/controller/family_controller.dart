import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/family/domain/cases/family_cases.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FamilyController extends MainGetxController with CustomStateMixin {


  FamilyModel famMD = FamilyModel();
  PostFamily postFam =PostFamily();
  RefreshController ref = RefreshController();

  int _pageNum = 1;

  onRefresh() async {
    famMD = await refreshData(
        model: famMD,
        futureMethod: () => sl<FamilyCases>().getFamily(),
        controller: ref,
        checkIfEmpty: (data) {
          if (data is FamilyModel) {
            if (data.data?.isEmpty ?? true) {
              data.status=StatusType.empty.index;
            }
          }
          return data;
        },

        //load refresh part with part
        getPage: (page) => _pageNum = page);
  }








}
