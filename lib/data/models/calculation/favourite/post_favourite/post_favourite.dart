
class PostFavourite {
  PostFavourite({required this.name});

  String? name;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["calculator_name"] = name;
    return data;
  }
}
