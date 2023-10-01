import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
//import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as permiso;

class Gps {
  //Location location = Location();
  static double? _latitude = 0.0;
  static double? _longitude = 0.0;
  static Position? _position;
  static StreamSubscription<Position>? positionStream;

  static double get latitude => _latitude!;

  static set latitude(double value) {
    _latitude = value;
  }

  static double get longitude => _longitude!;

  static set longitude(double value) {
    _longitude = value;
  }

  static Position get position => _position!;

  static set position(Position value) {
    _position = value;
  }

  final geolocator.GeolocatorPlatform _geolocatorPlatform = geolocator.GeolocatorPlatform.instance;

  LocationSettings locationSettings = defaultTargetPlatform == TargetPlatform.android
      ? geolocator.AndroidSettings(
          accuracy: geolocator.LocationAccuracy.high,
          forceLocationManager: true,
          intervalDuration: const Duration(milliseconds: 10000),
          distanceFilter: 5,
          foregroundNotificationConfig: const ForegroundNotificationConfig(notificationText: "Estamos obteniendo tu ubicación", notificationTitle: "Servicio en ejecución", enableWakeLock: true, enableWifiLock: true
              // notificationIcon: AndroidResource(name: 'ic_launcher', defType: 'mipmap')
              ))
      : (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS)
          ? AppleSettings(
              accuracy: geolocator.LocationAccuracy.high,
              activityType: ActivityType.fitness,
              distanceFilter: 5,
              pauseLocationUpdatesAutomatically: true,
              // Only set to true if our app will be started up in the background.
              showBackgroundLocationIndicator: false,
            )
          : const LocationSettings(
              accuracy: geolocator.LocationAccuracy.high,
              distanceFilter: 5,
            );

  Future checkGPS() async {
    final status = await permiso.Permission.locationWhenInUse.request();
    if (status == permiso.PermissionStatus.granted) {
      //final locationServiceEnabled = await location.serviceEnabled();
      final locationServiceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
      if (locationServiceEnabled) {
        positionNow();
        return true;
      } else {
       // location.requestService().then((value) {
        _geolocatorPlatform.requestPermission().then((value) {
          if (value==LocationPermission.always || value==LocationPermission.whileInUse) {
            positionNow();
            return true;
          } else {
            positionNow();
            return false;
          }
        });
      }
    } else {
      permiso.openAppSettings();
      return false;
    }
  }

  positionNow({bool background = false, ValueChanged<Position?>? positionBackgroud}) async {
    positionStream?.cancel();
    if (background) {
      positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen((position) {
        positionNew(position);
        if (positionBackgroud != null) positionBackgroud(position);
      },onError: (err){
        checkGPS();
      });
    } else {
      positionStream = Geolocator.getPositionStream().listen((position) {
        positionNew(position);
        if (positionBackgroud != null) positionBackgroud(position);
      },onError: (err){
        checkGPS();
      });
    }
  }

  positionNew(Position position) {
    latitude = position.latitude;
    longitude = position.longitude;
    position = position;
  }
}
