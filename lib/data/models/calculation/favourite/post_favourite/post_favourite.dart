import 'package:abg/data/const/enums.dart';

class PostFavourite {
  PostFavourite({required this.name});

  String? name;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    _data["calculator_name"] = name;
    return _data;
  }
}
