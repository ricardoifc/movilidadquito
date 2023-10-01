import 'dart:convert';

import 'package:movilidadquito/modules/ruteador/domain/entities/address.dart';
// import 'package:moveru_movil/domain/entities/entities_router_multimodal/address.dart';

import 'response.dart';

class ResponseAddressSearch extends Response {
  List<Address>? data = [];

  ResponseAddressSearch({
    this.data,
  });

  factory ResponseAddressSearch.fromJson(String str) =>
      ResponseAddressSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  ResponseAddressSearch.fromMap(Map<String, dynamic> json)
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
    return 'ResponseAddressSearch{data: $data}';
  }
}
