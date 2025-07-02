
import 'package:abg/data/remote_data/response_model.dart';

class PostFavouriteResponse extends ResponseModel<Favourite?> {
  Favourite? data;
  num? status;
  String? message;

  PostFavouriteResponse({this.data, this.status, this.message});

  PostFavouriteResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Favourite.fromJson(json["data"]);
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status"] = status;
    _data["message"] = message;
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["calculator_name"] = calculatorName;
    _data["is_favorite"] = isFavorite;
    _data["action"] = action;
    return _data;
  }
}