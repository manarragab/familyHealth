import 'dart:convert';
import 'dart:io';

import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:abg/data/models/auth/users/PostEditProfile.dart';
import 'package:abg/data/models/auth/users/post_assign_user.dart';
import 'package:abg/data/models/auth/users/post_register_response.dart';
import 'package:abg/features/auth/domain/cases/auth_case.dart';
import 'package:abg/features/auth/domain/controller/otp_controller.dart';
import 'package:abg/features/auth/presentation/otp_confirmation_view.dart';
import 'package:abg/features/auth/presentation/reset_password_screen.dart';
import 'package:abg/features/layout/domain/controller/layout_controller.dart';
import 'package:abg/res/router/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends MainGetxController {
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

File? imageUrl;

// void onInit() {
  
//     imageUrl = postRegister.image;
//     super.onInit();
//   }



  File? imageFile;

String? namee;
 


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
    // must show loading
    loadingGetxController.showLoading();

    // user auth cases for api link or storage
    //todo no need for password wait to call the client to know why there is screen for change password
    var response = await sl<AuthCases>()
        .login(postRegister.email??"", postRegister.password??"");
    sPrint.info(response);
    // must end loading
    loadingGetxController.hideLoading();

    statusError.checkStatus(
      response,
      () {
        loginModel = response;
        sPrint.info('response data:: ${response.toJson()}');
        sPrint.info('login data:: ${loginModel.toJson()}');
        sl<AuthCases>().setUser(loginModel);
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

  register() async {
    sPrint.info('login');
    // must show loading
    loadingGetxController.showLoading();

    // user auth cases for api link or storage
    //todo no need for password wait to call the client to know why there is screen for change password
    var response = await sl<AuthCases>().register(postRegister);
    sPrint.info(response);
    // must end loading
    loadingGetxController.hideLoading();

    statusError.checkStatus(
      response,
      () {
        loginModel = response as LoginModel;
        sPrint.info('login data:: ${loginModel.toJson()}');
        sl<AuthCases>().setUser(loginModel);
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
    var response = await sl<AuthCases>().getCode(postRegister.email??"");
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
    var response = await sl<AuthCases>().checkCode(code, postRegister.email??"");
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      loginModel = response as LoginModel;
      sl<AuthCases>().setUser(loginModel);
      Get.off(() => ResetPasswordScreen(), transition: Transition.fadeIn);
    });
  }

  void logOut() {
    sl<AuthCases>().setUser(null);
    clearData();
    Get.offAllNamed(CustomPage.loginPage);
  }

  void setPassword() async {
    loadingGetxController.showLoading();
    var response =
        await sl<AuthCases>().resetPassord(password: postRegister.password??"");
    loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      Get.offAllNamed(CustomPage.loginPage);
    });
  }

  void updateMyAccountScreen() {
    postRegister = PostRegister(name: user?.name ?? "",email: user?.email ?? "",phone:user?.phone ?? "" );
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
      firstName: postRegister.name??"",
      lastName: "",
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
