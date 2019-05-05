import 'dart:math';
import 'dart:ui';

import 'package:randommet2/randomizers/color/NamedColor.dart';

class ColorRandomizer {
  static NamedColor getColor() {
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
      "name": "Medium Orchid",
      "hex": 	"BA55D3",
    },
    {
      "name": "Medium Purple",
      "hex": 	"9370DB",
    },
    {
      "name": "Blue Violet",
      "hex": 	"8A2BE2",
    },
    {
      "name": "Dark Violet",
      "hex": 	"9400D3",
    },
    {
      "name": "Dark Orchid",
      "hex": 	"9932CC",
    },
    {
      "name": "Dark Magenta",
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
      "name": "Dark Slate Blue",
      "hex": 	"483D8B",
    },
    {
      "name": "Slate Blue",
      "hex": 	"6A5ACD",
    },
    {
      "name": "Medium Slate Blue",
      "hex": 	"7B68EE",
    },
    {
      "name": "Pink",
      "hex": 	"FFC0CB",
    },
    {
      "name": "Light Pink",
      "hex": 	"FFB6C1",
    },
    {
      "name": "Hot Pink",
      "hex": 	"FF69B4",
    },
    {
      "name": "Deep Pink",
      "hex": 	"FF1493",
    },
    {
      "name": "Pale Violet Red",
      "hex": 	"DB7093",
    },
    {
      "name": "Medium Violet Red",
      "hex": 	"C71585",
    },
    {
      "name": "Light Salmon",
      "hex": 	"FFA07A",

    },
    {
      "name": "Salmon",
      "hex": 	"FA8072",

    },
    {
      "name": "Dark Salmon",
      "hex": 	"E9967A",

    },
    {
      "name": "Light Coral",
      "hex": 	"F08080",

    },
    {
      "name": "Indian Red",
      "hex": 	"CD5C5C",

    },
    {
      "name": "Crimson",
      "hex": 	"DC143C",

    },
    {
      "name": "Fire Brick",
      "hex": 	"B22222",

    },
    {
      "name": "Dark Red",
      "hex": 	"8B0000",

    },
    {
      "name": "Red",
      "hex": 	"FF0000",

    },
    {
      "name": "Orange Red",
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
      "name": "Dark Orange",
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
      "name": "Light Yellow",
      "hex": 	"FFFFE0",

    },
    {
      "name": "Lemon Chiffon",
      "hex": 	"FFFACD",

    },
    {
      "name": "Light Goldenrod Yellow",
      "hex": 	"FAFAD2",

    },
    {
      "name": "Papaya Whip",
      "hex": 	"FFEFD5",

    },
    {
      "name": "Moccasin",
      "hex": 	"FFE4B5",

    },
    {
      "name": "Peach Puff",
      "hex": 	"FFDAB9",

    },
    {
      "name": "Pale Goldenrod",
      "hex": 	"EEE8AA",

    },
    {
      "name": "Khaki",
      "hex": 	"F0E68C",

    },
    {
      "name": "Dark Khaki",
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
      "name": "Blanched Almond",
      "hex": 	"FFEBCD",

    },
    {
      "name": "Bisque",
      "hex": 	"FFE4C4",

    },
    {
      "name": "Navajo White",
      "hex": 	"FFDEAD",

    },
    {
      "name": "Wheat",
      "hex": 	"F5DEB3",

    },
    {
      "name": "Burly Wood",
      "hex": 	"DEB887",

    },
    {
      "name": "Tan",
      "hex": 	"D2B48C",

    },
    {
      "name": "Rosy Brown",
      "hex": 	"BC8F8F",

    },
    {
      "name": "Sandy Brown",
      "hex": 	"F4A460",

    },
    {
      "name": "Goldenrod",
      "hex": 	"DAA520",

    },
    {
      "name": "Dark Goldenrod",
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
      "name": "Saddle Brown",
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
      "name": "Dark Olive Green",
      "hex": 	"556B2F",

    },
    {
      "name": "Olive",
      "hex": 	"808000",

    },
    {
      "name": "Olive Drab",
      "hex": 	"6B8E23",

    },
    {
      "name": "Yellow Green",
      "hex": 	"9ACD32",

    },
    {
      "name": "Lime Green",
      "hex": 	"32CD32",

    },
    {
      "name": "Lime",
      "hex": 	"00FF00",

    },
    {
      "name": "Lawn Green",
      "hex": 	"7CFC00",

    },
    {
      "name": "Chartreuse",
      "hex": 	"7FFF00",

    },
    {
      "name": "Green Yellow",
      "hex": 	"ADFF2F",

    },
    {
      "name": "Spring Green",
      "hex": 	"00FF7F",

    },
    {
      "name": "Medium Spring Green",
      "hex": 	"00FA9A",

    },
    {
      "name": "Light Green",
      "hex": 	"90EE90",

    },
    {
      "name": "Pale Green",
      "hex": 	"98FB98",

    },
    {
      "name": "Dark Sea Green",
      "hex": 	"8FBC8F",

    },
    {
      "name": "Medium Sea Green",
      "hex": 	"3CB371",

    },
    {
      "name": "Sea Green",
      "hex": 	"2E8B57",

    },
    {
      "name": "Forest Green",
      "hex": 	"228B22",

    },
    {
      "name": "Green",
      "hex": 	"008000",

    },
    {
      "name": "Dark Green",
      "hex": 	"006400",

    },
    {
      "name": "Medium Aquamarine",
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
      "name": "Light Cyan",
      "hex": 	"E0FFFF",

    },
    {
      "name": "Pale Turquoise",
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
      "name": "Medium Turquoise",
      "hex": 	"48D1CC",

    },
    {
      "name": "Dark Turquoise",
      "hex": 	"00CED1",

    },
    {
      "name": "Light Sea Green",
      "hex": 	"20B2AA",

    },
    {
      "name": "Cadet Blue",
      "hex": 	"5F9EA0",

    },
    {
      "name": "Dark Cyan",
      "hex": 	"008B8B",

    },
    {
      "name": "Teal",
      "hex": 	"008080",

    },
    {
      "name": "Light Steel Blue",
      "hex": 	"B0C4DE",

    },
    {
      "name": "Powder Blue",
      "hex": 	"B0E0E6",

    },
    {
      "name": "Light Blue",
      "hex": 	"ADD8E6",

    },
    {
      "name": "Sky Blue",
      "hex": 	"87CEEB",

    },
    {
      "name": "Light Sky Blue",
      "hex": 	"87CEFA",

    },
    {
      "name": "Deep Sky Blue",
      "hex": 	"00BFFF",

    },
    {
      "name": "Dodger Blue",
      "hex": 	"1E90FF",

    },
    {
      "name": "Cornflower Blue",
      "hex": 	"6495ED",

    },
    {
      "name": "Steel Blue",
      "hex": 	"4682B4",

    },
    {
      "name": "Royal Blue",
      "hex": 	"4169E1",

    },
    {
      "name": "Blue",
      "hex": 	"0000FF",

    },
    {
      "name": "Medium Blue",
      "hex": 	"0000CD",

    },
    {
      "name": "Dark Blue",
      "hex": 	"00008B",

    },
    {
      "name": "Navy",
      "hex": 	"000080",

    },
    {
      "name": "Midnight Blue",
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
      "name": "Mint Cream",
      "hex": 	"F5FFFA",

    },
    {
      "name": "Azure",
      "hex": 	"F0FFFF",

    },
    {
      "name": "Alice Blue",
      "hex": 	"F0F8FF",

    },
    {
      "name": "Ghost White",
      "hex": 	"F8F8FF",

    },
    {
      "name": "White Smoke",
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
      "name": "Old Lace",
      "hex": 	"FDF5E6",

    },
    {
      "name": "Floral White",
      "hex": 	"FFFAF0",

    },
    {
      "name": "Ivory",
      "hex": 	"FFFFF0",

    },
    {
      "name": "Antique White",
      "hex": 	"FAEBD7",

    },
    {
      "name": "Linen",
      "hex": 	"FAF0E6",

    },
    {
      "name": "Lavender Blush",
      "hex": 	"FFF0F5",

    },
    {
      "name": "Misty Rose",
      "hex": 	"FFE4E1",

    },
    {
      "name": "Gainsboro",
      "hex": 	"DCDCDC",

    },
    {
      "name": "Light Gray",
      "hex": 	"D3D3D3",

    },
    {
      "name": "Silver",
      "hex": 	"C0C0C0",

    },
    {
      "name": "Dark Gray",
      "hex": 	"A9A9A9",

    },
    {
      "name": "Gray",
      "hex": 	"808080",

    },
    {
      "name": "Dim Gray",
      "hex": 	"696969",

    },
    {
      "name": "Light Slate Gray",
      "hex": 	"778899",

    },
    {
      "name": "Slate Gray",
      "hex": 	"708090",

    },
    {
      "name": "Dark Slate Gray",
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