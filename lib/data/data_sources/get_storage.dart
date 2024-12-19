import 'package:abg/data/models/auth/login/LoginModel.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageData {
  GetStorage getStorage;

  GetStorageData(this.getStorage);

  final String _user = 'user';
  final String _userChat = 'user_chat';

  LoginModel? getUser() {
    if (getStorage.hasData(_user)) {
      LoginModel login = LoginModel.fromJson(getStorage.read(_user));
      // Print.info('login db:: ${login.toJson()}');
      return login;
    } else {
      return null;
    }
  }

  setUser(LoginModel? loginModel) {
    //  Print.info('insert user:: ${loginModel?.toJson()}');
    getStorage.write(_user, loginModel?.toJson());
  }
}
