import 'package:abg/data/remote_data/response_model.dart';

class FacebookResponseModel extends ResponseModel {
  String? name;
  String? email;
  Picture? picture;
  String? id;

  FacebookResponseModel({
    required this.name,
    required this.email,
    required this.picture,
    required this.id,
  });

  factory FacebookResponseModel.fromJson(Map<String, dynamic> json) {
    return FacebookResponseModel(
        name: json['name'],
        email: json['email'],
        picture: json['picture'] != null
            ? Picture.fromJson(json['picture'])
            : Picture(data: Data(url: '')),
        id: json['id']);
  }
}

class Picture {
  Data? data;

  Picture({this.data});

  Picture.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? height;
  bool? isSilhouette;
  String? url;
  int? width;

  Data({this.height, this.isSilhouette, this.url, this.width});

  Data.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    isSilhouette = json['is_silhouette'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['is_silhouette'] = isSilhouette;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}
