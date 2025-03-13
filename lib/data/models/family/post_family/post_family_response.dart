
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/remote_data/response_model.dart';

class PostFamilyResponse extends ResponseModel<Family?> {
    @override
  Family? data;
    @override
  num? status;
    @override
  String? message;

    PostFamilyResponse({this.data, this.status, this.message});

    PostFamilyResponse.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : Family.fromJson(json["data"]);
        status = json["status"];
        message = json["message"];
    }

    @override
 @override
Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    if (data != null) {
        result["data"] = data?.toJson();
    }
    result["status"] = status;
    result["message"] = message;
    return result;
}

}
