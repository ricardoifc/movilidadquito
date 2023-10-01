import 'package:movilidadquito/main.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:movilidadquito/modules/ruteador/ui/widgets/widget_progress_circular.dart';
import 'package:flutter/material.dart';

class WidgetProgressDialog {
  showProgressCircular({bool dismissible = true}) {
    try {
      showDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: false,
          barrierColor: Colors.white,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: WillPopScope(
                onWillPop: () => Future.value(dismissible),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 100,
                    child: Stack(
                      children: const [
                        Center(
                          child: Center(
                            child: WidgetProgressCircular(
                              color: GlobalColor.colorprimary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  showProgress(title, {bool dismissible = true}) {
    try {
      showDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: WillPopScope(
                onWillPop: () => Future.value(dismissible),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Image(image: AssetImage('${Global.assetroutermultimodal}loading_clipp1.gif'), width: 55)),
                  //child: Center(child: ProgressCircular(top:0,),)),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: Global.lettertitle, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  hideProgress() {
    if (ModalRoute.of(navigatorKey.currentContext!)?.settings.name != null) {
      Navigator.popUntil(navigatorKey.currentContext!, ModalRoute.withName(ModalRoute.of(navigatorKey.currentContext!)!.settings.name!));
    } else {
      Navigator.pop(navigatorKey.currentContext!);
    }
  }
}
