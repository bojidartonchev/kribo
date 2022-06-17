import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KriboTheme {
  static const Color background = Colors.black;
  static const Color title = Colors.white;

  static ThemeData theme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      iconTheme: const IconThemeData(color: title),
      textTheme: GoogleFonts.nunitoTextTheme()
          .apply(bodyColor: title, displayColor: title)
          .copyWith(
              subtitle1: const TextStyle(color: title)),
      );
}
