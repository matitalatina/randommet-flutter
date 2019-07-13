import 'dart:math';
import 'dart:ui';

import 'package:randommet2/randomizers/color/NamedColor.dart';
import 'package:randommet2/randomizers/color/repo/ColorEn.dart';
import 'package:randommet2/randomizers/color/repo/ColorIt.dart';

class ColorRandomizer {
  static NamedColor getColor(Locale locale) {
    List<Map<String, String>> colors = {
      ...colorEn,
      ...colorIt,
    }[locale.languageCode];
    Map<String, String> color = colors[new Random().nextInt(colors.length)];
    return NamedColor(name: color['name'], color: _convertHex(color['hex']));
  }

  static Color _convertHex(String hex) {
    String r = hex.substring(0, 2);
    String g = hex.substring(2, 4);
    String b = hex.substring(4, 6);
    return new Color.fromRGBO(
        int.parse(r, radix: 16),
        int.parse(g, radix: 16),
        int.parse(b, radix: 16),
        1.0
    );
  }
}