import 'dart:convert';

class Gate {
  static const typeEntry = 1; //entrada
  static const typeExit = 2; //salida

  Gate({
    this.idGate,
    this.latitude,
    this.longitude,
    this.type,
    this.active=false,
    this.gateTypes,
  });

  int? idGate;
  double? latitude;
  double? longitude;
  int? type;
  bool? active;
  List<GateType>? gateTypes;

  factory Gate.fromJson(String str) => Gate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gate.fromMap(Map<String, dynamic> json) => Gate(
    idGate: json["idGate"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    type: json["type"],
    active: json["active"],
    gateTypes: json["gateTypes"] == null ? [] : List<GateType>.from(json["gateTypes"]!.map((x) => GateType.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "idGate": idGate,
    "latitude": latitude,
    "longitude": longitude,
    "type": type,
    "active": active,
    "gateTypes": gateTypes == null ? [] : List<dynamic>.from(gateTypes!.map((x) => x.toMap())),
  };
}

class GateType {

  static const gateTypeEntryVehicle = 1; //vehiculo
  static const gateTypeEntryWalk = 2; //caminata

  GateType({
    this.idGateType,
    this.name,
  });

  int? idGateType;
  String? name;

  factory GateType.fromJson(String str) => GateType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GateType.fromMap(Map<String, dynamic> json) => GateType(
    idGateType: json["idGateType"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "idGateType": idGateType,
    "name": name,
  };
}