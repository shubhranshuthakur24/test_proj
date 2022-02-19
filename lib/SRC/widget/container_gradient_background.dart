import 'package:caregiver_app/SRC/style/colors.dart';
import 'package:flutter/material.dart';

BoxDecoration ContainerGradientBackground() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradientBlue, gradientRed]));
}
