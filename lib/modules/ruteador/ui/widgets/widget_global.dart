import 'dart:ui' as ui;

import 'package:movilidadquito/main.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/location/gps.dart';
import '../utils/utils.dart';

class WidgetGlobal {

  Widget map() {
    return GoogleMap(
      //padding: EdgeInsets.only(bottom: providerPrincipal.paddingBottom),
      minMaxZoomPreference: const MinMaxZoomPreference(10.5, 18),
      initialCameraPosition: CameraPosition(
        target: LatLng(-4.009078, -79.206225),
      ),
      onMapCreated: (GoogleMapController controller) {

      },
      mapToolbarEnabled: false,
      onLongPress: (position) {

      },
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      compassEnabled: false,
      zoomControlsEnabled: false,
      buildingsEnabled: false,

    );
  }



  Future<Uint8List> assetToBytes(String path, {int targetWidth = Global.targetWidth}) async {
    final byteData = await rootBundle.load(path);
    final byte = byteData.buffer.asUint8List();
    final codec = await ui.instantiateImageCodec(byte, targetWidth: targetWidth);
    final frame = await codec.getNextFrame();
    final newByteData = await frame.image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return newByteData!.buffer.asUint8List();
  }

  Widget labelTextMenu(text, color, type, position) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontFamily: type == 1 ? Global.lettertitle : Global.lettersubtitle, color: color),
      textAlign: position,
    );
  }

  Widget labelText(text, color, type, position) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontFamily: type == 1 ? Global.lettertitle : Global.lettersubtitle, color: color),
      textAlign: position,
    );
  }

  Widget labelTextNumber(text, color, type, position) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontFamily: Global.letternumber, color: color),
      textAlign: position,
    );
  }

  Widget labelTextNumberBold(text, color, type, position) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontFamily: Global.letternumberbold, color: color),
      textAlign: position,
    );
  }




}
