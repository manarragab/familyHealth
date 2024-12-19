class Flight {
  Flight({
    this.flightNumber,
    this.departureTime,
    this.arrivalTime,
  });

  Flight.fromJson(dynamic json) {
    flightNumber = json['flight_number'];
    departureTime = json['departure_time'];
    arrivalTime = json['arrival_time'];
  }
  String? flightNumber;
  dynamic departureTime;
  dynamic arrivalTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flight_number'] = flightNumber;
    map['departure_time'] = departureTime;
    map['arrival_time'] = arrivalTime;
    return map;
  }
}
