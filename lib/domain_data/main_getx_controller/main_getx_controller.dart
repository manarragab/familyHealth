import 'dart:async';

import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';

import '../custom_mixin/mixen_widgets/status_error.dart';

class MainGetxController extends GetxController {
  StatusError statusError = StatusError();
  Timer? t;

  LoadingGetxController loadingGetxController =
      Get.put(LoadingGetxController());

  bool get isLogin => sl<AuthCases>().getUser() != null;
  User? get user => sl<AuthCases>().getUser()?.data?.user;

  customDebounce(
      {Duration duration = const Duration(milliseconds: 500),
      required Function() getData}) {
    if (t == null) {
      sPrint.info('timer:: t == null');
      t = Timer(duration, () {
        getData();
      });
    } else if (t!.isActive) {
      sPrint.info('timer:: t!.isActive');
      t!.cancel();
      t = Timer(duration, () {
        getData();
      });
    } else {
      sPrint.info('timer:: else');
      t!.cancel();
      t = Timer(duration, () {
        getData();
      });
    }
  }
}

enum LoadingType { show, hide, error, progress, loadingIcon }

class LoadingGetxController extends GetxController {
  LoadingType loadingType = LoadingType.hide;

  String progress = '0.0 %';

  bool get isLoading =>
      loadingType != LoadingType.hide || loadingType != LoadingType.error;

  setProgress(String progress) {
    this.progress = progress;
    update([loadingID]);
  }

  showProgress() {
    loadingType = LoadingType.progress;
    update([loadingID]);
  }

  showLoadingIcon() {
    loadingType = LoadingType.loadingIcon;
    update([loadingIconID]);
  }

  showLoading() {
    sPrint.info('start loading');
    loadingType = LoadingType.show;
    update([loadingID]);
  }

  showCustomLoading(String id) {
    sPrint.info('start loading');
    loadingType = LoadingType.show;
    update([id]);
  }

  hideCustomLoading(String id) {
    sPrint.info('end loading');
    loadingType = LoadingType.hide;
    update([loadingID, loadingIconID, id]);
  }

  Future hideLoading() async {
    sPrint.info('end loading');
    loadingType = LoadingType.hide;
    update([loadingID, loadingIconID]);
  }

  showError() {
    sPrint.info('show error');
    loadingType = LoadingType.error;
    update([loadingID, loadingIconID]);
  }
}
