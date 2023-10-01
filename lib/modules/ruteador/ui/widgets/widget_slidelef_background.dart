//
// import 'package:clipp_maas/modules/ruteador/ui/widgets/widget_text.dart';
// import 'package:flutter/material.dart';
//
// import '../utils/global.dart';
// import '../utils/global_colors.dart';
//
// class SlideLeftBackground extends StatelessWidget {
//   final String text;
//
//   const SlideLeftBackground({Key? key, this.text = "Eliminar"}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.redAccent,
//       child: Align(
//         alignment: Alignment.centerRight,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             Image.asset(
//               "${Global.asseticons}trash.png",
//               fit: BoxFit.fitHeight,
//               height: 24,
//               width: 24,
//               color: GlobalColor.colorprimary,
//             ),
//             const SizedBox(width: 10,),
//             WidgetText.subTitle(
//               text: text,
//               color: GlobalColor.colorlettertitle,
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }