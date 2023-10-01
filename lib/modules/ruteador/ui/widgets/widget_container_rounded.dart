import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:flutter/material.dart';

class WidgetContainerRounded extends StatelessWidget {
  const WidgetContainerRounded(
      {required this.child, Key? key,
      this.padding = const EdgeInsets.all(10),
        this.margin,
      this.color = GlobalColor.colorfillcolor,
      this.withShadow = false, this.onClick, this.height, this.width})
      : super(key: key);
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final Color color;
  final bool withShadow;
  final ValueGetter? onClick;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: withShadow
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null),
        margin: margin,
        padding: padding,
        child: child,
      ),
    );
  }
}
