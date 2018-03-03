import 'package:esler/pages/start_page.dart';
import 'package:flutter/material.dart';

ThemeData _theme = new ThemeData(
  fontFamily: 'Lato',
);

void main() {
  runApp(new MaterialApp(
    home: new StartPage(),
    theme: _theme,
  ));
}
