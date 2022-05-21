import 'package:flutter/material.dart';

class AppRadius {
  static const double small = 4;
  static const double medium = 8;
  static const double large = 16;
}

extension AppRadiusAll on double {
  Radius get radiusCircular => Radius.circular(this);
  BorderRadius get borderRadiusAll => BorderRadius.all(
        radiusCircular,
      );
  BorderRadius get borderRadiusTop => BorderRadius.vertical(
        top: radiusCircular,
      );
  BorderRadius get borderRadiusBottom => BorderRadius.vertical(
        bottom: radiusCircular,
      );
  BorderRadius get borderRadiusLeft => BorderRadius.horizontal(
        left: radiusCircular,
      );
  BorderRadius get borderRadiusRight => BorderRadius.horizontal(
        right: radiusCircular,
      );
}
