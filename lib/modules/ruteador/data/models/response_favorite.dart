import 'dart:convert';

import 'package:movilidadquito/modules/ruteador/data/models/response.dart';
import 'package:movilidadquito/modules/ruteador/domain/entities/address.dart';

class ResponseFavorite extends Response {
  ResponseFavorite({
    this.data,
  });

  List<Address>? data = [];

  factory ResponseFavorite.fromJson(String str) =>
      ResponseFavorite.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  ResponseFavorite.fromMap(Map<String, dynamic> json)
      : data = (json["data"] == null
            ? []
            : List<Address>.from(json["data"].map((x) => Address.fromMap(x)))),
        super.fromMap(json);

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'ResponseFavorite{data: $data}';
  }
}
