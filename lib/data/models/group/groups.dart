/// id : 2
/// created_by : 1
/// title : "Dentistry"
/// image : "uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg"
/// description : "Dentistry Group Description"
/// order : 1
/// members_count : 0
/// created_at : "2025-01-20T21:28:37.000000Z"
/// updated_at : "2025-01-20T21:28:37.000000Z"
/// image_path : "http://127.0.0.1:8000/uploads/groups/193a1a9ed39ba92fe6d17b6683e9a3bd.jpg"
/// pivot : {"user_id":2,"group_id":2}

class Groups {
  Groups({
    this.id,
    this.createdBy,
    this.title,
    this.image,
    this.description,
    this.order,
    this.membersCount,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.pivot,
  });

  Groups.fromJson(dynamic json) {
    id = json['id'];
    createdBy = json['created_by'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    order = json['order'];
    membersCount = json['members_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  num? id;
  num? createdBy;
  String? title;
  String? image;
  String? description;
  num? order;
  num? membersCount;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_by'] = createdBy;
    map['title'] = title;
    map['image'] = image;
    map['description'] = description;
    map['order'] = order;
    map['members_count'] = membersCount;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['image_path'] = imagePath;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }
}

/// user_id : 2
/// group_id : 2

class Pivot {
  Pivot({
    this.userId,
    this.groupId,
  });

  Pivot.fromJson(dynamic json) {
    userId = json['user_id'];
    groupId = json['group_id'];
  }
  num? userId;
  num? groupId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['group_id'] = groupId;
    return map;
  }
}
