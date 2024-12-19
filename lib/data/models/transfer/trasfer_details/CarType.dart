class CarType {
  CarType({
    this.id,
    this.name,
    this.original,
    this.bags,
    this.seats,
  });

  CarType.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    original = json['original'];
    bags = json['bags'];
    seats = json['seats'];
  }
  num? id;
  String? name;
  String? original;
  num? bags;
  num? seats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['original'] = original;
    map['bags'] = bags;
    map['seats'] = seats;
    return map;
  }
}
