import 'package:esler/pages/start_page.dart';
import 'package:flutter/material.dart';

ThemeData _theme = ThemeData(
  fontFamily: 'Lato',
);

void main() {
  runApp(
    MaterialApp(
      home: StartPage(),
      theme: _theme,
    ),
  );
}
