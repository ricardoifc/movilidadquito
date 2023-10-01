import 'package:movilidadquito/main.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/style.dart';
import 'package:movilidadquito/modules/ruteador/ui/widgets/widget_black_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

widgetAppBar(
    {Key? key,
    required title,
    activeInformation = false,
    activeArrow = true,
    ValueGetter? onTap,
      List<Widget>? actions,
      double elevation = 1.0,
      double sizeIcon = 24,
      double scrolledUnderElevation= 3.0,
    String icon = "${Global.asseticons}arrow.png",
    BoxFit fitIcon = BoxFit.fitHeight}) {
  return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: const TitleStyle(),
    ),
    toolbarHeight: 90,
    centerTitle: true,
    automaticallyImplyLeading: activeArrow,
    leadingWidth: activeArrow ? 48 : 0,
    leading: activeArrow
        ? UnconstrainedBox(
            child: InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap();
                } else {
                  Navigator.of(navigatorKey.currentContext!).pop();
                }
              },
              child: Image.asset(
                icon,
                fit: fitIcon,
                height: sizeIcon,
                width: sizeIcon,
                color: GlobalColor.colorprimary,
              ),
            ),
          )
        : null,
    elevation: elevation,
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
    shadowColor: Colors.grey,
      scrolledUnderElevation:scrolledUnderElevation,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
    actions: actions
  );
}

Widget widgetAction(String icon,{ValueGetter? onTap,BoxFit fitIcon = BoxFit.fitHeight,}){
  return UnconstrainedBox(
    child: GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Image.asset(
          "${Global.asseticons}$icon",
          fit: fitIcon,
          height: 24,
          width: 24,
          color: GlobalColor.colorprimary,
        ),
      ),
    ),
  );
}

///) Header app bar
Widget appBarParking({height = 90.0, required title, VoidCallback? callBack}) {
  return Container(
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
        ),
      ],
      color: GlobalColor.colorwhite,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    height: height,
    child: Row(
      children: [
        Expanded(
          flex: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 10,left: 5),
            child: const WidgetBlackArrow(),
          ),
        ),
        Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 10, bottom: 15),
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontFamily: Global.lettertitle,
                      fontSize: 20,
                      color: GlobalColor.colorlettertitle),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
        Expanded(
            flex: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 20,left: 5,right: 10),
              //width: 10,
              child: GestureDetector(
                onTap: (){
                  callBack!();
                },
                child: Image.asset(
                  "${Global.asseticons}flashslash.png",
                  fit: BoxFit.fitHeight,
                  height: 24,
                  width: 24,
                  color: GlobalColor.colorprimary,
                ),
              ),
            ))
      ],
    ),
  );
}
