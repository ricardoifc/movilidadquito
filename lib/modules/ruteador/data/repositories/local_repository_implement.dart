import 'dart:convert';

import 'package:movilidadquito/modules/ruteador/domain/entities/person.dart';
import 'package:movilidadquito/modules/ruteador/domain/repositories/local_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepositorieImplement extends LocalRepositoryInterface {
  static const userMoverU = 'usermoveru';
  static const travelTracking = 'travelTracking';
  static const statusNofitication = 'notification';
  static const newNofitication = 'newnotification';
  static const filterRoute = 'rangeFilter';

  @override
  Future saveUser(DataPerson user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    JsonEncoder encoder = const JsonEncoder();
    prefs.setString(userMoverU, encoder.convert(user.toMap()));
  }

  @override
  Future<DataPerson?> getUser() async {
    JsonDecoder decoder = const JsonDecoder();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString(userMoverU) ?? "";
    if (user.isEmpty) {
      return null;
    }
    var decoded = decoder.convert(user);
    if (decoded["person"] == null) return null;
    return DataPerson.map(decoder.convert(user));
  }

  @override
  Future deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(userMoverU);
  }

  @override
  Future deleteStatusNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(statusNofitication);
  }

  @override
  Future<bool?> getStatusNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool(statusNofitication) ?? false;
    return status;
  }

  @override
  Future saveStatusNotification(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(statusNofitication, status);
  }

  @override
  Future deleteTravel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(travelTracking);
  }

  @override
  Future deleteNewNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(newNofitication);
  }

  @override
  Future<bool?> getNewNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool(newNofitication) ?? false;
    return status;
  }

  @override
  Future saveNewNotification(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(newNofitication, status);
  }

  @override
  Future saveFilterRange(double range) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(filterRoute, range);
  }

  @override
  Future<double?> getRangeFilter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    double? status = prefs.getDouble(filterRoute) ?? 1;
    return status;
  }
}
