import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: 'Playfair_Display',
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    bodyLarge: TextStyle(height: 2, color: AppColor.black),
    bodyMedium: TextStyle(height: 1.5, color: AppColor.black),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    bodyLarge: TextStyle(height: 2, color: AppColor.black),
    bodyMedium: TextStyle(height: 1.5, color: AppColor.black),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
