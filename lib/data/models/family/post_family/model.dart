
class PosttModel {
  final String? image;
  final String? name;
  final String? brithDate;
  final String? phone;
  final String? relative;
  final String? userId;
  final String? id;


  PosttModel({
    required this.image,
    required this.name,
    required this.brithDate,
    required this.phone,
    required this.relative,
    required this.userId,
    this.id,
  });
  factory PosttModel.fromJson(Map<String, dynamic> json) {
    return PosttModel(
        image: json["image"],
        name: json["name"],
        brithDate: json["brith_date"],
        phone: json["phone"],
        relative: json["relative"],
        userId: json["user_id"]);
  }
}


