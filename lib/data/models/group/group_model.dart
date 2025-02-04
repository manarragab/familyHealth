import 'package:abg/data/models/group/groups.dart';
import 'package:abg/data/remote_data/response_model.dart';

/// data : {"my_groups":[{"id":3,"created_by":1,"title":"Oncology","image":"uploads/groups/ce89618c67bd02ddde94df1cc5fd104a.jpg","description":"Oncology Group Description","order":2,"members_count":0,"created_at":"2025-01-20T21:29:20.000000Z","updated_at":"2025-01-20T21:29:20.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/ce89618c67bd02ddde94df1cc5fd104a.jpg","pivot":{"user_id":2,"group_id":3}},{"id":2,"created_by":1,"title":"Dentistry","image":"uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg","description":"Dentistry Group Description","order":1,"members_count":0,"created_at":"2025-01-20T21:28:37.000000Z","updated_at":"2025-01-20T21:28:37.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg","pivot":{"user_id":2,"group_id":2}}],"suggestedGroups":[{"id":5,"created_by":1,"title":"Fourth Group Title","image":"uploads/groups/3af6a426bfe5c6071ad630339042be0f.png","description":"Fourth Group T Description tle","order":4,"members_count":0,"created_at":"2025-01-25T15:49:54.000000Z","updated_at":"2025-01-25T15:49:54.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/3af6a426bfe5c6071ad630339042be0f.png"},{"id":4,"created_by":1,"title":"New Group","image":"uploads/groups/c7a220b41b86559590adabbd5c8174fa.jpg","description":"New Group Description","order":3,"members_count":0,"created_at":"2025-01-25T15:49:28.000000Z","updated_at":"2025-01-25T15:49:28.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/c7a220b41b86559590adabbd5c8174fa.jpg"}]}
/// status : 200
/// message : "Success"

class GroupModel extends ResponseModel<GroupData?> {
  GroupModel({
    this.data,
    this.status,
    this.message,
  });

  GroupModel.fromJson(dynamic json) {
    data = json['data'] != null ? GroupData.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }
  GroupData? data;
  num? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}

/// my_groups : [{"id":3,"created_by":1,"title":"Oncology","image":"uploads/groups/ce89618c67bd02ddde94df1cc5fd104a.jpg","description":"Oncology Group Description","order":2,"members_count":0,"created_at":"2025-01-20T21:29:20.000000Z","updated_at":"2025-01-20T21:29:20.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/ce89618c67bd02ddde94df1cc5fd104a.jpg","pivot":{"user_id":2,"group_id":3}},{"id":2,"created_by":1,"title":"Dentistry","image":"uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg","description":"Dentistry Group Description","order":1,"members_count":0,"created_at":"2025-01-20T21:28:37.000000Z","updated_at":"2025-01-20T21:28:37.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg","pivot":{"user_id":2,"group_id":2}}]
/// suggestedGroups : [{"id":5,"created_by":1,"title":"Fourth Group Title","image":"uploads/groups/3af6a426bfe5c6071ad630339042be0f.png","description":"Fourth Group T Description tle","order":4,"members_count":0,"created_at":"2025-01-25T15:49:54.000000Z","updated_at":"2025-01-25T15:49:54.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/3af6a426bfe5c6071ad630339042be0f.png"},{"id":4,"created_by":1,"title":"New Group","image":"uploads/groups/c7a220b41b86559590adabbd5c8174fa.jpg","description":"New Group Description","order":3,"members_count":0,"created_at":"2025-01-25T15:49:28.000000Z","updated_at":"2025-01-25T15:49:28.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/c7a220b41b86559590adabbd5c8174fa.jpg"}]

class GroupData {
  GroupData({
    this.myGroups,
    this.suggestedGroups,
  });

  GroupData.fromJson(dynamic json) {
    if (json['my_groups'] != null) {
      myGroups = [];
      json['my_groups'].forEach((v) {
        myGroups?.add(Groups.fromJson(v));
      });
    }
    if (json['suggestedGroups'] != null) {
      suggestedGroups = [];
      json['suggestedGroups'].forEach((v) {
        suggestedGroups?.add(Groups.fromJson(v));
      });
    }
  }
  List<Groups>? myGroups;
  List<Groups>? suggestedGroups;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (myGroups != null) {
      map['my_groups'] = myGroups?.map((v) => v.toJson()).toList();
    }
    if (suggestedGroups != null) {
      map['suggestedGroups'] = suggestedGroups?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
