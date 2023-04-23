import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.purple,
  Colors.pink,
  Colors.amber,
  Colors.yellow,
  Colors.black,
  Colors.grey,
  Colors.orange,
  Colors.brown,
  Colors.indigo,
  Colors.red,
  Colors.lime,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor}):
  assert(selectedColor>=0, 'No se permite color 0:Cero'),
  assert(selectedColor<colorsList.length, 'El numero ingresado supera el numero de colores establecido ${colorsList.length}:Cero')
  ;

  ThemeData getThemeData()=> ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorsList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

  
}
