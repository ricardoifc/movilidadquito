import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:movilidadquito/main.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:movilidadquito/modules/ruteador/ui/widgets/widget_container_rounded.dart';
import 'package:movilidadquito/modules/ruteador/ui/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import '../utils/global.dart';
import '../utils/utils.dart';

class WidgetMessageInformative {
  messageSuccess(String message) {
    return CherryToast.success(
            borderRadius: 10.0,
            title: const Text(''),
            displayTitle: false,
            description: Text(
              message,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: Global.lettersubtitle,
                  color: GlobalColor.colorlettertitle),
              textAlign: TextAlign.left,
            ),
            animationType: AnimationType.fromTop,
            animationDuration: const Duration(milliseconds: 500),
            autoDismiss: true)
        .show(Utils.globalContext.currentContext!);
  }

  messageSuccessGlobal(String message) {
    ToastFuture? toastFuture;

    toastFuture = showToastWidget(WidgetContainerRounded(
        color: Colors.white,
        withShadow: true,
        margin: const EdgeInsets.symmetric(horizontal: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.green.withAlpha(20), shape: BoxShape.circle),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: WidgetText.title(
                  text: message,
                  size: 16,
                ),
              ),
            ),
            Material(
              child: IconButton(onPressed: (){
                toastFuture?.dismiss(showAnim: true);
              }, icon: const Icon(Icons.close)),
            )
          ],
        )),
        duration: const Duration(milliseconds: 5000),
        position: ToastPosition.top,
        animationCurve: Curves.easeInBack,
        handleTouch: true,
        animationDuration: const Duration(milliseconds: 500));
  }

  messageError(String message, {int? milleseconds = 1500}) {
    return CherryToast.error(
            borderRadius: 10.0,
            title: const Text(''),
            displayTitle: false,
            description: Text(
              message,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: Global.lettertitle,
                  color: GlobalColor.colorlettertitle),
              textAlign: TextAlign.left,
            ),
            animationType: AnimationType.fromTop,
            animationDuration: Duration(milliseconds: 1000),
            toastDuration: Duration(milliseconds: milleseconds!),
            autoDismiss: true)
        .show(navigatorKey.currentContext!);
  }

  messageInformative(String message) {
    return CherryToast.info(
            borderRadius: 10.0,
            title: const Text(''),
            displayTitle: false,
            description: Text(
              message,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: Global.lettertitle,
                  color: GlobalColor.colorlettertitle),
              textAlign: TextAlign.left,
            ),
            animationType: AnimationType.fromTop,
            animationDuration: const Duration(milliseconds: 1000),
            autoDismiss: true)
        .show(Utils.globalContext.currentContext!);
  }
}
