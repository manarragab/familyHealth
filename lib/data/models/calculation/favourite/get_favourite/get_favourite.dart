import 'package:abg/data/remote_data/response_model.dart';

class GetFavourites extends ResponseModel<Favourites?> {
  @override
  Favourites? data;
  num? status;
  String? message;

  GetFavourites({this.data, this.status, this.message});

  GetFavourites.fromJson(Map<String, dynamic> json) {
    data = json["data"] != null ? Favourites.fromJson(json["data"]) : null;
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = {};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}

class Favourites {
  List<Calculators>? calculators;
  int? totalCount;

  Favourites({this.calculators, this.totalCount});

  Favourites.fromJson(Map<String, dynamic> json) {
    calculators = json["calculators"] != null
        ? List<Calculators>.from(
            json["calculators"].map((e) => Calculators.fromJson(e)))
        : null;
    totalCount = json["total_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = {};
    if (calculators != null) {
      _data["calculators"] = calculators?.map((e) => e.toJson()).toList();
    }
    _data["total_count"] = totalCount;
    return _data;
  }
}

class Calculators {
  String? name;
  String? displayName;
  String? description;
  String? icon;
  bool? isFavorite;

  Calculators({
    this.name,
    this.displayName,
    this.description,
    this.icon,
    this.isFavorite,
  });

  Calculators.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    displayName = json["display_name"];
    description = json["description"];
    icon = json["icon"];
    isFavorite = json["is_favorite"];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "display_name": displayName,
      "description": description,
      "icon": icon,
      "is_favorite": isFavorite,
    };
  }
}
