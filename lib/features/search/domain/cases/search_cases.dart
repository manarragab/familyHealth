import 'package:abg/data/models/transfer/get_transfer/Transfer.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class SearchCase {
  DomainData _data;

  SearchCase(this._data);

  Future<ResponseModel<List<Transfer>?>> getHistory({int page = 1}) {
    return _data.getHistory(page: page);
  }
}
