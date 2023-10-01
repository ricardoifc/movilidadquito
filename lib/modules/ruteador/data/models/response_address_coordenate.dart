import 'dart:convert';

import 'package:movilidadquito/modules/ruteador/data/models/response.dart';
import 'package:movilidadquito/modules/ruteador/domain/entities/address.dart';

class ResponseAddressCoordenate extends Response {
  ResponseAddressCoordenate({this.data});

  Address? data;

  factory ResponseAddressCoordenate.fromJson(String str) => ResponseAddressCoordenate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  ResponseAddressCoordenate.fromMap(Map<String, dynamic> json)
      : data = json["data"] == null ? null : Address.fromMap(json["data"]),
        super.fromMap(json);

  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data!.toMap(),
      };

  @override
  String toString() {
    return 'ModelAddressCoordenate{data: $data}';
  }
}
