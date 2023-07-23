import 'package:flutter/material.dart';

TextStyle exo2BlackStyle({
  String fontFamily = 'Exo2Black',
}) {
  return TextStyle(
    fontFamily: fontFamily,
  );
}

TextStyle exo2BoldStyle({
  String fontFamily = 'Exo2Bold',
}) {
  return TextStyle(
    fontFamily: fontFamily,
  );
}

TextStyle exo2ExtraBoldStyle({
  String fontFamily = 'Exo2ExtraBold',
}) {
  return TextStyle(
    fontFamily: fontFamily,
  );
}

TextStyle garudaBoldStyle({
  String fontFamily = 'GarudaBold',
}) {
  return TextStyle(
    fontFamily: fontFamily,
  );
}

final List<Shadow> shadows = [
  const Shadow(
    // bottomLeft
    offset: Offset(-2, -2),
  ),
  const Shadow(
    // bottomRight
    offset: Offset(2, -2),
  ),
  const Shadow(
    // topRight
    offset: Offset(2, 2),
  ),
  const Shadow(
    // topLeft
    offset: Offset(-2, 2),
  ),
];
