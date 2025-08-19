import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.primaryBlue,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primaryBlue,
    secondary: AppColors.primaryBlue,
    background: AppColors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.primaryBlue,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: AppColors.textBlack,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      fontFamily: 'Montserrat',
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      minimumSize: Size(double.infinity, 48),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        fontSize: 16,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.primaryBlue, width: 2),
    ),
    hintStyle: TextStyle(
      color: AppColors.textGrey,
      fontSize: 14,
      fontFamily: 'Montserrat',
    ),
    labelStyle: TextStyle(
      color: AppColors.textBlack,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
  ),
);