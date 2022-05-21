import 'package:flutter/material.dart';
import 'package:scheduling_app/src/presentation/constants/app_colors.dart';
import 'package:scheduling_app/src/presentation/constants/app_radius.dart';

const _style = BorderStyle.solid;
const _width = 1.5;

class AppBorders {
  static BoxBorder get input => Border.all(
        color: AppColors.primary,
        style: _style,
        width: _width,
      );
}

extension BorderInput on BoxBorder {
  InputBorder get borderOutline => OutlineInputBorder(
        borderRadius: AppRadius.medium.borderRadiusAll,
        borderSide: top,
      );

  BoxBorder copyWithAll({
    Color? color,
    BorderStyle? style,
    double? width,
  }) {
    return Border.all(
      color: color ?? top.color,
      style: style ?? top.style,
      width: width ?? top.width,
    );
  }
}
