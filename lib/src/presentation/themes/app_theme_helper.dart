import 'package:flutter/material.dart';

class AppThemeHelper {
  static isDarkMode(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return theme.brightness == Brightness.dark;
  }
}
