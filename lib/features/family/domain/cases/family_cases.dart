import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_MD.dart';
import 'package:abg/data/remote_data/response_model.dart';
import 'package:abg/domain_data/repositories/domain_repositry.dart';


class FamilyCases {
  final DomainData _data;

  FamilyCases(this._data);

  
  Future<ResponseModel<List<Family>?>> getFamily(){
    return _data.getFamily();
  }

  Future<ResponseModel<Family?>> addFamily(PostFamilyModel post) {
    return _data.addFamily(post);
  }

  Future<ResponseModel> deleteFamily(int id) {
    return _data.deleteFamily(id);
  }

}
