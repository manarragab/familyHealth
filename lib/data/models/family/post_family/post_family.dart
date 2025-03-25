// class PostFamily {
//   PostFamily({
//       this.image, 
//       this.name, 
//       this.brithDate, 
//       this.phone, 
//       this.relative, 
//       this.medicalRecord,});

//   PostFamily.fromJson(dynamic json) {
//     image = json['image'];
//     name = json['name'];
//     brithDate = json['brith_date'];
//     phone = json['phone'];
//     relative = json['relative'];
//     medicalRecord = json['medical_record[]'];
//   }
//   String? image;
//   String? name;
//   String? brithDate;
//   String? phone;
//   String? relative;
//   String? medicalRecord;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['image'] = image;
//     map['name'] = name;
//     map['brith_date'] = brithDate;
//     map['phone'] = phone;
//     map['relative'] = relative;
//     map['medical_record[]'] = medicalRecord;
//     return map;
//   }

// }