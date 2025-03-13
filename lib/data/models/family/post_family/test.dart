// {
//     "data": {
//         "image": "uploads/family/41db1788075e8b4608dcc6ce911a58c3.jpg",
//         "name": "medicine",
//         "brith_date": "2025-02-22",
//         "phone": "01152067271",
//         "relative": "Cousin",
//         "user_id": 2,
//         "updated_at": "2025-01-18T19:20:28.000000Z",
//         "created_at": "2025-01-18T19:20:28.000000Z",
//         "id": 1
//     },
//     "status": 201,
//     "message": "Family member Created Successfully!"
// }

import 'dart:io';

class TestModel {

  final DataModel? data;
  final int? status;
  final String? message;

  TestModel({
    required this.data,
    required this.status,
    required this.message,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
        data: json["data"]==null ? null : DataModel.fromJson(json["data"]), status: json["status"], message: json["message"], );
  }
}

class DataModel {
  final File? image;
  final String? name;
  final String? brithDate;
  final String? phone;
  final String? relative;
  final String? userId;
  final String? id;

  DataModel({
    required this.image,
    required this.name,
    required this.brithDate,
    required this.phone,
    required this.relative,
    required this.userId,
    this.id,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        image: json["image"],
        name: json["name"],
        brithDate: json["brith_date"],
        phone: json["phone"],
        relative: json["relative"],
        userId: json["user_id"]);
  }
}


