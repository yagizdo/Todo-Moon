import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.white,
  disabledColor: Colors.white,
  backgroundColor: const Color(0xFF2D2C2C),
  dividerColor: Colors.black12, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.white),
);

final lightTheme = ThemeData(
  primaryColor: Colors.black,
  disabledColor: Colors.grey,
  backgroundColor: const Color(0xFFF9F6E8),
  dividerColor: Colors.white54, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.black),
);