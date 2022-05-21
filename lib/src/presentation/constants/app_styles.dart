import 'package:flutter/material.dart';

class AppStyles {
  static const String _fontFamily = 'NutrinoSans';

  ///Titulo h3 bold
  static TextStyle heading3Bold = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 48,
  );

  ///Titulo h5 bold
  static TextStyle heading5bold = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 26,
  );

  ///Titulo h6 regular
  static TextStyle heading6Medium = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 19,
  );

  ///Titulo h6 bold
  static TextStyle heading6Bold = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 19,
  );

  ///Texto do botões
  static TextStyle buttonText = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 19,
  );

  ///Paragrafo font regular
  static TextStyle paragraph = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  ///Paragrafo bold
  static TextStyle paragraphBold = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

  ///Texto pequeno regular
  static TextStyle small = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  ///Texto pequeno bold
  static TextStyle smallBold = const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );
}
