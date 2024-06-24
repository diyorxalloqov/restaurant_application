import 'dart:io';

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
  }
}

double he(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight!;
  if (Platform.isAndroid || Platform.isIOS) {
    return (inputHeight / 932.0) * screenHeight;
  } else {
    return (inputHeight / 1024.0) * screenHeight;
  }
}

double wi(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth!;
  if (Platform.isAndroid || Platform.isIOS) {
    return (inputWidth / 430.0) * screenWidth;
  } else {
    return (inputWidth / 1440.0) * screenWidth;
  }
}
