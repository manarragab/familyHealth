import 'package:abg/data/models/transfer/trasfer_details/CarType.dart';
import 'package:abg/data/models/transfer/trasfer_details/Guests.dart';

import 'Car.dart';
import 'Client.dart';
import 'Driver.dart';
import 'Flight.dart';
import 'Location.dart';

class Transfer {
  Transfer({
    this.id,
    this.status,
    this.requestStatus,
    this.numberOfBooking,
    this.ownerDriverId,
    this.owner,
    this.driverAcceptance,
    this.type,
    this.startDate,
    this.stationFrom,
    this.stationFromLat,
    this.stationFromLng,
    this.stationTo,
    this.stationToLat,
    this.stationToLng,
    this.fromAddress,
    this.toAddress,
    this.client,
    this.flight,
    this.roomNumber,
    this.car,
    this.carType,
    this.driver,
    this.price,
    this.currency,
    this.getMoneyFrom,
    this.cashReceived,
    this.tradingStatus,
    this.sellerType,
    this.transferType,
    this.buyAt,
    this.soldAt,
    this.station,
    this.location,
  });

  Transfer.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    requestStatus = json['request_status'];
    numberOfBooking = json['number_of_booking'];
    ownerDriverId = json['owner_driver_id'];
    owner = json['owner'];
    driverAcceptance = json['driver_acceptance'];
    type = json['type'];
    startDate = json['start_date'];
    stationFrom = json['station_from'];
    stationFromLat = json['station_from_lat'];
    stationFromLng = json['station_from_lng'];
    stationTo = json['station_to'];
    stationToLat = json['station_to_lat'];
    stationToLng = json['station_to_lng'];
    fromAddress = json['from_address'];
    toAddress = json['to_address'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    if (json['guests'] != null) {
      guests = [];
      json['guests'].forEach((v) {
        guests?.add(Guests.fromJson(v));
      });
    }
    flight = json['flight'] != null ? Flight.fromJson(json['flight']) : null;
    roomNumber = json['room_number'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
    carType =
        json['car_type'] != null ? CarType.fromJson(json['car_type']) : null;
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    price = json['price'];
    currency = json['currency'];
    getMoneyFrom = json['get_money_from'];
    cashReceived = json['cash_received'];
    tradingStatus = json['trading_status'] != null
        ? json['trading_status'].cast<String>()
        : [];
    sellerType = json['seller_type'];
    transferType = json['transfer_type'];
    buyAt = json['buy_at'];
    soldAt = json['sold_at'];
    station = json['station'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  num? id;
  String? status;
  bool? requestStatus;
  num? numberOfBooking;
  num? ownerDriverId;
  dynamic owner;
  bool? driverAcceptance;
  String? type;
  String? startDate;
  dynamic stationFrom;
  num? stationFromLat;
  num? stationFromLng;
  dynamic stationTo;
  num? stationToLat;
  num? stationToLng;
  String? fromAddress;
  String? toAddress;
  Client? client;
  List<Guests>? guests;
  Flight? flight;
  dynamic roomNumber;
  Car? car;
  CarType? carType;
  Driver? driver;
  num? price;
  String? currency;
  String? getMoneyFrom;
  num? cashReceived;
  List<String>? tradingStatus;
  String? sellerType;
  String? transferType;
  dynamic buyAt;
  dynamic soldAt;
  dynamic station;
  Location? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['request_status'] = requestStatus;
    map['number_of_booking'] = numberOfBooking;
    map['owner_driver_id'] = ownerDriverId;
    map['owner'] = owner;
    map['driver_acceptance'] = driverAcceptance;
    map['type'] = type;
    map['start_date'] = startDate;
    map['station_from'] = stationFrom;
    map['station_from_lat'] = stationFromLat;
    map['station_from_lng'] = stationFromLng;
    map['station_to'] = stationTo;
    map['station_to_lat'] = stationToLat;
    map['station_to_lng'] = stationToLng;
    map['from_address'] = fromAddress;
    map['to_address'] = toAddress;
    if (client != null) {
      map['client'] = client?.toJson();
    }
    if (guests != null) {
      map['guests'] = guests?.map((e) => e.toJson()).toList();
    }
    if (flight != null) {
      map['flight'] = flight?.toJson();
    }
    map['room_number'] = roomNumber;
    if (car != null) {
      map['car'] = car?.toJson();
    }
    if (carType != null) {
      map['car_type'] = carType?.toJson();
    }
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    map['price'] = price;
    map['currency'] = currency;
    map['get_money_from'] = getMoneyFrom;
    map['cash_received'] = cashReceived;
    map['trading_status'] = tradingStatus;
    map['seller_type'] = sellerType;
    map['transfer_type'] = transferType;
    map['buy_at'] = buyAt;
    map['sold_at'] = soldAt;
    map['station'] = station;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }
}
