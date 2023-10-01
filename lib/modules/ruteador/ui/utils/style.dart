import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:flutter/material.dart';

class TitleStyle extends TextStyle {
  final double size;
  final Color color;

  const TitleStyle({this.size = 20, this.color = GlobalColor.colorlettertitle})
      : super(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: size,
    fontFamily: 'metaprobold',
  );
}

class NumberBoldStyle extends TextStyle {
  final double size;
  final Color color;

  const NumberBoldStyle({this.size = 20, this.color = GlobalColor.colorlettertitle})
      : super(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: size,
    fontFamily: 'metaheadbold',
  );
}

class SubtitleStyle extends TextStyle {
  final double size;
  final Color color;

  const SubtitleStyle({this.size = 20, this.color = GlobalColor.colorlettertitle})
      : super(
    color: color,
    // fontWeight: FontWeight.bold,
    fontSize: size,
    fontFamily: Global.lettersubtitle,
  );
}

class NormalStyle extends TextStyle {
  final double size;
  final Color color;

  const NormalStyle({this.size = 16, this.color = GlobalColor.colorlettertitle})
      : super(
    color: color,
    fontSize: size,
    fontFamily: 'metaproregular',
  );
}

class NumberStyle extends TextStyle {
  final double size;

  const NumberStyle({this.size = 16, Color color = GlobalColor.colorlettertitle})
      : super(
    color: color,
    fontSize: size,
    fontFamily: 'metahead',
  );
}