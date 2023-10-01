import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/style.dart';
import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  WidgetText(
      {required this.text,
      this.size = 14,
      this.color = GlobalColor.colorprimary,
      Key? key, this.maxLines})
      : textStyle = NormalStyle(size: size, color: color),
        super(key: key);

  WidgetText.title(
      {required this.text,
      this.size = 20,
      this.color = GlobalColor.colorprimary,
      Key? key, this.maxLines})
      : textStyle = TitleStyle(size: size, color: color),
        super(key: key);

  WidgetText.titleNumber(
      {required this.text,
      this.size = 20,
      this.color = GlobalColor.colorprimary,
      Key? key, this.maxLines})
      : textStyle = NumberBoldStyle(size: size, color: color),
        super(key: key);

  WidgetText.number(
      {required this.text,
      this.size = 14,
      this.color = GlobalColor.colorprimary,
      Key? key, this.maxLines})
      : textStyle = NumberStyle(size: size, color: color),
        super(key: key);

  WidgetText.subTitle(
      {required this.text,
      this.size = 14,
      this.color = GlobalColor.colorgrey70,
      Key? key, this.maxLines})
      : textStyle = SubtitleStyle(size: size, color: color),
        super(key: key);

  final String text;
  final TextStyle textStyle;
  final double size;
  final Color color;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }
}
