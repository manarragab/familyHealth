import 'package:abg/data/models/group/groups.dart';
import 'package:abg/data/models/reminder/reminder.dart';
import 'package:abg/data/models/reminder_family/reminder_family.dart';
import 'package:abg/data/remote_data/response_model.dart';

/// data : {"reminders":[{"id":3,"user_id":2,"type":"medicine","title":"medicine title is here","description":"medicine description is here","alarm_date":null,"alarm_time":null,"is_repeatable":1,"medicine_start_date":"2025-01-20","medicine_end_date":"2025-01-23","image":"uploads/alarms/5e0bdc07d57a49904b3b817aa498fe91.jpg","is_triggered":0,"created_at":"2025-01-18T16:53:41.000000Z","updated_at":"2025-01-18T16:53:41.000000Z"},{"id":2,"user_id":2,"type":"appointment","title":"appointment title is here","description":"appointment description is here","alarm_date":"2025-02-22","alarm_time":"03:00:00","is_repeatable":0,"medicine_start_date":null,"medicine_end_date":null,"image":"uploads/alarms/220923e1738ba3fb642ccbc5fdf4d3c1.jpg","is_triggered":0,"created_at":"2025-01-18T16:52:07.000000Z","updated_at":"2025-01-18T16:52:07.000000Z"},{"id":1,"user_id":2,"type":"reminder","title":"reminder title is here","description":"reminder description is here","alarm_date":"2025-01-19","alarm_time":"23:52:00","is_repeatable":0,"medicine_start_date":null,"medicine_end_date":null,"image":"uploads/alarms/1c4b11bd03014e0a85390b99a5320074.jpg","is_triggered":0,"created_at":"2025-01-18T16:51:19.000000Z","updated_at":"2025-01-18T16:51:19.000000Z"}],"family_reminders":[{"id":4,"user_id":2,"name":"Family member two name","brith_date":"1980-02-22 00:00:00","phone":"01152067272","relative":"Brother","image":"uploads/family/46577acb47d3a7d5b1c9c1d040ab3309.jpg","created_at":"2025-01-19T18:33:16.000000Z","updated_at":"2025-01-19T18:33:16.000000Z"},{"id":3,"user_id":2,"name":"Family member name","brith_date":"1970-11-10 00:00:00","phone":"01152067271","relative":"Cousin","image":"uploads/family/ae945ef8a17f9b8aaea38c9d19093d1a.jpg","created_at":"2025-01-19T18:17:20.000000Z","updated_at":"2025-01-19T18:17:20.000000Z"}],"groups":[{"id":2,"created_by":1,"title":"Dentistry","image":"uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg","description":"Dentistry Group Description","order":1,"members_count":0,"created_at":"2025-01-20T21:28:37.000000Z","updated_at":"2025-01-20T21:28:37.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg"},{"id":3,"created_by":1,"title":"Oncology","image":"uploads/groups/ce89618c67bd02ddde94df1cc5fd104a.jpg","description":"Oncology Group Description","order":2,"members_count":0,"created_at":"2025-01-20T21:29:20.000000Z","updated_at":"2025-01-20T21:29:20.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/ce89618c67bd02ddde94df1cc5fd104a.jpg"}],"banners":[{"id":1,"title":"Mac Book Banner Title","image":"uploads/banners/macbook_m1_max.jpeg","redirect_url":"https://www.youtube.com","order":1,"views":null,"created_at":"2025-01-13T17:18:48.000000Z","updated_at":null,"image_path":"http://127.0.0.1:8000/storage/uploads/banners/macbook_m1_max.jpeg"},{"id":3,"title":"Banner Title Oneeee","image":"uploads/banners/b5cd5b5d1a92f21194b919d46c6f5e13.jpg","redirect_url":"https://www.youtube.com","order":2,"views":null,"created_at":"2025-01-14T15:59:14.000000Z","updated_at":"2025-01-14T16:32:37.000000Z","image_path":"http://127.0.0.1:8000/storage/uploads/banners/b5cd5b5d1a92f21194b919d46c6f5e13.jpg"}]}
/// status : 200
/// message : "Success"

class HomeModel extends ResponseModel<HomeData?> {
  HomeModel({
    this.data,
    this.status,
    this.message,
  });

  HomeModel.fromJson(dynamic json) {
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }
  @override
  HomeData? data;
  @override
  num? status;
  @override
  String? message;

  @override
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

/// reminders : [{"id":3,"user_id":2,"type":"medicine","title":"medicine title is here","description":"medicine description is here","alarm_date":null,"alarm_time":null,"is_repeatable":1,"medicine_start_date":"2025-01-20","medicine_end_date":"2025-01-23","image":"uploads/alarms/5e0bdc07d57a49904b3b817aa498fe91.jpg","is_triggered":0,"created_at":"2025-01-18T16:53:41.000000Z","updated_at":"2025-01-18T16:53:41.000000Z"},{"id":2,"user_id":2,"type":"appointment","title":"appointment title is here","description":"appointment description is here","alarm_date":"2025-02-22","alarm_time":"03:00:00","is_repeatable":0,"medicine_start_date":null,"medicine_end_date":null,"image":"uploads/alarms/220923e1738ba3fb642ccbc5fdf4d3c1.jpg","is_triggered":0,"created_at":"2025-01-18T16:52:07.000000Z","updated_at":"2025-01-18T16:52:07.000000Z"},{"id":1,"user_id":2,"type":"reminder","title":"reminder title is here","description":"reminder description is here","alarm_date":"2025-01-19","alarm_time":"23:52:00","is_repeatable":0,"medicine_start_date":null,"medicine_end_date":null,"image":"uploads/alarms/1c4b11bd03014e0a85390b99a5320074.jpg","is_triggered":0,"created_at":"2025-01-18T16:51:19.000000Z","updated_at":"2025-01-18T16:51:19.000000Z"}]
/// family_reminders : [{"id":4,"user_id":2,"name":"Family member two name","brith_date":"1980-02-22 00:00:00","phone":"01152067272","relative":"Brother","image":"uploads/family/46577acb47d3a7d5b1c9c1d040ab3309.jpg","created_at":"2025-01-19T18:33:16.000000Z","updated_at":"2025-01-19T18:33:16.000000Z"},{"id":3,"user_id":2,"name":"Family member name","brith_date":"1970-11-10 00:00:00","phone":"01152067271","relative":"Cousin","image":"uploads/family/ae945ef8a17f9b8aaea38c9d19093d1a.jpg","created_at":"2025-01-19T18:17:20.000000Z","updated_at":"2025-01-19T18:17:20.000000Z"}]
/// groups : [{"id":2,"created_by":1,"title":"Dentistry","image":"uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg","description":"Dentistry Group Description","order":1,"members_count":0,"created_at":"2025-01-20T21:28:37.000000Z","updated_at":"2025-01-20T21:28:37.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg"},{"id":3,"created_by":1,"title":"Oncology","image":"uploads/groups/ce89618c67bd02ddde94df1cc5fd104a.jpg","description":"Oncology Group Description","order":2,"members_count":0,"created_at":"2025-01-20T21:29:20.000000Z","updated_at":"2025-01-20T21:29:20.000000Z","image_path":"http://127.0.0.1:8000/uploads/groups/ce89618c67bd02ddde94df1cc5fd104a.jpg"}]
/// banners : [{"id":1,"title":"Mac Book Banner Title","image":"uploads/banners/macbook_m1_max.jpeg","redirect_url":"https://www.youtube.com","order":1,"views":null,"created_at":"2025-01-13T17:18:48.000000Z","updated_at":null,"image_path":"http://127.0.0.1:8000/storage/uploads/banners/macbook_m1_max.jpeg"},{"id":3,"title":"Banner Title Oneeee","image":"uploads/banners/b5cd5b5d1a92f21194b919d46c6f5e13.jpg","redirect_url":"https://www.youtube.com","order":2,"views":null,"created_at":"2025-01-14T15:59:14.000000Z","updated_at":"2025-01-14T16:32:37.000000Z","image_path":"http://127.0.0.1:8000/storage/uploads/banners/b5cd5b5d1a92f21194b919d46c6f5e13.jpg"}]

class HomeData {
  HomeData({
    this.reminders,
    this.familyReminders,
    this.groups,
    this.banners,
  });

  HomeData.fromJson(dynamic json) {
    if (json['reminders'] != null) {
      reminders = [];
      json['reminders'].forEach((v) {
        reminders?.add(Reminders.fromJson(v));
      });
    }
    if (json['family_reminders'] != null) {
      familyReminders = [];
      json['family_reminders'].forEach((v) {
        familyReminders?.add(FamilyReminders1.fromJson(v));
      });
    }
    if (json['groups'] != null) {
      groups = [];
      json['groups'].forEach((v) {
        groups?.add(Groups.fromJson(v));
      });
      groups?.sort((a, b) => a.order!.compareTo(b.order!));
    }
    banners = [];
    if (json['banners'] != null) {
      json['banners'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
      banners?.sort((a, b) => a.order!.compareTo(b.order!));
    }
  }
  List<Reminders>? reminders;
  List<FamilyReminders1>? familyReminders;
  List<Groups>? groups;
  List<Banners>? banners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (reminders != null) {
      map['reminders'] = reminders?.map((v) => v.toJson()).toList();
    }
    if (familyReminders != null) {
      map['family_reminders'] =
          familyReminders?.map((v) => v.toJson()).toList();
          
    }
    if (groups != null) {
      map['groups'] = groups?.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// title : "Mac Book Banner Title"
/// image : "uploads/banners/macbook_m1_max.jpeg"
/// redirect_url : "https://www.youtube.com"
/// order : 1
/// views : null
/// created_at : "2025-01-13T17:18:48.000000Z"
/// updated_at : null
/// image_path : "http://127.0.0.1:8000/storage/uploads/banners/macbook_m1_max.jpeg"

class Banners {
  Banners({
    this.id,
    this.title,
    this.image,
    this.redirectUrl,
    this.order,
    this.views,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  Banners.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    redirectUrl = json['redirect_url'];
    order = json['order'];
    views = json['views'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
  }
  num? id;
  String? title;
  String? image;
  String? redirectUrl;
  num? order;
  dynamic views;
  String? createdAt;
  dynamic updatedAt;
  String? imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['redirect_url'] = redirectUrl;
    map['order'] = order;
    map['views'] = views;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['image_path'] = imagePath;
    return map;
  }
}
