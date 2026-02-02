import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: Color(0xFF333333)),
  scaffoldBackgroundColor: Color(0xFF282828),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Color(0xb0fffff0),
      fontWeight: FontWeight.w800,
      fontSize: 24.0,
    ),
    labelMedium: TextStyle(
      color: Color(0x70f5f5f5),
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
    ),
    bodyLarge: TextStyle(
      color: Color(0xf0fffff0),
      fontWeight: FontWeight.w800,
      fontSize: 24.0,
    ),
    labelSmall: TextStyle(
      color: Color(0xb095958d),
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
    ),
    headlineMedium: TextStyle(
      color: Color(0xb095958d),
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
    ),
  ),
);
