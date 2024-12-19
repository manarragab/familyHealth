import '../get_transfer/Car.dart';
import '../get_transfer/Client.dart';
import '../get_transfer/Driver.dart';
import '../get_transfer/Flight.dart';
import '../get_transfer/Location.dart';
import 'CarType.dart';
import 'Guests.dart';

class TransferDetails {
  TransferDetails({
    this.id,
    this.status,
    this.numberOfBooking,
    this.ownerDriverId,
    this.requestedBy,
    this.driverAcceptance,
    this.owner,
    this.type,
    this.startDate,
    this.endDate,
    this.stationFrom,
    this.stationFromLat,
    this.stationFromLng,
    this.fromAddress,
    this.stationTo,
    this.stationToLat,
    this.stationToLng,
    this.toAddress,
    this.notes,
    this.client,
    this.flight,
    this.roomNumber,
    this.car,
    this.carType,
    this.guests,
    this.driver,
    this.sellerType,
    this.guestNotes,
    this.price,
    this.getMoneyFrom,
    this.cashReceived,
    this.tradingStatus,
    this.transferType,
    this.soldAt,
    this.buyAt,
    this.station,
    this.location,
    this.isIntegrated,
  });

  TransferDetails.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    numberOfBooking = json['number_of_booking'];
    ownerDriverId = json['owner_driver_id'];
    requestedBy = json['requested_by'];
    //driverAcceptance = json['driver_acceptance'];
    owner = json['owner'];
    type = json['type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    stationFrom = json['station_from'];
    stationFromLat = json['station_from_lat'];
    stationFromLng = json['station_from_lng'];
    fromAddress = json['from_address'];
    stationTo = json['station_to'];
    stationToLat = json['station_to_lat'];
    stationToLng = json['station_to_lng'];
    toAddress = json['to_address'];
    notes = json['notes'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
    flight = json['flight'] != null ? Flight.fromJson(json['flight']) : null;
    roomNumber = json['room_number'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
    carType =
        json['car_type'] != null ? CarType.fromJson(json['car_type']) : null;
    if (json['guests'] != null) {
      guests = [];
      json['guests'].forEach((v) {
        guests?.add(Guests.fromJson(v));
      });
    }
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    sellerType = json['seller_type'];
    guestNotes = json['guest_notes'];
    price = json['price'];
    getMoneyFrom = json['get_money_from'];
    cashReceived = json['cash_received'];
    tradingStatus = json['trading_status'] != null
        ? json['trading_status'].cast<String>()
        : [];
    transferType = json['transfer_type'];
    soldAt = json['sold_at'];
    buyAt = json['buy_at'];
    station = json['station'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    isIntegrated = json['is_integrated'];
  }

  num? id;
  String? status;
  num? numberOfBooking;
  num? ownerDriverId;
  String? requestedBy;
  bool? driverAcceptance;
  dynamic owner;
  String? type;
  String? startDate;
  dynamic endDate;
  dynamic stationFrom;
  num? stationFromLat;
  num? stationFromLng;
  String? fromAddress;
  dynamic stationTo;
  num? stationToLat;
  num? stationToLng;
  String? toAddress;
  dynamic notes;
  Client? client;
  Flight? flight;
  dynamic roomNumber;
  Car? car;
  CarType? carType;
  List<Guests>? guests;
  Driver? driver;
  String? sellerType;
  dynamic guestNotes;
  num? price;
  String? getMoneyFrom;
  num? cashReceived;
  List<String>? tradingStatus;
  String? transferType;
  dynamic soldAt;
  dynamic buyAt;
  dynamic station;
  Location? location;
  bool? isIntegrated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['number_of_booking'] = numberOfBooking;
    map['owner_driver_id'] = ownerDriverId;
    map['requested_by'] = requestedBy;
    // map['driver_acceptance'] = driverAcceptance;
    map['owner'] = owner;
    map['type'] = type;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['station_from'] = stationFrom;
    map['station_from_lat'] = stationFromLat;
    map['station_from_lng'] = stationFromLng;
    map['from_address'] = fromAddress;
    map['station_to'] = stationTo;
    map['station_to_lat'] = stationToLat;
    map['station_to_lng'] = stationToLng;
    map['to_address'] = toAddress;
    map['notes'] = notes;
    if (client != null) {
      map['client'] = client?.toJson();
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
    if (guests != null) {
      map['guests'] = guests?.map((v) => v.toJson()).toList();
    }
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    map['seller_type'] = sellerType;
    map['guest_notes'] = guestNotes;
    map['price'] = price;
    map['get_money_from'] = getMoneyFrom;
    map['cash_received'] = cashReceived;
    map['trading_status'] = tradingStatus;
    map['transfer_type'] = transferType;
    map['sold_at'] = soldAt;
    map['buy_at'] = buyAt;
    map['station'] = station;
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['is_integrated'] = isIntegrated;
    return map;
  }
}
