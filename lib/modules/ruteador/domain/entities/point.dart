// import 'dart:convert';
//
// class Point {
//   Point({
//     this.active,
//     this.idPoint,
//     this.latitude,
//     this.longitude
//   });
//
//   bool? active;
//   int? idPoint;
//   double? latitude;
//   double? longitude;
//
//   factory Point.fromJson(String str) => Point.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Point.fromMap(Map<String, dynamic> json) => Point(
//     active: json["active"],
//     idPoint: json["idPoint"],
//     latitude: json["latitude"]?.toDouble(),
//     longitude: json["longitude"]?.toDouble(),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "active": active,
//     "idPoint": idPoint,
//     "latitude": latitude,
//     "longitude": longitude
//   };
// }