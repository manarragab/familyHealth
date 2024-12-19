import 'package:abg/data/remote_data/response_model.dart';

class NotificationModel extends ResponseModel<List<NotificationData>?> {
  NotificationModel({
    this.status,
    this.success,
    this.data,
    this.meta,
    this.message,
  });

  NotificationModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(NotificationData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (meta != null) {
      more = (meta?.currentPage ?? 0) < (meta?.lastPage ?? 0);
    }
    message = json['message'];
  }

  num? status;
  bool? success;
  List<NotificationData>? data;
  Meta? meta;
  bool more = true;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['message'] = message;
    return map;
  }
}

class Meta {
  Meta({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.links,
  });

  Meta.fromJson(dynamic json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    perPage = json['per_page'];
    total = json['total'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
  }

  num? currentPage;
  num? lastPage;
  num? perPage;
  num? total;
  List<Links>? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['last_page'] = lastPage;
    map['per_page'] = perPage;
    map['total'] = total;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Links {
  Links({
    this.url,
    this.label,
    this.active,
  });

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  String? url;
  num? label;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }
}

class NotificationData {
  NotificationData({
    this.id,
    this.type,
    this.title,
    this.description,
    this.item,
    this.createdAt,
  });

  NotificationData.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    item = json['item'];
    createdAt = json['created_at'];
  }

  num? id;
  String? type;
  String? title;
  String? description;
  num? item;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['title'] = title;
    map['description'] = description;
    map['item'] = item;
    map['created_at'] = createdAt;
    return map;
  }
}
