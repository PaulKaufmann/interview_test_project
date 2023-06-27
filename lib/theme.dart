import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.rubik().fontFamily,
    primaryColor: const Color.fromRGBO(91, 94, 166, 1),
    secondaryHeaderColor: const Color.fromRGBO(38, 61, 54, 1),
    shadowColor: const Color(0x192B885B),
    dividerColor: const Color(0xFFE1EAE7),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xB2F5F9F7),
      selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(91, 94, 166, 1),
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        height: 1.5,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        height: 1.75,
        color: Color.fromRGBO(139, 140, 140, 1),
      ),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.rubik().fontFamily,
    primaryColor: const Color.fromRGBO(91, 94, 166, 1),
    secondaryHeaderColor: const Color.fromRGBO(46, 178, 132, 1.0),
    shadowColor: const Color(0x66000000),
    dividerColor: const Color(0xFF828885),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xB23A3A3A),
      selectedItemColor: Color.fromRGBO(74, 74, 75, 1.0),
    ),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(91, 94, 166, 1),
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        height: 1.5,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        height: 1.75,
        color: Color.fromRGBO(139, 140, 140, 1),
      ),
    ),
  );
}
