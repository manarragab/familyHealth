import 'Location.dart';

class Station {
  Station({
    this.id,
    this.name,
    this.location,
    this.isAirport,
    this.popular,
    this.fixedLocation,
    this.image,
  });

  Station.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    isAirport = json['is_airport'];
    popular = json['popular'];
    fixedLocation = json['fixed_location'];
    image = json['image'];
  }
  num? id;
  String? name;
  Location? location;
  bool? isAirport;
  bool? popular;
  bool? fixedLocation;
  dynamic image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['is_airport'] = isAirport;
    map['popular'] = popular;
    map['fixed_location'] = fixedLocation;
    map['image'] = image;
    return map;
  }
}
