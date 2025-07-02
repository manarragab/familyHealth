import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/features/home/domain/cases/home_cases.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends MainGetxController with CustomStateMixin {
  RefreshController refreshController = RefreshController();
  TextEditingController searchController = TextEditingController();
LoginModel loginModel=LoginModel();
  HomeModel model = HomeModel();
  int _page = 1;

void onInit() {
    super.onInit();
    onRefresh();
  }

  onRefresh() async {
    model = await refreshData(
      model: model,
      futureMethod: () => sl<HomeCases>().home(),
      controller: refreshController,
      checkIfEmpty: (data) {
        // if (data is HomeModel) {
        //   if (data.data?.isEmpty ?? true) {
        //     data.status = StatusType.empty.index;
        //     sPrint.info('empty:: ${data.status}');
        //   }
        // }
        return data;
      },
      getPage: (page) => _page = page,
    );
    print("Family list count: ${model.data?.familyReminders?.length}");

  }
 RxDouble position = 0.0.obs; // نسبة من 0 إلى 1

  void updatePosition(double percent) {
    position.value = percent.clamp(0.0, 1.0);
  }

//   onRefresh() async {
//   final result = await refreshData(
//     model: model,
//     futureMethod: () => sl<HomeCases>().home(),
//     controller: refreshController,
//     checkIfEmpty: (data) => data,
//     getPage: (page) => _page = page,
    
//   );
//  loginModel = sl<AuthCases>().getUser()!;
//   if (result != null) {
//     model = result;
//   } else {
//     print("⚠️ رجعت null من السيرفر");
//     model = HomeModel(); // أو احتفظ بالقيمة القديمة
//   }

//   print("Family list count: ${model.data?.familyReminders?.length}");
// }

}
