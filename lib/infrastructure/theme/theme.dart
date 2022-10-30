import 'package:flutter/material.dart';
import 'package:muyufar_game/infrastructure/theme/colors.theme.dart';

ThemeData themeData() {
  return ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(primary: colorPrimary),
    iconTheme: IconThemeData(color: colorPrimary),
    dialogBackgroundColor: Colors.white.withOpacity(0.88),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: colorPrimary),
      ),
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),
  );
}
