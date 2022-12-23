import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get appTheme {
    return ThemeData().copyWith(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 1,
        centerTitle: true,
      ),
    );
  }
}
