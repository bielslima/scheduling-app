import 'package:flutter/material.dart';

class AppColors {
  ///Cor primária para componentes que não envolvam ações (clicks)
  static Color primary = const Color(0xFFAB47BC);

  ///Cor primária para componentes com ações
  static Color action = const Color(0xFFFE7C6E);

  ///Cor primária para contraste com o [background] sem cor
  static const Color primaryGrey = Color.fromARGB(255, 197, 90, 216);

  ///Cor secundária para contraste com [primaryGrey] sem cor
  static const Color secondaryGray = Color(0xFFd0d0d0);

  static const Color borderGray = Color(0xFFE6E6E6);

  ///Cor de indicação (hintText)
  static const Color hintGray = Color(0xFF97A1A8);

  static const Color placeholder = Color(0xFF97A1A8);

  static const Color hintActive = Color(0xFF59666F);

  ///Cor de erro
  static Color error = HexColor.fromHex('#E30F0F');

  ///Cor de erro
  static Color errorGray = HexColor.fromHex('#FCCACA');

  ///cor de warning
  static Color warning = Color(0xffF9B300);

  ///Cor de sucesso
  static Color success = HexColor.fromHex('#73C521');

  ///Cor do fundo (scaffoldBack)
  static Color background = HexColor.fromHex('#F2F2F2');

  ///Branco padrão
  static const Color primaryWhite = Color(0xFFFFFFFF);

  ///Cor para funções indisponíveis (disabled)
  static const Color disabled = Color(0xFFE6E6E6);

  ///Cor de contraste para o [primary]
  ///
  ///Cor para textos dentro de componentes preenchidos com o [primary]
  static const Color contrast = Color(0xFFFFFFFF);

  ///Cor Neutra
  static Color neutral = HexColor.fromHex('#000000');

  static const Color colorText = Color(0xff59666F);

  static const Color colorBorder = Color(0xffF5F5F5);
  static const Color brandSecondary = Color(0xffF4C8E1);
  static const Color brandFifth = Color(0xffB6EEDD);
  static const Color brandFourth = Color(0xffC3E7F3);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  String get colorToHexString {
    return '#FF${value.toRadixString(16).substring(2, 8)}';
  }

  Color get a10 => withOpacity(0.1);
  Color get a20 => withOpacity(0.20);
  Color get a30 => withOpacity(0.30);
  Color get a50 => withOpacity(0.50);
  Color get a60 => withOpacity(0.60);
  Color get a75 => withOpacity(0.75);
  Color get a80 => withOpacity(0.80);
  Color get a90 => withOpacity(0.90);
}
