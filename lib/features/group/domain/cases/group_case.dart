import 'package:abg/data/models/group/group_model.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';

class GroupCase {
  DomainData _data;

  GroupCase(this._data);

  Future<ResponseModel<GroupData?>> groups() {
    return _data.groups();
  }
}
