import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_label.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/utils.dart';
import 'package:movilidadquito/modules/ruteador/ui/widgets/widget_button.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

Future WidgetAlertMessage(msj, VoidCallback? callBack,
    {VoidCallback? callBackCancel,
    title,
    textAccept = GlobalLabel.btnAccept,
    textCancelar = GlobalLabel.btnCancel,
      Color colorBtnAccept= GlobalColor.colorprimary,
      Color colorBtnCancel= GlobalColor.colorsecondary,
    activeCancel = false,
    bool dismissible = false,
    required iconAlert}) async {
  return showDialog<void>(
    context: navigatorKey.currentContext!,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: GlobalColor.colorwhite,
        content: WillPopScope(
          onWillPop: ()=>Future.value(dismissible),
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset(
                  "${Global.assetalert}$iconAlert",
                  width: 64,
                  height: 64,
                  fit: BoxFit.contain,
                ),
                if (title!=null) ...[
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: GlobalColor.colorprimary,
                          fontFamily: Global.lettertitle,
                          fontSize: 20),
                    ),
                  ),
                ],
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    msj,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: GlobalColor.colorprimary,
                        fontFamily: Global.lettersubtitle,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Column(
            children: [
              WidgetButton(
                  text: textAccept,
                  color:  colorBtnAccept,
                  onTap: () {
                    Navigator.of(context).pop();
                    callBack!();
                  }),
              if (activeCancel) ...[
                const SizedBox(
                  height: 10,
                ),
                WidgetButton(
                  text: textCancelar,
                  color: colorBtnCancel,
                  colorText: GlobalColor.colorlettertitle,
                  colorBorder: GlobalColor.colorlettertitle,
                  onTap: () {
                    Navigator.of(context).pop();
                    if (callBackCancel != null) {
                      callBackCancel();
                    }
                  },
                ),
              ]
            ],
          ),
        ],
      );
    },
  );
}
