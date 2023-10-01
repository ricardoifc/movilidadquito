import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:flutter/material.dart';

class WidgetCustomMarker extends CustomPainter {
  String time;
  String distancia;
  BuildContext context;
  Color color;

  WidgetCustomMarker(this.time, this.distancia, this.context, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    paint.color = Colors.white;

    final Path path = Path();
    path.moveTo(100, 20);
    path.lineTo(size.width + 40, 20);
    path.lineTo(size.width + 40, 100);
    path.lineTo(100, 100);
    canvas.drawShadow(path, Colors.black87, 10, false);

    final cajaBlanca = Rect.fromLTWH(100, 20, size.width + 100, 100);
    canvas.drawRect(cajaBlanca, paint);

    TextSpan textSpanTime = TextSpan(style: const TextStyle(color: Colors.black, fontSize: 25, fontFamily: Global.letternumber, fontWeight: FontWeight.bold), text: time);
    TextSpan textSpandistancia = TextSpan(style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: Global.letternumber), text: distancia);


    TextPainter textPainter = TextPainter(
      text: textSpanTime,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
      maxLines: 1,
      ellipsis: '...',
    )..layout(maxWidth: size.width - 80);

    textPainter.paint(canvas, const Offset(120, 35));

    textPainter = TextPainter(text: textSpandistancia, textDirection: TextDirection.ltr, textAlign: TextAlign.left, maxLines: 1, ellipsis: "...")..layout(maxWidth: size.width - 80);

    textPainter.paint(canvas, const Offset(120, 80));

    //location icon

    canvas.translate(20, size.height * 0.22);
  }

  @override
  bool shouldRepaint(WidgetCustomMarker oldDelegate) => true;

  @override
  bool souldRebuildSemantics(WidgetCustomMarker oldDelegate) => false;
}
