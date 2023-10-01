
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetAppBarGlobal {
  /// Design app bar
  SystemUiOverlayStyle appBarColor(color) {
    return SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: color,
    );
  }
}