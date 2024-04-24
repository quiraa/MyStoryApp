import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryAppTheme {
  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
      ),
      textTheme: GoogleFonts.workSansTextTheme(),
    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0,
      ),
      textTheme: GoogleFonts.workSansTextTheme().apply(
        bodyColor: Colors.white,
      ),
    );
  }
}
