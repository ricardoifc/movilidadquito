import 'dart:convert';

import 'package:movilidadquito/modules/ruteador/data/models/response.dart';
import 'package:movilidadquito/modules/ruteador/domain/entities/transport_multimodal.dart';


class ResponseTransportMultimodal extends Response {
  List<TransportMultimodal>? listTransportMultimodal = [];

  ResponseTransportMultimodal(
      {this.listTransportMultimodal, int? status, String? message})
      : super(internalCode: status, message: message);

  factory ResponseTransportMultimodal.fromJson(String str) =>
      ResponseTransportMultimodal.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  ResponseTransportMultimodal.fromMap(Map<String, dynamic> json)
      : listTransportMultimodal = (json["data"] == null
            ? []
            : List<TransportMultimodal>.from(
                json["data"].map((x) => TransportMultimodal.fromMap(x)))),
        super.fromMap(json);

  @override
  Map<String, dynamic> toMap() => {
        "data": listTransportMultimodal == null
            ? null
            : List<dynamic>.from(
                listTransportMultimodal!.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'ResponseTransportMultimodal{response: ${super.toString()}, listTransportMultimodal: $listTransportMultimodal}';
  }
}
