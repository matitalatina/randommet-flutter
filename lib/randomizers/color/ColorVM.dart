import 'dart:math';
import 'dart:ui';

import 'package:rxdart/rxdart.dart';

class NamedColor {
  final String name;
  final Color color;

  NamedColor({this.name, this.color});
}

class ColorState {
  final NamedColor chosen;

  ColorState({this.chosen});
}

class ColorVM {
  static final initialState = ColorState(chosen: _getColor());
  BehaviorSubject<ColorState> _stateSubject = BehaviorSubject.seeded(initialState);
  Observable<ColorState> get state$ => _stateSubject.stream;

  choose() {
    _stateSubject.add(ColorState(chosen: _getColor()));
  }

  static NamedColor _getColor() {
    List<Map<String, String>> colors = [{
      "name": "Lavender",
      "hex": 	"E6E6FA",
    },
    {
      "name": "Thistle",
      "hex": 	"D8BFD8",
    },
    {
      "name": "Plum",
      "hex": 	"DDA0DD",
    },
    {
      "name": "Violet",
      "hex": 	"EE82EE",
    },
    {
      "name": "Orchid",
      "hex": 	"DA70D6",
    },
    {
      "name": "Fuchsia",
      "hex": 	"FF00FF",
    },
    {
      "name": "Magenta",
      "hex": 	"FF00FF",
    },
    {
      "name": "MediumOrchid",
      "hex": 	"BA55D3",
    },
    {
      "name": "MediumPurple",
      "hex": 	"9370DB",
    },
    {
      "name": "BlueViolet",
      "hex": 	"8A2BE2",
    },
    {
      "name": "DarkViolet",
      "hex": 	"9400D3",
    },
    {
      "name": "DarkOrchid",
      "hex": 	"9932CC",
    },
    {
      "name": "DarkMagenta",
      "hex": 	"8B008B",
    },
    {
      "name": "Purple",
      "hex": 	"800080",
    },
    {
      "name": "Indigo",
      "hex": 	"4B0082",
    },
    {
      "name": "DarkSlateBlue",
      "hex": 	"483D8B",
    },
    {
      "name": "SlateBlue",
      "hex": 	"6A5ACD",
    },
    {
      "name": "MediumSlateBlue",
      "hex": 	"7B68EE",
    },
    {
      "name": "Pink",
      "hex": 	"FFC0CB",
    },
    {
      "name": "LightPink",
      "hex": 	"FFB6C1",
    },
    {
      "name": "HotPink",
      "hex": 	"FF69B4",
    },
    {
      "name": "DeepPink",
      "hex": 	"FF1493",
    },
    {
      "name": "PaleVioletRed",
      "hex": 	"DB7093",
    },
    {
      "name": "MediumVioletRed",
      "hex": 	"C71585",
    },
    {
      "name": "LightSalmon",
      "hex": 	"FFA07A",

    },
    {
      "name": "Salmon",
      "hex": 	"FA8072",

    },
    {
      "name": "DarkSalmon",
      "hex": 	"E9967A",

    },
    {
      "name": "LightCoral",
      "hex": 	"F08080",

    },
    {
      "name": "IndianRed",
      "hex": 	"CD5C5C",

    },
    {
      "name": "Crimson",
      "hex": 	"DC143C",

    },
    {
      "name": "FireBrick",
      "hex": 	"B22222",

    },
    {
      "name": "DarkRed",
      "hex": 	"8B0000",

    },
    {
      "name": "Red",
      "hex": 	"FF0000",

    },
    {
      "name": "OrangeRed",
      "hex": 	"FF4500",

    },
    {
      "name": "Tomato",
      "hex": 	"FF6347",

    },
    {
      "name": "Coral",
      "hex": 	"FF7F50",

    },
    {
      "name": "DarkOrange",
      "hex": 	"FF8C00",

    },
    {
      "name": "Orange",
      "hex": 	"FFA500",

    },
    {
      "name": "Yellow",
      "hex": 	"FFFF00",

    },
    {
      "name": "LightYellow",
      "hex": 	"FFFFE0",

    },
    {
      "name": "LemonChiffon",
      "hex": 	"FFFACD",

    },
    {
      "name": "LightGoldenrodYellow",
      "hex": 	"FAFAD2",

    },
    {
      "name": "PapayaWhip",
      "hex": 	"FFEFD5",

    },
    {
      "name": "Moccasin",
      "hex": 	"FFE4B5",

    },
    {
      "name": "PeachPuff",
      "hex": 	"FFDAB9",

    },
    {
      "name": "PaleGoldenrod",
      "hex": 	"EEE8AA",

    },
    {
      "name": "Khaki",
      "hex": 	"F0E68C",

    },
    {
      "name": "DarkKhaki",
      "hex": 	"BDB76B",

    },
    {
      "name": "Gold",
      "hex": 	"FFD700",

    },
    {
      "name": "Cornsilk",
      "hex": 	"FFF8DC",

    },
    {
      "name": "BlanchedAlmond",
      "hex": 	"FFEBCD",

    },
    {
      "name": "Bisque",
      "hex": 	"FFE4C4",

    },
    {
      "name": "NavajoWhite",
      "hex": 	"FFDEAD",

    },
    {
      "name": "Wheat",
      "hex": 	"F5DEB3",

    },
    {
      "name": "BurlyWood",
      "hex": 	"DEB887",

    },
    {
      "name": "Tan",
      "hex": 	"D2B48C",

    },
    {
      "name": "RosyBrown",
      "hex": 	"BC8F8F",

    },
    {
      "name": "SandyBrown",
      "hex": 	"F4A460",

    },
    {
      "name": "Goldenrod",
      "hex": 	"DAA520",

    },
    {
      "name": "DarkGoldenrod",
      "hex": 	"B8860B",

    },
    {
      "name": "Peru",
      "hex": 	"CD853F",

    },
    {
      "name": "Chocolate",
      "hex": 	"D2691E",

    },
    {
      "name": "SaddleBrown",
      "hex": 	"8B4513",

    },
    {
      "name": "Sienna",
      "hex": 	"A0522D",

    },
    {
      "name": "Brown",
      "hex": 	"A52A2A",

    },
    {
      "name": "Maroon",
      "hex": 	"800000",

    },
    {
      "name": "DarkOliveGreen",
      "hex": 	"556B2F",

    },
    {
      "name": "Olive",
      "hex": 	"808000",

    },
    {
      "name": "OliveDrab",
      "hex": 	"6B8E23",

    },
    {
      "name": "YellowGreen",
      "hex": 	"9ACD32",

    },
    {
      "name": "LimeGreen",
      "hex": 	"32CD32",

    },
    {
      "name": "Lime",
      "hex": 	"00FF00",

    },
    {
      "name": "LawnGreen",
      "hex": 	"7CFC00",

    },
    {
      "name": "Chartreuse",
      "hex": 	"7FFF00",

    },
    {
      "name": "GreenYellow",
      "hex": 	"ADFF2F",

    },
    {
      "name": "SpringGreen",
      "hex": 	"00FF7F",

    },
    {
      "name": "MediumSpringGreen",
      "hex": 	"00FA9A",

    },
    {
      "name": "LightGreen",
      "hex": 	"90EE90",

    },
    {
      "name": "PaleGreen",
      "hex": 	"98FB98",

    },
    {
      "name": "DarkSeaGreen",
      "hex": 	"8FBC8F",

    },
    {
      "name": "MediumSeaGreen",
      "hex": 	"3CB371",

    },
    {
      "name": "SeaGreen",
      "hex": 	"2E8B57",

    },
    {
      "name": "ForestGreen",
      "hex": 	"228B22",

    },
    {
      "name": "Green",
      "hex": 	"008000",

    },
    {
      "name": "DarkGreen",
      "hex": 	"006400",

    },
    {
      "name": "MediumAquamarine",
      "hex": 	"66CDAA",

    },
    {
      "name": "Aqua",
      "hex": 	"00FFFF",

    },
    {
      "name": "Cyan",
      "hex": 	"00FFFF",

    },
    {
      "name": "LightCyan",
      "hex": 	"E0FFFF",

    },
    {
      "name": "PaleTurquoise",
      "hex": 	"AFEEEE",

    },
    {
      "name": "Aquamarine",
      "hex": 	"7FFFD4",

    },
    {
      "name": "Turquoise",
      "hex": 	"40E0D0",

    },
    {
      "name": "MediumTurquoise",
      "hex": 	"48D1CC",

    },
    {
      "name": "DarkTurquoise",
      "hex": 	"00CED1",

    },
    {
      "name": "LightSeaGreen",
      "hex": 	"20B2AA",

    },
    {
      "name": "CadetBlue",
      "hex": 	"5F9EA0",

    },
    {
      "name": "DarkCyan",
      "hex": 	"008B8B",

    },
    {
      "name": "Teal",
      "hex": 	"008080",

    },
    {
      "name": "LightSteelBlue",
      "hex": 	"B0C4DE",

    },
    {
      "name": "PowderBlue",
      "hex": 	"B0E0E6",

    },
    {
      "name": "LightBlue",
      "hex": 	"ADD8E6",

    },
    {
      "name": "SkyBlue",
      "hex": 	"87CEEB",

    },
    {
      "name": "LightSkyBlue",
      "hex": 	"87CEFA",

    },
    {
      "name": "DeepSkyBlue",
      "hex": 	"00BFFF",

    },
    {
      "name": "DodgerBlue",
      "hex": 	"1E90FF",

    },
    {
      "name": "CornflowerBlue",
      "hex": 	"6495ED",

    },
    {
      "name": "SteelBlue",
      "hex": 	"4682B4",

    },
    {
      "name": "RoyalBlue",
      "hex": 	"4169E1",

    },
    {
      "name": "Blue",
      "hex": 	"0000FF",

    },
    {
      "name": "MediumBlue",
      "hex": 	"0000CD",

    },
    {
      "name": "DarkBlue",
      "hex": 	"00008B",

    },
    {
      "name": "Navy",
      "hex": 	"000080",

    },
    {
      "name": "MidnightBlue",
      "hex": 	"191970",

    },
    {
      "name": "White",
      "hex": 	"FFFFFF",

    },
    {
      "name": "Snow",
      "hex": 	"FFFAFA",

    },
    {
      "name": "Honeydew",
      "hex": 	"F0FFF0",

    },
    {
      "name": "MintCream",
      "hex": 	"F5FFFA",

    },
    {
      "name": "Azure",
      "hex": 	"F0FFFF",

    },
    {
      "name": "AliceBlue",
      "hex": 	"F0F8FF",

    },
    {
      "name": "GhostWhite",
      "hex": 	"F8F8FF",

    },
    {
      "name": "WhiteSmoke",
      "hex": 	"F5F5F5",

    },
    {
      "name": "Seashell",
      "hex": 	"FFF5EE",

    },
    {
      "name": "Beige",
      "hex": 	"F5F5DC",

    },
    {
      "name": "OldLace",
      "hex": 	"FDF5E6",

    },
    {
      "name": "FloralWhite",
      "hex": 	"FFFAF0",

    },
    {
      "name": "Ivory",
      "hex": 	"FFFFF0",

    },
    {
      "name": "AntiqueWhite",
      "hex": 	"FAEBD7",

    },
    {
      "name": "Linen",
      "hex": 	"FAF0E6",

    },
    {
      "name": "LavenderBlush",
      "hex": 	"FFF0F5",

    },
    {
      "name": "MistyRose",
      "hex": 	"FFE4E1",

    },
    {
      "name": "Gainsboro",
      "hex": 	"DCDCDC",

    },
    {
      "name": "LightGray",
      "hex": 	"D3D3D3",

    },
    {
      "name": "Silver",
      "hex": 	"C0C0C0",

    },
    {
      "name": "DarkGray",
      "hex": 	"A9A9A9",

    },
    {
      "name": "Gray",
      "hex": 	"808080",

    },
    {
      "name": "DimGray",
      "hex": 	"696969",

    },
    {
      "name": "LightSlateGray",
      "hex": 	"778899",

    },
    {
      "name": "SlateGray",
      "hex": 	"708090",

    },
    {
      "name": "DarkSlateGray",
      "hex": 	"2F4F4F",

    },
    {
      "name": "Black",
      "hex": 	"000000",

    }];
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