import 'package:flutter/material.dart';
import 'pallet.dart';

abstract class AppTheme {
  static ThemeData appTeme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.azul1,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.azul4,
      iconTheme: IconThemeData(color: AppColors.azul1),
      titleTextStyle: TextStyle(
        color: AppColors.azul1,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: AppColors.azul4,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: AppColors.azul4, fontSize: 14),
      labelMedium: TextStyle(color: AppColors.azul4, fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.azul1),
        backgroundColor: WidgetStateProperty.fromMap({
          WidgetState.pressed: AppColors.azul4,
          WidgetState.hovered: AppColors.azul2,
          WidgetState.disabled: AppColors.azul5,
          WidgetState.any: AppColors.azul3,
        }),
        elevation: WidgetStatePropertyAll(8.0),
      ),
    ),
    canvasColor: AppColors.azul2,
  );
}