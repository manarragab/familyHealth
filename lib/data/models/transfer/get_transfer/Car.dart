class Car {
  Car({
    this.id,
    this.name,
    this.plateNumber,
    this.color,
    this.licencePlate,
    this.brand,
    this.manufactureYear,
    this.images,
  });

  Car.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    plateNumber = json['plate_number'];
    color = json['color'];
    licencePlate = json['licence_plate'];
    brand = json['brand'];
    manufactureYear = json['manufacture_year'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(v);
      });
    }
  }
  num? id;
  String? name;
  String? plateNumber;
  String? color;
  dynamic licencePlate;
  String? brand;
  num? manufactureYear;
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['plate_number'] = plateNumber;
    map['color'] = color;
    map['licence_plate'] = licencePlate;
    map['brand'] = brand;
    map['manufacture_year'] = manufactureYear;
    if (images != null) {
      map['images'] = images?.map((v) => v).toList();
    }
    return map;
  }
}
