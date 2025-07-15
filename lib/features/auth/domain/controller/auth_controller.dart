import 'dart:io';

import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/logout/post_logout.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/auth/users/get_user_data.dart';
import 'package:abg/data/models/auth/users/post_assign_user.dart';
import 'package:abg/data/models/auth/users/post_register_response.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/auth/domain/controller/otp_controller.dart';
import 'package:abg/features/auth/presentation/otp_confirmation_view.dart';
import 'package:abg/features/auth/presentation/reset_password_screen.dart';
import 'package:abg/res/router/pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AuthController extends MainGetxController with  CustomStateMixin{
  final otpController = Get.put(OTPController());
  PostRegister postRegister = PostRegister();
  ResponseRegister postRegisterResponse =
      ResponseRegister();
 TextEditingController phoneController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 TextEditingController nameController = TextEditingController();
 TextEditingController dateController= TextEditingController();
 TextEditingController genderController= TextEditingController();
MainGetxController mainController=Get.find();
File? imageUrl;
  RefreshController refreshController = RefreshController();
//Future<ResponseModel<User?>> get user => sl<AuthCases>().getUserData();

int _page = 1;


GetUserData model=GetUserData();
  onRefresh() async {
    model = await refreshData(
      model: model,
      futureMethod: () => sl<AuthCases>().getUserData(),
      controller: refreshController,
      checkIfEmpty: (data) {
        if (data is GetUserData) {
          if ((data.data?.name ?? '').isEmpty) {
            data.status = StatusType.empty.index;
          }
        }
        return data;
      },
      getPage: (page) => _page = page,
    );
    //  CustomAlarm().clearAll();
    //  model.data?.forEach((e) {
    //    CustomAlarm().addAlarm(e);
    //  });
  }

  // @override
  // void onClose() {
  //   for (TextEditingController controller in [
  //     phoneController,
  //     passwordController,
  //     emailController,
  //     nameController,
  //   ]) {
  //     controller.dispose();
  //   }
  //   super.onClose();
  // }

  clearData() {
    postRegister = PostRegister();
  }

  String email = "";
  String password = "";
  String phone = "";
  String name = "";

  LoginModel loginModel = LoginModel(data: LoginData());

  String code = '';
  String min = '00';
  String second = '00';
  bool startCounting = false;

  bool rememberMe = false;
  login() async {
    sPrint.info('login');
    loadingGetxController.showLoading();

    var response = await sl<AuthCases>()
        .login(postRegister.email ?? "", postRegister.password ?? "");

    loadingGetxController.hideLoading();

    statusError.checkStatus(
      response,
      () {
        loginModel = response as LoginModel; // ✅ خذ الـ data من ResponseModel
        sPrint.info('response data:: ${response.toJson()}');
        sPrint.info('login data:: ${loginModel.toJson()}');
        sl<AuthCases>().setUser(loginModel);
        Get.offAllNamed(CustomPage.layoutPage);
      },
      onError: (msg) {
        Get.snackbar("خطأ", msg ?? "فشل تسجيل الدخول");
      },
    );
  }


  register() async {
    sPrint.info('login');
    // must show loading
    loadingGetxController.showLoading();

    // user auth cases for api link or storage
    //todo no need for password wait to call the client to know why there is screen for change password
    var response = await sl<AuthCases>().register(postRegister);
    sPrint.info("responseeeeeeeeeeeeeeee  $response");
    // must end loading
    loadingGetxController.hideLoading();

    statusError.checkStatus(
      response,
      () {
        loginModel = response as LoginModel;
        sPrint.info('login data:: ${loginModel.data?.toJson()}');
        print("User name: ${loginModel.data?.name}");
print("User email: ${loginModel.data?.email}");


        sl<AuthCases>().setUser(loginModel);
        print("Token: ${loginModel.token }");

        Get.offAllNamed(CustomPage.layoutPage);
        /*   sPrint.info('getting success login');
      Get.put(OTPController()).startCount();
      Get.to(() => OtpConfirmationView(
          getCode: (code) => getCode(code), resendCode: resendOTP));*/
      },
      onError: (msg) {},
      // stateMixin:
    );
  }

  /* signOut() async {
    if (sl<AuthCases>().getUser() != null) {
      loadingGetxController.showLoading();
      ResponseModel? response = await sl<AuthCases>().signOut();
      loadingGetxController.hideLoading();
      statusError.checkStatus(response, () {
        sl<AuthCases>().setUser(null);
        Get.back();
      }, onError: (msg) {
        sl<AuthCases>().setUser(null);
        Get.back();
      });
    } else {
      Get.back();
    }
  }*/

  getCode({bool moveTo = false}) async {
    sPrint.info('code:: $code');
    loadingGetxController.showLoading();
    var response = await sl<AuthCases>().getCode(postRegister.email ?? "");
    loadingGetxController.hideLoading();
    return statusError.checkStatus(
      response,
      () {
        Get.put(OTPController()).startCount();
        if (moveTo) {
          Get.to(() => OtpConfirmationView(
              getCode: (code) {
                checkCode(code);
              },
              resendCode: () => getCode(moveTo: false)));
        }
      },
      onError: (msg) {
        showToast("email not found", MessageErrorType.error);
      },
      showErrorToast: false,
    );
  }

  checkCode(String code) async {
    loadingGetxController.showLoading();
    var response =
        await sl<AuthCases>().checkCode(code, postRegister.email ?? "");
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      loginModel = response as LoginModel;
      sl<AuthCases>().setUser(loginModel);
      Get.off(() => ResetPasswordScreen(), transition: Transition.fadeIn);
    });
  }

PostLogout postLogout = PostLogout();
  void logOut() {
    sl<AuthCases>().signOut(postLogout);
    //sl<AuthCases>().setUser(null);
   // clearData();
    Get.offAllNamed(CustomPage.loginPage);
  }

  void setPassword() async {
    loadingGetxController.showLoading();
    var response = await sl<AuthCases>()
        .resetPassord(password: postRegister.password ?? "");
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      Get.offAllNamed(CustomPage.loginPage);
    });
  }

  void updateMyAccountScreen() {
    postRegister = PostRegister(
        name: user?.name ?? "",
        email: user?.email ?? "",
        phone: user?.phone ?? "");
  }

  void updateProfileImage(File file) async {
    loadingGetxController.showProgress();
    var response = await sl<AuthCases>().uploadProfileImage(file);
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      sPrint.info("image:::::::: ${response.data}");
      loginModel = sl<AuthCases>().getUser()!;
      loginModel.data?.image = response.data;
      sl<AuthCases>().setUser(loginModel);
      Future.delayed(const Duration(milliseconds: 50), () {
        update();
      });
    });
  }

  void updateProfile() async {
    loadingGetxController.showProgress();
    var response = await sl<AuthCases>().editProfile(PostEditProfile(
      name: postRegister.name ?? "",
      email: postRegister.email ?? "",
      phone: postRegister.phone ?? "",
      dateOfBirth: postRegister.dateOfBirth ?? DateTime.now(),
      password: postRegister.password ?? "",
      gender: postRegister.gender ?? "",
      image: postRegister.image,
    ));
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      loginModel = response as LoginModel;
      sl<AuthCases>().setUser(loginModel);
      Future.delayed(const Duration(milliseconds: 50), () {
        update();
      });
    });
  }

  void changeRememberMe() {
    rememberMe = !rememberMe;
  }
}
