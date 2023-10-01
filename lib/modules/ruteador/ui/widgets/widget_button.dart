import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:movilidadquito/modules/ruteador/ui/widgets/widget_global.dart';
import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;
  final Function? onTap;
  final Color colorText;
  final Color colorBorder;
  final double sizeText;

  const WidgetButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.onTap,
      this.colorText = Colors.white,
      this.colorBorder = Colors.transparent,
      this.sizeText = 18,
      this.icon = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: color,
              foregroundColor: color,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: GlobalColor.colorborderbutton, width: 1),
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: onTap == null ? null : () => onTap!(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != ""
                  ? Image.asset(
                      "${Global.asseticons}$icon",
                      width: 50,
                      height: 27,
                      fit: BoxFit.contain,
                    )
                  : const SizedBox(),
              WidgetGlobal().labelText(text, colorText, 1, TextAlign.center),
            ],
          )),
    );
  }
}
