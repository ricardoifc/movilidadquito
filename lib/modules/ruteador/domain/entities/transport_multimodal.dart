import 'dart:convert';

import '../../data/models/response.dart';

class TransportMultimodal extends Response {
  TransportMultimodal({
    this.idTransport,
    this.name,
    this.imagetransport,
    this.stateTransport,
    this.stateBlock,
  });

  int? idTransport;
  String? name;
  String? imagetransport;
  bool? stateTransport;
  bool? stateBlock;

  factory TransportMultimodal.fromJson(String str) =>
      TransportMultimodal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransportMultimodal.fromMap(Map<String, dynamic> json) =>
      TransportMultimodal(
        idTransport: json["idTransport"],
        name: json["name"],
        imagetransport: json["imagetransport"],
        stateTransport: json["stateTransport"],
        stateBlock: json["stateBlock"],
      );

  Map<String, dynamic> toMap() => {
        "idTransport": idTransport,
        "name": name,
        "imageTransport": imagetransport,
        "stateTransport": stateTransport,
        "stateBlock": stateBlock,
      };

  TransportMultimodal.map(dynamic obj) {
    idTransport = obj["idTransport"];
    name = obj["name"];
    imagetransport = obj["imageTransport"];
    stateTransport = obj["stateTransport"];
    stateBlock = obj["stateBlock"];
  }

  @override
  String toString() {
    return 'TransportMultimodal{idTransport: $idTransport, name: $name, imagetransport: $imagetransport, stateTransport: $stateTransport, stateBlock: $stateBlock}';
  }
}
