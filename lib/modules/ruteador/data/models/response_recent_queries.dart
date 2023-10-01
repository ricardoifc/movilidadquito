import 'dart:convert';

import '../../domain/entities/address.dart';
import 'response.dart';

class ResponseRecentQueries extends Response {
  ResponseRecentQueries({
    this.data,
  });

  List<Address>? data = [];

  factory ResponseRecentQueries.fromJson(String str) =>
      ResponseRecentQueries.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  ResponseRecentQueries.fromMap(Map<String, dynamic> json)
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
