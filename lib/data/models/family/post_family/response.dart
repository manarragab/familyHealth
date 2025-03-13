
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/remote_data/response_model.dart';

class Response extends ResponseModel<Family> {
  @override
  final Family? data;
  @override
  final num? status;
  @override
  final String? message;

  Response({
    required this.data,
    required this.status,
    required this.message,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
        data: json["data"]==null ? null : Family.fromJson(json["data"]), status: json["status"], message: json["message"], );
  }
}



