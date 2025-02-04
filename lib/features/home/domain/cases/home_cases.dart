import 'package:abg/data/models/home/home_model.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class HomeCases {
  DomainData _data;

  HomeCases(this._data);

  Future<ResponseModel<HomeData?>> home() {
    return _data.home();
  }
}
