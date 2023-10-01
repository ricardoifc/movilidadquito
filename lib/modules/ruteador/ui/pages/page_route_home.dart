import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../utils/global.dart';
import '../utils/global_colors.dart';
import '../utils/location/gps.dart';
import '../utils/responsive.dart';
import '../utils/utils.dart';
import '../widgets/widget_appbar_global.dart';
import '../widgets/widget_global.dart';
import '../widgets/widget_routers_filter.dart';
import 'package:google_maps_webservice_ex/directions.dart';

class PageRouteHome extends StatefulWidget {
  static const routePage = Global.routeprincipal;

  @override
  State<PageRouteHome> createState() => _PageRouteHomeState();
}

class _PageRouteHomeState extends State<PageRouteHome> {

    @override
  void initState() {
    super.initState();

    /*SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Gps().checkGPS().then((value) {
      });
    });*/
     }

  @override
  Widget build(BuildContext context) {

    return BodyPageHome();
  }

  @override
  void dispose() {
    super.dispose();

  }
}

class BodyPageHome extends StatelessWidget {
  BodyPageHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion(
        value: WidgetAppBarGlobal().appBarColor(GlobalColor.colorwhite),
        child: Scaffold(
          body: SafeArea(
              child: Stack(
                children: [
                  WidgetGlobal().map(),
                  locationGps(context),
                ],
              ),
          ),
        ));
  }

  final directions = GoogleMapsDirections(apiKey: 'AIzaSyCoQcikzh8RyjXsBlLCVxUJuvkHP2vpttM');

  Future<DirectionsResponse> getDirections(
      String origin,
      String destination,
      ) async {
    final result = await directions.directionsWithLocation(
      Location(lat: -0.2250014, lng: -78.5104133),
      Location(lat: -0.181297, lng: -78.490118),

    );
    print(result.routes.length);
    return result;
  }


  Widget locationGps(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
          },
          child: const CircleAvatar(
              backgroundColor: Colors.white

          ),
          /*child: Image(
            image: AssetImage('${Global.assetroutermultimodal}locationgps.png'),
            width: Responsive.of(context).wp(8),
          ),*/
        ));
  }


}
