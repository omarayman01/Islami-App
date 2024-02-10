import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color primarylight = const Color(0xffB7935F);
  static Color black = const Color(0xff242424);
  static Color white = Colors.white;

  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
        bodyMedium: GoogleFonts.inter(
            fontSize: 25, fontWeight: FontWeight.w400, color: black),
        headlineMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.w600, color: black)),
    primaryColor: primarylight,
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primarylight,
      selectedItemColor: black,
      unselectedItemColor: white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: black,
      ),
    ),
  );
}
