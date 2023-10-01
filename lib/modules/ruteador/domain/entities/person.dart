import 'dart:convert';

import 'package:movilidadquito/modules/ruteador/data/repositories/global_url.dart';


class DataPerson {
  DataPerson({this.token, this.person, this.refreshToken});

  String? token;
  Person? person;
  RefreshToken? refreshToken;

  factory DataPerson.fromJson(String str) =>
      DataPerson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataPerson.fromMap(Map<String, dynamic> json) => DataPerson(
        token: json["token"],
        person: json["person"] == null ? null : Person.fromMap(json["person"]),
        refreshToken: json["refreshToken"] == null
            ? null
            : RefreshToken.fromMap(json["refreshToken"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "person": person == null ? null : person!.toMap(),
        "refreshToken": refreshToken == null ? null : refreshToken!.toMap(),
      };

  DataPerson.map(dynamic obj) {
    token = obj["token"];
    person = Person.map(obj["person"]);
    refreshToken = obj["refreshToken"] == null
        ? null
        : RefreshToken.map(obj["refreshToken"]);
  }

  @override
  String toString() {
    return 'DataPerson{token: $token, person: $person}';
  }
}

class Person {
  //Global Rol
  //1. Estudiante, 2. Docente, 3. Administrativo, 4. Chofer
  static const rolStudent='Estudiante';
  static const rolTeacher='Docente';
  static const rolAdmin='Administrativo';
  static const rolDriver='Chofer';

  Person(
      {this.idPerson,
      this.identification,
      this.fullname,
      this.name,
      this.lastname,
      this.email,
      this.cellphone,
      this.idAccount,
      this.username,
      this.active,
      this.image,
      this.role,
      this.typeMember=0,
      this.type,
      this.principalStreet,
      this.secondaryStreet,
      this.latitude,
      this.longitude,
        this.countryCode,
        this.google,
      this.isDisabled,
      this.imei,
        this.isBicibus,
        this.isCarpool,
      });

  int? idPerson;
  String? identification;
  String? fullname;
  String? name;
  String? lastname;
  String? email;
  String? cellphone;
  int? idAccount;
  String? username;
  bool? active;
  String? image;
  int? role;
  int? typeMember;
  String? type;
  String? principalStreet;
  String? secondaryStreet;
  double? latitude;
  double? longitude;
  String? countryCode;
  bool? google;
  bool? isDisabled;//persona con discapacidad
  String? imei;
  bool? isBicibus;
  bool? isCarpool;

  factory Person.fromJson(String str) => Person.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Person.fromMap(Map<String, dynamic> json) => Person(
      idPerson: json["idPerson"],
      identification: json["identification"],
      fullname: json["fullname"],
      name: json["name"],
      lastname: json["lastname"],
      email: json["email"]==null?'': getEmailMask(json["email"]??''),
      cellphone: json["cellphone"],
      countryCode: json["countryCode"],
      idAccount: json["idAccount"],
      username: json["username"],
      active: json["active"],
      image: json["image"],
      role: json["role"],
      typeMember: json["typeMember"],
      type: json["type"],
      principalStreet: json["principal_street"],
      secondaryStreet: json["secondary_street"],
      latitude: json["latitude"]?.toDouble() ?? 0.0,
      longitude: json["longitude"]?.toDouble() ?? 0.0,
      google: json["google"],
      isDisabled: json["isDisabled"],
      imei: json["imei"],
      isBicibus: json["isBicibus"],
      isCarpool: json["isCarpool"],
  );


  Map<String, dynamic> toMap() => {
        "idPerson": idPerson,
        "identification": identification,
        "fullname": fullname,
        "name": name,
        "lastname": lastname,
        "email": email,
        "cellphone": cellphone,
        "countryCode": countryCode,
        "idAccount": idAccount,
        "username": username,
        "active": active,
        "image": image,
        "role": role,
        "typeMember": typeMember,
        "type": type,
        "principal_street": principalStreet,
        "secondary_street": secondaryStreet,
        "latitude": latitude,
        "longitude": longitude,
        "google": google,
        "isDisabled": isDisabled,
        "imei": imei,
        "isBicibus": isBicibus,
        "isCarpool": isCarpool,
      };

  Person.map(dynamic obj) {
    idPerson = obj["idPerson"];
    identification = obj["identification"];
    fullname = obj["fullname"];
    name = obj["name"];
    lastname = obj["lastname"];
    email = obj["email"];
    cellphone = obj["cellphone"];
    countryCode = obj["countryCode"];
    idAccount = obj["idAccount"];
    username = obj["username"];
    active = obj["active"];
    image = obj["image"];
    role = obj["role"];
    typeMember = obj["typeMember"];
    type = obj["type"];
    principalStreet = obj["principal_street"];
    secondaryStreet = obj["secondary_street"];
    latitude = obj["latitude"];
    longitude = obj["longitude"];
    google = obj["google"];
    isDisabled = obj["isDisabled"];
    imei = obj["imei"];
    isBicibus = obj["isBicibus"];
    isCarpool = obj["isCarpool"];
  }


  @override
  String toString() {
    return 'Person{idPerson: $idPerson, identification: $identification, fullname: $fullname, name: $name, lastname: $lastname, email: $email, cellphone: $cellphone, idAccount: $idAccount, username: $username, active: $active, image: $image, role: $role, type: $type, principalStreet: $principalStreet, secondaryStreet: $secondaryStreet, latitude: $latitude, longitude: $longitude, countryCode: $countryCode, google: $google, isDisabled: $isDisabled, imei: $imei, isBicibus: $isBicibus, isCarpool: $isCarpool}';
  }

  String? getProfilePhoto(){
    if(image==null) return null;
    //if(google ?? false){
      //return image;
    //}
    return '${GlobalUrl.urlimageuser}${image??""}';
  }
   static String getEmailMask(String email){
    if(email.contains('@') && email.length>5 ){
      var emailaux=email.split('@');
      String newemail= emailaux[0].replaceRange(1,emailaux[0].length-1,'*'*(emailaux[0].length-3));
      email=newemail+'@'+emailaux[1];
    }
    return email;
  }
}

class RefreshToken {
  RefreshToken({
    this.idRefreshToken,
  });

  int? idRefreshToken;

  factory RefreshToken.fromJson(String str) =>
      RefreshToken.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RefreshToken.fromMap(Map<String, dynamic> json) => RefreshToken(
        idRefreshToken: json["idRefreshToken"],
      );

  Map<String, dynamic> toMap() => {
        "idRefreshToken": idRefreshToken,
      };

  RefreshToken.map(dynamic obj) {
    idRefreshToken = obj["idRefreshToken"];
  }
}
