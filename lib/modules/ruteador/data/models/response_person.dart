import 'dart:convert';

import 'package:movilidadquito/modules/ruteador/data/models/response.dart';
import 'package:movilidadquito/modules/ruteador/domain/entities/person.dart';

class ResponsePerson extends Response {
  ResponsePerson({this.data, int? status, String? message}) : super(internalCode: status, message: message);

  DataPerson? data;

  factory ResponsePerson.fromJson(String str) => ResponsePerson.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  ResponsePerson.fromMap(Map<String, dynamic> json)
      : data = json["data"] == null ? null : DataPerson.fromMap(json["data"]),
        super.fromMap(json);

  @override
  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data!.toMap(),
      };

  @override
  String toString() {
    return 'ResponsePerson{response: ${super.toString()}, data: $data}';
  }
}
