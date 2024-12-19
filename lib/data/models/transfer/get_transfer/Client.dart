import 'Location.dart';
import 'Station.dart';

class Client {
  Client({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.logo,
    this.location,
    this.type,
    this.station,
  });

  Client.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    logo = json['logo'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    type = json['type'];
    station =
        json['station'] != null ? Station.fromJson(json['station']) : null;
  }
  num? id;
  String? name;
  String? phone;
  String? address;
  String? logo;
  Location? location;
  String? type;
  Station? station;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['address'] = address;
    map['logo'] = logo;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['type'] = type;
    if (station != null) {
      map['station'] = station?.toJson();
    }
    return map;
  }
}
