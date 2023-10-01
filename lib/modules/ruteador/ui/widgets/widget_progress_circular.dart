import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:flutter/material.dart';

class WidgetProgressCircular extends StatelessWidget {
  final Color color;

  const WidgetProgressCircular({Key? key, this.color = GlobalColor.colorprimary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: Image(
              image: AssetImage(
                  '${Global.assetroutermultimodal}loading.gif'),
              width: 35)),
    );
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
