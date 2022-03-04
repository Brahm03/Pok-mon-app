import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.pink[700]
  );
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.pink[700]
  );
}
