
import 'package:abg/data/remote_data/response_model.dart';

class PostFavouriteResponse extends ResponseModel<Favourite?> {
  @override
  Favourite? data;
  @override
  num? status;
  @override
  String? message;

  PostFavouriteResponse({this.data, this.status, this.message});

  PostFavouriteResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Favourite.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(data != null) {
      data["data"] = data?.toJson();
    }
    data["status"] = status;
    data["message"] = message;
    return data;
  }
}

class Favourite {
  String? calculatorName;
  bool? isFavorite;
  String? action;

  Favourite({this.calculatorName, this.isFavorite, this.action});

  Favourite.fromJson(Map<String, dynamic> json) {
    calculatorName = json["calculator_name"];
    isFavorite = json["is_favorite"];
    action = json["action"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["calculator_name"] = calculatorName;
    data["is_favorite"] = isFavorite;
    data["action"] = action;
    return data;
  }
}