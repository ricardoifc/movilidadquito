import 'package:movilidadquito/modules/ruteador/ui/utils/global.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_colors.dart';
import 'package:movilidadquito/modules/ruteador/ui/utils/global_label.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

Future<void> WidgetRouteNumberFilterDialog(context)  async {
  int selectedNumber = 4; // Valor inicial, puedes cambiarlo si prefieres otro valor predeterminado

  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: GlobalColor.colorwhite,
        title: Text(
          'Filtro de número de rutas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: GlobalColor.colorprimary,
            fontFamily: Global.lettertitle,
            fontSize: 20,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DropdownButton<int>(
              value: selectedNumber,
              onChanged: (int? newValue) {
                if (newValue != null) {
                  selectedNumber = newValue;
                }
              },
              items: List<DropdownMenuItem<int>>.generate(
                7, // Número de elementos en el menú desplegable (10 - 4 + 1)
                    (int index) {
                  return DropdownMenuItem<int>(
                    value: 4 + index,
                    child: Text('${4 + index}'),
                  );
                },
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              GlobalLabel.btnCancel,
              style: TextStyle(
                color: GlobalColor.colorlettertitle,
              ),
            ),
          ),
          TextButton(
            onPressed: () {

              Navigator.of(context).pop();
            },
            child: Text(
              GlobalLabel.btnAccept,
              style: TextStyle(
                color: GlobalColor.colorprimary,
              ),
            ),
          ),
        ],
      );
    },
  );
}
