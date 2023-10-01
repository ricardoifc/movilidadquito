// import 'dart:typed_data';
//
// import 'package:clipp_maas/modules/ruteador/ui/utils/global_colors.dart';
// import 'package:flutter/material.dart';
//
// Widget widgetFadeInImage(String url, {Widget placeHolder = const Icon(Icons.person,color: GlobalColor.colorgrey70,), double height = 48, double width = 48, BoxFit boxFit = BoxFit.cover, Alignment alignment = Alignment.center}) {
//   return SizedBox(
//     height: height,
//     width: width,
//     child:
//     FadeInImage.memoryNetwork(
//       //key: ValueKey(successLoad ? url : DateTime.now().toString(),),
//       alignment: alignment,
//       placeholder: kTransparentImage,
//       //"${Global.asseticons}user.png",
//       image: "$url?raw=true",
//       height: double.infinity,
//       width: double.infinity,
//       fit: boxFit,
//       fadeInDuration: const Duration(milliseconds: 500),
//       imageErrorBuilder: (context, _, __) {
//         return placeHolder;
//       },
//       placeholderErrorBuilder: (_, __, stackTrace) {
//         return placeHolder;
//       },
//
//     ),
//   );
// }
//
// Uint8List kTransparentImage = Uint8List.fromList(<int>[
//   0x89,
//   0x50,
//   0x4E,
//   0x47,
//   0x0D,
//   0x0A,
//   0x1A,
//   0x0A,
//   0x00,
//   0x00,
//   0x00,
//   0x0D,
//   0x49,
//   0x48,
//   0x44,
//   0x52,
//   0x00,
//   0x00,
//   0x00,
//   0x01,
//   0x00,
//   0x00,
//   0x00,
//   0x01,
//   0x08,
//   0x06,
//   0x00,
//   0x00,
//   0x00,
//   0x1F,
//   0x15,
//   0xC4,
//   0x89,
//   0x00,
//   0x00,
//   0x00,
//   0x0A,
//   0x49,
//   0x44,
//   0x41,
//   0x54,
//   0x78,
//   0x9C,
//   0x63,
//   0x00,
//   0x01,
//   0x00,
//   0x00,
//   0x05,
//   0x00,
//   0x01,
//   0x0D,
//   0x0A,
//   0x2D,
//   0xB4,
//   0x00,
//   0x00,
//   0x00,
//   0x00,
//   0x49,
//   0x45,
//   0x4E,
//   0x44,
//   0xAE,
// ]);
