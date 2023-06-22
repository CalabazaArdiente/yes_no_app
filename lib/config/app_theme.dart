import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'El color debe ser mayor a cero'),
        assert(selectedColor < _colorThemes.length,
            'el color debe ser menor a ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}

const List<Color> _colorThemes = [
  Color.fromARGB(255, 0, 0, 0),
  Color.fromARGB(255, 245, 201, 1),
  Color.fromARGB(255, 152, 246, 0),
  Color.fromARGB(147, 57, 255, 2),
  Color.fromARGB(255, 1, 203, 248),
  Color.fromARGB(255, 1, 94, 105),
  Color.fromARGB(255, 174, 2, 174),
  Color.fromARGB(255, 174, 93, 0),
];
