class Location {
  Location({
    this.name,
    this.lat,
    this.lng,
  });

  Location.fromJson(dynamic json) {
    name = json['name'];
    lat = (json['lat'] ?? ['latitude'])?.toString();
    lng = (json['lng'] ?? ['longitude'])?.toString();
  }

  String? name;
  String? lat;
  String? lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['lat'] = lat;
    map['lng'] = lng;
    return map;
  }
}
