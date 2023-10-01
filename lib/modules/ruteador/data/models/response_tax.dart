// To parse this JSON data, do
//
//     final responseTax = responseTaxFromMap(jsonString);

import 'dart:convert';
import 'package:movilidadquito/modules/ruteador/data/models/response.dart';

class ResponseTax extends Response {
  ResponseTax({this.data, int? status, String? message}) : super(internalCode: status, message: message);

  List<TravelRoute>? data;

  factory ResponseTax.fromJson(String str) => ResponseTax.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  ResponseTax.fromMap(Map<String, dynamic> json)
      : data = json["data"] == null ? [] : List<TravelRoute>.from(json["data"]!.map((x) => TravelRoute.fromMap(x))),
        super.fromMap(json);

  Map<String, dynamic> toMap() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'ResponseTax{response: ${super.toString()}, data: $data}';
  }
}


class TravelRoute {
  String? error;
  int? tipo;
  int? identificativo;
  String? s;
  String? e;
  dynamic? d;
  dynamic? co2;
  String? u;
  dynamic? t;
  dynamic? c;
  String? mod;
  int? estado;
  int? fuenteData;
  Data2? data2;

  TravelRoute({
    this.error,
    this.tipo,
    this.identificativo,
    this.s,
    this.e,
    this.d,
    this.co2,
    this.u,
    this.t,
    this.c,
    this.mod,
    this.estado,
    this.fuenteData,
    this.data2,
  });

  factory TravelRoute.fromJson(String str) => TravelRoute.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TravelRoute.fromMap(Map<String, dynamic> json) => TravelRoute(
        error: json["error"],
        tipo: json["tipo"],
        identificativo: json["identificativo"],
        s: json["s"],
        e: json["e"],
        d: json["d"],
        co2: json["co2"],
        u: json["u"],
        t: json["t"],
        c: json["c"],
        mod: json["mod"],
        estado: json["estado"],
        fuenteData: json["fuenteData"],
        data2: json["data2"] == null ? null : Data2.fromMap(json["data2"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "tipo": tipo,
        "identificativo": identificativo,
        "s": s,
        "e": e,
        "d": d,
        "co2": co2,
        "u": u,
        "t": t,
        "c": c,
        "mod": mod,
        "estado": estado,
        "fuenteData": fuenteData,
        "data2": data2?.toMap(),
      };
}

class Data2 {
  Ruta? ruta;
  Viaje? viaje;

  Data2({
    this.ruta,
    this.viaje,
  });

  factory Data2.fromJson(String str) => Data2.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data2.fromMap(Map<String, dynamic> json) => Data2(
        ruta: json["ruta"] == null ? null : Ruta.fromMap(json["ruta"]),
        viaje: json["viaje"] == null ? null : Viaje.fromMap(json["viaje"]),
      );

  Map<String, dynamic> toMap() => {
        "ruta": ruta?.toMap(),
        "viaje": viaje?.toMap(),
      };
}

class Ruta {
  int? idRuta;
  int? sentido;
  String? ruta;
  String? color;
  String? codigo;

  Ruta({
    this.idRuta,
    this.sentido,
    this.ruta,
    this.color,
    this.codigo,
  });

  factory Ruta.fromJson(String str) => Ruta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ruta.fromMap(Map<String, dynamic> json) => Ruta(
        idRuta: json["idRuta"],
        sentido: json["sentido"],
        ruta: json["ruta"],
        color: json["color"],
        codigo: json["codigo"],
      );

  Map<String, dynamic> toMap() => {
        "idRuta": idRuta,
        "sentido": sentido,
        "ruta": ruta,
        "color": color,
        "codigo": codigo,
      };
}

class Viaje {
  Parada? paradaIni;
  Parada? paradaFin;

  Viaje({
    this.paradaIni,
    this.paradaFin,
  });

  factory Viaje.fromJson(String str) => Viaje.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Viaje.fromMap(Map<String, dynamic> json) => Viaje(
        paradaIni: json["paradaIni"] == null ? null : Parada.fromMap(json["paradaIni"]),
        paradaFin: json["paradaFin"] == null ? null : Parada.fromMap(json["paradaFin"]),
      );

  Map<String, dynamic> toMap() => {
        "paradaIni": paradaIni?.toMap(),
        "paradaFin": paradaFin?.toMap(),
      };
}

class Parada {
  int? disFin;
  int? idEstacion;
  int? idTipo;
  double? latitud;
  double? longitud;
  String? codigo;
  String? direccion;
  String? estacion;
  String? tipo;
  int? tipoAbordaje;
  int? disInicio;

  Parada({
    this.disFin,
    this.idEstacion,
    this.idTipo,
    this.latitud,
    this.longitud,
    this.codigo,
    this.direccion,
    this.estacion,
    this.tipo,
    this.tipoAbordaje,
    this.disInicio,
  });

  factory Parada.fromJson(String str) => Parada.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parada.fromMap(Map<String, dynamic> json) => Parada(
        disFin: json["disFin"],
        idEstacion: json["idEstacion"],
        idTipo: json["idTipo"],
        latitud: json["latitud"]?.toDouble(),
        longitud: json["longitud"]?.toDouble(),
        codigo: json["codigo"],
        direccion: json["direccion"],
        estacion: json["estacion"],
        tipo: json["tipo"],
        tipoAbordaje: json["tipoAbordaje"],
        disInicio: json["disInicio"],
      );

  Map<String, dynamic> toMap() => {
        "disFin": disFin,
        "idEstacion": idEstacion,
        "idTipo": idTipo,
        "latitud": latitud,
        "longitud": longitud,
        "codigo": codigo,
        "direccion": direccion,
        "estacion": estacion,
        "tipo": tipo,
        "tipoAbordaje": tipoAbordaje,
        "disInicio": disInicio,
      };
}
