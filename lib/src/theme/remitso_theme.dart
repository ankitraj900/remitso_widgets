import 'package:flutter/material.dart';

abstract class RemitsoColors {
  static const Color primary = Color(0xFF480052);
  static const Color black = Color(0xFF000000);
  static const Color primaryList = Color(0x1A480052);
  static const Color white = Colors.white;
  static const Color black87 = Color(0xFF292929);
  static const Color grey = Color(0xFF8A8A8A);
  static const Color darkGrey = Color(0xFF434343);
  static const Color green = Color(0xFF09B285);
  static const Color error = Colors.red;
}

abstract class RemitsoTextStyle {
  static TextStyle get displayLarge => const TextStyle(
        fontFamily: 'InterRegular28',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: RemitsoColors.primary,
        decoration: TextDecoration.none,
      );

  static TextStyle get header => const TextStyle(
        fontFamily: 'InterRegular28',
        fontSize: 24,
        letterSpacing: 0.32,
        fontWeight: FontWeight.normal,
        color: RemitsoColors.primary,
        decoration: TextDecoration.none,
      );

  static TextStyle get header2 => const TextStyle(
        fontFamily: 'InterRegular28',
        fontSize: 24,
        letterSpacing: 0.32,
        fontWeight: FontWeight.normal,
        color: RemitsoColors.black,
        decoration: TextDecoration.none,
      );

  static TextStyle get subh1 => const TextStyle(
        fontSize: 16,
        letterSpacing: 0.32,
        fontFamily: 'InterRegular28',
        fontWeight: FontWeight.normal,
        color: RemitsoColors.black,
        decoration: TextDecoration.none,
      );

  static TextStyle get subh2 => const TextStyle(
        fontFamily: 'InterRegular28',
        letterSpacing: 0.32,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: RemitsoColors.black87,
        decoration: TextDecoration.none,
      );

  static TextStyle get inputText => const TextStyle(
        fontFamily: 'InterRegular28',
        letterSpacing: 0.32,
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: RemitsoColors.black87,
        decoration: TextDecoration.none,
      );

  static TextStyle get buttonText => const TextStyle(
        fontFamily: 'InterRegular28',
        letterSpacing: 0.32,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: RemitsoColors.white,
        decoration: TextDecoration.none,
      );

  static TextStyle get caption => const TextStyle(
        fontFamily: 'InterRegular28',
        letterSpacing: 0.32,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: RemitsoColors.primaryList,
        decoration: TextDecoration.none,
      );
} 