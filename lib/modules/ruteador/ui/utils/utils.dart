import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:movilidadquito/main.dart';
import 'package:movilidadquito/modules/ruteador/data/models/response_route.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:movilidadquito/modules/ruteador/ui/widgets/widget_custom_marker.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/entities/dispositive.dart';
import '../widgets/widget_text.dart';

class Utils {
  static GlobalKey<NavigatorState> globalContext = GlobalKey<NavigatorState>();
  PackageInfo? packageInfo;
  Dispositive? dispositive;
  IosDeviceInfo? iosDeviceInfo;
  AndroidDeviceInfo? androidDeviceInfo;
  final DeviceInfoPlugin? deviceInfoPlugin = DeviceInfoPlugin();

  /// Design app bar
  SystemUiOverlayStyle colorAppBar(color) {
    return SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: color,
    );
  }

  static BoxDecoration getDecorationBottomSheet(
      BuildContext context, Radius radius) {
    return BoxDecoration(
      boxShadow: const <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 1.0, offset: Offset(0.75, 0.75))
      ],
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: radius,
        topRight: radius,
      ),
    );
  }
  static String parseDurationTravel(List<Indication>? indications) {
    int hours = 0;
    int minutes = 0;
    Duration timeDuration=const Duration();
    try {
      if (indications != null) {
        for(var time in indications) {
          var parts = time.duration!.split(":");
          timeDuration+= Duration(hours: int.parse(parts[0]), minutes: int.parse(parts[1]));
        }
      }
      var args = timeDuration.toString().split(":");
      hours = int.parse(args[0]);
      minutes = (int.parse(args[1]));
      if(hours >= 1){
        return "${hours}h ${minutes} min";
      }else {
        return "${minutes} min";
      }
    } on Exception catch (e) {
      return "$e";
    }
  }

  static String parseTimeDurationTravel(String timeTravel) {
    try {
      var args = timeTravel.toString().split(":");
      var hours = int.parse(args[0]);
      var minutes = int.parse(args[1]);

      if(hours >= 1){
        return "${hours}h ${minutes} min";
      }else {
        return "${minutes} min";
      }
    } on Exception catch (e) {
      return "$e";
    }
  }

  static BoxDecoration getDecorationContainer(Radius radius,
      {Color? color = Colors.grey,
      Color colorBorder = GlobalColor.colorprimary,
      Color colorbox = Colors.white10}) {
    return BoxDecoration(
      border: Border.all(
        color: colorBorder.withOpacity(0.1),
        style: BorderStyle.solid,
        width: 1,
      ),
      color: colorbox,
      borderRadius: BorderRadius.all(radius),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: color!, blurRadius: 3.0, offset: const Offset(0.75, 0.75))
      ],
    );
  }

  static LinearGradient getLinearGradient(
      {Color color1 = GlobalColor.colorLinearGradient1,
      Color color2 = GlobalColor.colorwhite}) {
    return LinearGradient(
      colors: [
        color1,
        color2,
      ],
      begin: const Alignment(1.2, -1),
      end: const Alignment(1, 1),
    );
  }

  static Future<Uint8List> getBytesFromAsset(String path, int? width) async {
    ByteData? data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
  }


  Future dateTimePicker() async {
    DateTime selectedDate = DateTime.now();
    String formattedDate = '';
    final selected = await showDatePicker(
      context: navigatorKey.currentContext!,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      formattedDate = DateFormat('yyyy-MM-dd').format(selected);
    }

    return formattedDate;
  }

  static Future datePickerWeek(
      {DateTime? selectedDate, DateTime? firstDate, DateTime? lastDate}) async {
    final selected = await showDatePicker(
      context: navigatorKey.currentContext!,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 6)),
   /*   builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: GlobalColor.colorSelected, // <-- SEE HERE
              onPrimary: GlobalColor.colorsecondary, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
           *//* textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),*//*
          ),
          child: child!,
        );
      },*/
    );
    if (selected != null && selected != selectedDate) {
      return selected;
    }
    return selectedDate;
  }

  static Future datePicker(
      {DateTime? selectedDate, DateTime? firstDate, DateTime? lastDate}) async {
    final selected = await showDatePicker(
      context: Utils.globalContext.currentContext!,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      return selected;
    }
    return selectedDate;
  }

  Future hourTimePicker({DateTime? initialTime, bool cancelTime = false}) async {
    DateTime now = initialTime ?? DateTime.now();
    DateTime selectedDateTime = now;

    final aux = await showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: GlobalColor.colorwhite,
          title: WidgetText.title(
            text: 'Seleccionar la hora:',
            size: 16,
          ),
          content: SizedBox(
            height: 350,
            width: 350.0,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: CupertinoDatePicker(
                    initialDateTime: now,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime newDateTime) {
                      selectedDateTime = newDateTime;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () => !cancelTime ? Navigator.of(context).pop(now): Navigator.of(context).pop(null),
                        child: WidgetText.title(
                          text: "Cancelar",
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          cancelTime=false;
                          Navigator.of(context).pop(selectedDateTime);
                          },
                        child: WidgetText.title(
                          text: "Aceptar",
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (aux != null && aux != selectedDateTime) {
      selectedDateTime = aux;
    }
    return cancelTime?null: Global.formatHm.format(selectedDateTime);
  }

  Future informationDispositive() async {
    packageInfo = await PackageInfo.fromPlatform();
    dispositive = Dispositive();
    if (Platform.isAndroid) {
      androidDeviceInfo = await deviceInfoPlugin!.androidInfo;
      dispositive!.imei = androidDeviceInfo!.id;
    } else {
      iosDeviceInfo = await deviceInfoPlugin!.iosInfo;
      dispositive!.imei = iosDeviceInfo!.identifierForVendor!;
    }
    return dispositive;
  }

  static LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Duration parseDuration(String? time) {
    int hours = 0;
    int minutes = 0;
    int seconds = 0;
    try {
      if (time != null) {
        var parts = time.split(":");
        if (parts.length == 3) {
          hours = int.parse(parts[0]);
          minutes = int.parse(parts[1]);
          seconds = int.parse(parts[2]);
          // debugPrint("${hours}");
          // debugPrint("${minutes}");
          // debugPrint("${seconds}");
          return Duration(hours: hours, minutes: minutes, seconds: seconds);
        }
      }
      return Duration.zero;
    } on Exception catch (e) {
      debugPrint("Error parsing duration $e");
      return Duration.zero;
    }
  }

  static String durationToHMs(Duration duration) {
    var microseconds = duration.inMicroseconds;
    var sign = (microseconds < 0) ? "-" : "";

    var hours = microseconds ~/ Duration.microsecondsPerHour;
    microseconds = microseconds.remainder(Duration.microsecondsPerHour);

    if (microseconds < 0) microseconds = -microseconds;

    var minutes = microseconds ~/ Duration.microsecondsPerMinute;
    microseconds = microseconds.remainder(Duration.microsecondsPerMinute);

    var minutesPadding = minutes < 10 ? "0" : "";

    var seconds = microseconds ~/ Duration.microsecondsPerSecond;
    microseconds = microseconds.remainder(Duration.microsecondsPerSecond);

    var secondsPadding = seconds < 10 ? "0" : "";
    return "$sign${hours.abs()}:"
        "$minutesPadding$minutes:"
        "$secondsPadding$seconds";
  }


  static String timeNotification(String? dateStart) {
    var timeStar =
        Global.formatYMdHms.format(DateTime.parse(dateStart!).toLocal());
    var time = Global.formatYMdHms.format(DateTime.now().toLocal());
    Duration difference =
        DateTime.parse(time).difference(DateTime.parse(timeStar));
    if (difference.inHours == 0) {
      if (difference.inMinutes == 0) return "Justo ahora";
      return "Hace ${difference.inMinutes} minutos";
    } else {
      if (difference.inHours > 24) {
        return "Hace ${difference.inDays} días";
      } else {
        return "Hace ${difference.inHours} hora";
      }
    }
    //timeUse="${difference.toString().split(".")[0]} ";
  }

  static launchURL(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<BitmapDescriptor> createMarkerImageCircle(
      String imageUrl, Size size) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    // final Paint shadowPaint = Paint()..color = Colors.blue.withAlpha(100);
    final double shadowWidth = 1.0;

    final Paint borderPaint = Paint()..color = Colors.white;
    final double borderWidth = 3.0;

    final double imageOffset = shadowWidth + borderWidth;

    // Add border circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(shadowWidth, shadowWidth,
              size.width - (shadowWidth * 2), size.height - (shadowWidth * 2)),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);

    // Oval for the image
    Rect oval = Rect.fromLTWH(imageOffset, imageOffset,
        size.width - (imageOffset * 2), size.height - (imageOffset * 2));

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    // Add image
    final Codec codec = await instantiateImageCodec(
        await getBytesFromNetwork(imageUrl, size.width.toInt()));
    final FrameInfo frameInfo = await codec.getNextFrame();
    paintImage(
        canvas: canvas,
        image: frameInfo.image,
        rect: oval,
        fit: BoxFit.fitWidth);

    // Convert canvas to image
    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());

    // Convert image to bytes
    final ByteData? byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  static formatDistance(String data) {
    String dataDistance = '';
    int distance = double.parse(data).round();
    if (distance > 1000) {
      dataDistance = '${(distance / 1000).toStringAsFixed(0)} Km ';
    } else {
      dataDistance = '$distance m ';
    }
    return dataDistance;
  }

  static Future<Uint8List> getBytesFromNetwork(String imageUrl, int? width,
      {var assetDefault = "${Global.asseticons}user.png"}) async {
    final http.Response response = await http
        .get(Uri.parse(imageUrl))
        .catchError((onError) => http.Response("", 500));
    Uint8List markerImageBytes;

    if (response.statusCode == 200) {
      markerImageBytes = response.bodyBytes;
    } else {
      markerImageBytes = await getBytesFromAsset(assetDefault, width);
    }

    Codec codec = await instantiateImageCodec(
        markerImageBytes.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static Future<BitmapDescriptor> marcadorTitle(BuildContext context,Color color, String time,String distance ) async {
    final recorder =  ui.PictureRecorder();
    final canvas =  ui.Canvas(recorder);
    final size =  ui.Size(230, 200);
    final markerInicio =  WidgetCustomMarker("$distance", time, context,color);
    markerInicio.paint(canvas, size);
    final picture = recorder.endRecording();
    final image = await picture.toImage(size.width.toInt(), size.height.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

}

class ClipPathClass extends CustomClipper<Path> {
  ClipPathClass(
      {this.svgPath, this.offsetX = 0, this.offsetY = 0, this.escale = 1});

  String? svgPath;
  double escale;
  double offsetX;
  double offsetY;

  @override
  Path getClip(Size size) {
    var path = parseSvgPathData(svgPath!); // Path();
    final Matrix4 matrix4 = Matrix4.identity();

    matrix4.scale(escale, escale);
    return path.transform(matrix4.storage).shift(Offset(offsetX, offsetY));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
