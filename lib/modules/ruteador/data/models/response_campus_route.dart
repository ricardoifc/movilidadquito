import 'dart:convert';

import 'package:movilidadquito/modules/ruteador/data/models/response.dart';

import 'package:movilidadquito/modules/ruteador/domain/entities/address.dart';

class ResponseCampusRoute extends Response {
  ResponseCampusRoute({
    this.data,
  });

  List<Address>? data = [];

  factory ResponseCampusRoute.fromJson(String str) =>
      ResponseCampusRoute.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  ResponseCampusRoute.fromMap(Map<String, dynamic> json)
      : data = (json["data"] == null
            ? []
            : List<Address>.from(
                json["data"].map((x) => Address.fromMap(x)))),
        super.fromMap(json);

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'ResponseCampus{data: $data}';
  }
}
