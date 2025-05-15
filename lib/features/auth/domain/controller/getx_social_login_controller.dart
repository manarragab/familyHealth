import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/social/social_model.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/res/router/pages.dart';

import 'authenticate_methods.dart';

class GetXSocialLoginController extends MainGetxController {
//  sl<AuthCase>().login(phone: '', password:'' );

  LoginModel? loginModel;

  socialLogin(SocialType socialType) async {
    loadingGetxController.showLoading();
    SocialModel? socialModel;
    switch (socialType) {
      case SocialType.apple:
        socialModel = await AuthenticateMethods().singInWithApple();
        break;
      case SocialType.facebook:
        socialModel = await AuthenticateMethods().signInWithFacebook();
        break;
      case SocialType.google:
        socialModel = await AuthenticateMethods().signWithGoogle();
        break;
    }
    sPrint.info('login');
    // must show loading
    if (socialModel == null) {
      loadingGetxController.hideLoading();
      showToast(
          "can't connect to your ${socialType.name}", MessageErrorType.error);
      return;
    }
    //todo user auth cases for api link or storage

    var response = await sl<AuthCases>().socialLogin(socialModel);

    // must end loading
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
   sPrint.info('success social login');
      loginModel = response as LoginModel;
      sPrint.info(loginModel?.toJson());
      sl<AuthCases>().setUser(loginModel);
      Get.toNamed(CustomPage.layoutPage);
    });
  }

  signOut() async {
    await AuthenticateMethods().signOutFromGoogle();
    await AuthenticateMethods().signOutFromFacebook();
  }
}
