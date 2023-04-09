import 'package:flutter/material.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
const gray = Colors.white60;
const borderColor = Color(0xff393959);
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);

final divider = Divider(color: white.withOpacity(0.3), height: 1);

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Notes';
    default:
      return 'Not found page';
  }
}

double getPadding(bool isSmallScreen) {
  if (isSmallScreen) {
    return 20.0;
  }
  return 50.0;
}
