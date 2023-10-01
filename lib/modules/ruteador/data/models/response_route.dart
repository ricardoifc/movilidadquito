import 'dart:convert';

import 'response.dart';

class ResponseRoute extends Response {
  ResponseRoute({
    this.data,
  });

  Data? data;

  factory ResponseRoute.fromJson(String str) =>
      ResponseRoute.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  ResponseRoute.fromMap(Map<String, dynamic> json)
      : data = json["data"] == null ? null : Data.fromMap(json["data"]),
        super.fromMap(json);

  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data!.toMap(),
      };

  @override
  String toString() {
    return 'ModelResponseRoute{data: $data}';
  }
}

class Data {
  Data({
    this.timeStrat,
    this.itinerariFormat,
  });

  String? timeStrat;
  List<ItinerariFormat>? itinerariFormat;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        timeStrat: json["timeStrat"],
        itinerariFormat: json["itinerariFormat"] == null
            ? null
            : List<ItinerariFormat>.from(
                json["itinerariFormat"].map((x) => ItinerariFormat.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "timeStrat": timeStrat,
        "itinerariFormat": itinerariFormat == null
            ? null
            : List<dynamic>.from(itinerariFormat!.map((x) => x.toMap())),
      };
}

class ItinerariFormat {
  ItinerariFormat({
    this.timeStart,
    this.endTime,
    this.duration,
    this.indications,
    this.name,
    this.id,
    this.nameOrigin,
    this.nameDestiny,
    this.type,
  });

  String? timeStart;
  String? endTime;
  String? duration;
  List<Indication>? indications;
  String? name;
  String? id;
  String? nameOrigin;
  String? nameDestiny;
  int? type;

  factory ItinerariFormat.fromJson(String str) =>
      ItinerariFormat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItinerariFormat.fromMap(Map<String, dynamic> json) => ItinerariFormat(
        timeStart: json["timeStart"],
        endTime: json["endTime"],
        duration: json["duration"],
        indications: json["indications"] == null
            ? null
            : List<Indication>.from(
                json["indications"].map((x) => Indication.fromMap(x))),
        name: json["name"],
        id: json["id"],
        nameOrigin: json["nameOrigin"],
        nameDestiny: json["nameDestiny"],
        type: json["type"],

  );

  Map<String, dynamic> toMap() => {
        "timeStart": timeStart,
        "endTime": endTime,
        "duration": duration,
        "indications": indications == null
            ? null
            : List<dynamic>.from(indications!.map((x) => x.toMap())),
        "name": name,
        "id": id,
        "nameOrigin": nameOrigin,
        "nameDestiny": nameDestiny,
        "type": type,
      };
}

class Indication {
  Indication({
    this.order,
    this.mode,
    this.timeStart,
    this.endTime,
    this.duration,
    this.distance,
    this.destiny,
    this.toMode,
    this.dataSteps,
    this.routeSteps,
    this.polyLine,
    this.name,
  });

  int? order;
  String? mode;
  String? timeStart;
  String? endTime;
  String? duration;
  String? distance;
  String? destiny;
  String? toMode;
  List<DataStep>? dataSteps;
  RouteSteps? routeSteps;
  List<PolyLine>? polyLine;
  String? name;

  factory Indication.fromJson(String str) =>
      Indication.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Indication.fromMap(Map<String, dynamic> json) => Indication(
        order: json["order"],
        mode: json["mode"],
        timeStart: json["timeStart"],
        endTime: json["endTime"],
        duration: json["duration"],
        distance: json["distance"],
        destiny: json["destiny"] ??= '',
        toMode: json["toMode"],
        dataSteps: json["dataSteps"] == null
            ? null
            : List<DataStep>.from(
                json["dataSteps"].map((x) => DataStep.fromMap(x))),
        routeSteps: json["routeSteps"] == null
            ? null
            : RouteSteps.fromMap(json["routeSteps"]),
        polyLine: json["polyLine"] == null
            ? null
            : List<PolyLine>.from(
                json["polyLine"].map((x) => PolyLine.fromMap(x))),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "order": order,
        "mode": mode,
        "timeStart": timeStart,
        "endTime": endTime,
        "duration": duration,
        "distance": distance,
        "destiny": destiny,
        "toMode": toMode,
        "dataSteps": dataSteps == null
            ? null
            : List<dynamic>.from(dataSteps!.map((x) => x.toMap())),
        "routeSteps": routeSteps == null ? null : routeSteps!.toMap(),
        "polyLine": polyLine == null
            ? null
            : List<dynamic>.from(polyLine!.map((x) => x.toMap())),
        "name": name,
      };

  @override
  String toString() {
    return 'Indication{order: $order, mode: $mode, timeStart: $timeStart, endTime: $endTime, duration: $duration, distance: $distance, destiny: $destiny, toMode: $toMode, dataSteps: $dataSteps, routeSteps: $routeSteps, polyLine: $polyLine, name: $name}';
  }
}

class DataStep {
  DataStep({
    this.distance,
    this.streetName,
    this.latitude,
    this.longitude,
    this.relativeDirection,
  });

  String? distance;
  String? streetName;
  double? latitude;
  double? longitude;
  String? relativeDirection;

  factory DataStep.fromJson(String str) => DataStep.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataStep.fromMap(Map<String, dynamic> json) => DataStep(
        distance: json["distance"],
        streetName: json["streetName"],
        latitude: json["latitude"] ??= json["latitude"].toDouble(),
        longitude: json["longitude"] ??= json["longitude"].toDouble(),
        relativeDirection: json["relativeDirection"],
      );

  Map<String, dynamic> toMap() => {
        "distance": distance,
        "streetName": streetName,
        "latitude": latitude,
        "longitude": longitude,
        "relativeDirection": relativeDirection,
      };

  @override
  String toString() {
    return 'DataStep{distance: $distance, streetName: $streetName, latitude: $latitude, longitude: $longitude, relativeDirection: $relativeDirection}';
  }
}

class PolyLine {
  PolyLine({
    this.latitude,
    this.longitude,
  });

  double? latitude;
  double? longitude;

  factory PolyLine.fromJson(String str) => PolyLine.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PolyLine.fromMap(Map<String, dynamic> json) => PolyLine(
        latitude: json["latitude"] ??= json["latitude"].toDouble(),
        longitude: json["longitude"] ??= json["longitude"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
      };

  @override
  String toString() {
    return 'PolyLine{latitude: $latitude, longitude: $longitude}';
  }
}

class RouteSteps {
  RouteSteps({
    this.routeId,
    this.route,
    this.startName,
    this.startSteps,
    this.endSteps,
    this.endName,
  });

  String? routeId;
  String? route;
  String? startName;
  String? startSteps;
  String? endSteps;
  String? endName;

  factory RouteSteps.fromJson(String str) =>
      RouteSteps.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RouteSteps.fromMap(Map<String, dynamic> json) => RouteSteps(
        routeId: json["routeId"],
        route: json["route"],
        startName: json["startName"],
        startSteps: json["startSteps"],
        endSteps: json["endSteps"],
        endName: json["endName"],
      );

  Map<String, dynamic> toMap() => {
        "routeId": routeId,
        "route": route,
        "startName": startName,
        "startSteps": startSteps,
        "endSteps": endSteps,
        "endName": endName,
      };

  @override
  String toString() {
    return 'RouteSteps{routeId: $routeId, route: $route, startName: $startName, startSteps: $startSteps, endSteps: $endSteps, endName: $endName}';
  }
}
