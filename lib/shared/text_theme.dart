import 'package:flutter/material.dart';

abstract class MyTextTheme {
  static const TextStyle primaryText = TextStyle(
    fontSize: 16.0,
    fontFamily: 'Roboto',
    color: Color(0xFF292929),
    fontWeight: FontWeight.w800,
  );

  static const TextStyle secondaryText = TextStyle(
      fontSize: 14.0,
      fontFamily: 'Roboto',
      color: Color(0xFF7E7E7E),
      fontWeight: FontWeight.normal);

  static const TextStyle hintText = TextStyle(
    fontSize: 14.0,
    fontFamily: 'Roboto',
    color: Color(0xFF7E7E7E),
    fontWeight: FontWeight.w600,
  );
}
