import 'package:abg/data/const/export.dart';
import 'package:abg/features/auth/domain/controller/auth_controller.dart';
import 'package:abg/features/group/domain/controller/group_controller.dart';
import 'package:abg/features/home/domain/controller/home_controller.dart';
import 'package:abg/features/layout/domain/controller/layout_controller.dart';

class GetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainGetxController(), permanent: true);
    Get.put(LayoutController(), permanent: true);
    Get.put(LoadingGetxController(), permanent: true);
    Get.put(AuthController());
    Get.put(HomeController());
    Get.put(GroupController());
  }
}
