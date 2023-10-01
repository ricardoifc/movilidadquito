// import 'package:flutter/material.dart';
//
// void widgetBottomSheet(context,
//     {required Widget widget,
//       ValueGetter? hide,
//       bool dismissible = true,
//       bool transparent = false}) {
//   showModalBottomSheet(
//       context: context,
//       barrierColor: transparent ? Colors.black.withAlpha(1) : null,
//       isDismissible: dismissible,
//       isScrollControlled: true,
//       enableDrag: dismissible,
//       builder: (BuildContext context) {
//         return SingleChildScrollView(
//           child: WillPopScope(
//             onWillPop: () => Future(() => dismissible),
//             child: Container(
//               padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ),
//               child: widget,
//             ),
//           ),
//         );
//       }).then((value) {
//     if (hide != null) {
//       hide();
//     }
//   });
// }