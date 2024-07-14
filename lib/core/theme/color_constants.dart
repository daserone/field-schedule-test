import 'package:flutter/material.dart';

class AppColors {
  static Color primary = fromHex('#82BC00');
  static Color black = fromHex('#3D3D3D');
  static Color darkBlue = fromHex('#00003f');
  static Color white = fromHex('#FBFBFB');
  static Color blue = fromHex('#346BC3');
  static Color gray = fromHex('#9B9C9D');
  static Color red = fromHex('#FF0000');
  static Color labelText = fromHex('#9B9C9D');
  static Color lightScaffoldBackgroundColor = fromHex('#FFFFFF');
  static Color secondaryBackgroundColor = fromHex('#F4F7FC');
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
