import 'package:abg/data/remote_data/response_model.dart';

class GetFavourites extends ResponseModel<Favourites?> {
  @override
  Favourites? data;
  @override
  num? status;
  @override
  String? message;

  GetFavourites({this.data, this.status, this.message});

  GetFavourites.fromJson(Map<String, dynamic> json) {
    data = json["data"] != null ? Favourites.fromJson(json["data"]) : null;
    status = json["status"];
    message = json["message"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (data != null) {
      data["data"] = data?.toJson();
    }
    data["status"] = status;
    data["message"] = message;
    return data;
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
    final Map<String, dynamic> data = {};
    if (calculators != null) {
      data["calculators"] = calculators?.map((e) => e.toJson()).toList();
    }
    data["total_count"] = totalCount;
    return data;
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
