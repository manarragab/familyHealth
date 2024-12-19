import 'package:abg/data/remote_data/response_model.dart';

class LoginModel extends ResponseModel<LoginData?> {
  LoginModel({
    this.status,
    this.msg,
    this.data,
  });

  LoginModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json["message"];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  num? status;
  String? msg;
  LoginData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map["message"] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class LoginData {
  LoginData({
    this.user,
    this.accessToken,
  });

  LoginData.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  User? user;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['accessToken'] = accessToken;
    return map;
  }
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.phoneCode,
    this.type,
    this.locale,
    this.status,
    this.image,
    this.bankAccount,
    this.driverType,
    this.company,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    phoneCode = json['phone_code'];
    type = json['type'];
    locale = json['locale'];
    status = json['status'];
    image = json['image'];
    bankAccount = json['bank_account'] != null
        ? BankAccount.fromJson(json['bank_account'])
        : null;
    driverType = json['driver_type'];
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  num? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? phoneCode;
  String? type;
  String? locale;
  String? status;
  String? image;
  BankAccount? bankAccount;
  String? driverType;
  Company? company;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['phone_code'] = phoneCode;
    map['type'] = type;
    map['locale'] = locale;
    map['status'] = status;
    map['image'] = image;
    if (bankAccount != null) {
      map['bank_account'] = bankAccount?.toJson();
    }
    map['driver_type'] = driverType;
    if (company != null) {
      map['company'] = company?.toJson();
    }
    return map;
  }
}

class Company {
  Company({
    this.id,
    this.name,
    this.type,
    this.currency,
  });

  Company.fromJson(dynamic data) {
    Map<String, dynamic> json = {};
    if (data is List && data.isNotEmpty) {
      json = data.first;
    } else {
      json = data;
    }
    id = json['id'];
    name = json['name'];
    type = json['type'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }

  num? id;
  String? name;
  String? type;
  Currency? currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    if (currency != null) {
      map['currency'] = currency?.toJson();
    }
    return map;
  }
}

class Currency {
  Currency({
    this.id,
    this.code,
    this.name,
    this.symbol,
  });

  Currency.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
  }

  num? id;
  String? code;
  String? name;
  String? symbol;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['symbol'] = symbol;
    return map;
  }
}

class BankAccount {
  BankAccount({
    this.iban,
    this.holderName,
  });

  BankAccount.fromJson(dynamic json) {
    iban = json['iban'];
    holderName = json['holder_name'];
  }

  String? iban;
  String? holderName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iban'] = iban;
    map['holder_name'] = holderName;
    return map;
  }
}
