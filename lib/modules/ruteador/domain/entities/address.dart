import 'dart:convert';

import 'package:movilidadquito/modules/ruteador/domain/entities/gate.dart';

class Address {
  int? placeId;
  String? geofence;
  String? geofence2;
  String? displayName;
  double? latitude;
  double? longitude;
  String? address;
  String? road;
  String? neighbourhood;
  String? suburb;
  String? name;
  String? acronym;
  String? color;
  bool? activeGeofence;
  bool? activeGeofence2;
  List<Gate?>? gates;

  Address({
    this.placeId,
    this.geofence,
    this.geofence2,
    this.displayName,
    this.latitude,
    this.longitude,
    this.address,
    this.road,
    this.neighbourhood,
    this.suburb,
    this.name,
    this.color,
    this.acronym,
    this.gates,
    this.activeGeofence=false,
    this.activeGeofence2=false
  });

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        placeId: json["place_id"],
        displayName: json["display_name"],
        geofence: json["geofence"],
        geofence2: json["geofence2"],
        latitude: json["latitude"] ==  null ? json["latitude"] : json["latitude"].toDouble(),
        longitude: json["longitude"] ==null ? json["longitude"] : json["longitude"].toDouble(),
        address: json["address"],
        road: json["road"],
        neighbourhood: json["neighbourhood"],
        suburb: json["suburb"],
        name: json["name"],
        acronym: json["acronym"],
        color: json["color"],
        activeGeofence: json["activeGeofence"],
        activeGeofence2: json["activeGeofence2"],
        gates: json["gates"] == null ? [] : json["gates"] == null ? [] : List<Gate?>.from(json["gates"]!.map((x) => Gate.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "place_id": placeId,
        "geofence": geofence,
        "geofence2": geofence2,
        "display_name": displayName,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "road": road,
        "neighbourhood": neighbourhood,
        "suburb": suburb,
        "name": name,
        "acronym": acronym,
        "color": color,
        "activeGeofence": activeGeofence,
        "activeGeofence2": activeGeofence2,
        "gates": gates == null ? [] : gates == null ? [] : List<dynamic>.from(gates!.map((x) => x!.toMap())),
      };

  @override
  String toString() {
    return 'Address{placeId: $placeId, geofence: $geofence, geofence2: $geofence2, displayName: $displayName, latitude: $latitude, longitude: $longitude, address: $address, road: $road, neighbourhood: $neighbourhood, suburb: $suburb, name: $name, acronym: $acronym, color: $color,activeGeofence: $activeGeofence,activeGeofence2: $activeGeofence2,"gates": $gates}';
  }
}
