import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeColor {
  static Color primary = HexColor("#B74242");
  static Color secondary = HexColor("#661010");
  static Color jetBlack = HexColor("#243757");
  static Color lightPink = HexColor("#B91A1A");
  static Color lightRed = HexColor("#DBA2A2");
  static Color backgroundLight = HexColor("#DBA2A2");
  static Color backgroundDark = HexColor("#303030");
  static Color lightRedBackground = HexColor("#fff2f2");
  static Color lightPinkBackground = HexColor("#F6E8E8");
  static Color yellow = HexColor("#FFDB21");
  static Color navyBlue = HexColor("#243757");
}

class ThemeGradient {
  static LinearGradient primary = LinearGradient(colors: [HexColor("#EF5656"), HexColor("#FC333F")], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static LinearGradient secondary = LinearGradient(colors: [HexColor("#A62929"), HexColor("#FE1010")], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static LinearGradient red = LinearGradient(colors: [HexColor("#D96565"), HexColor("#B91A1A")], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static LinearGradient pink = LinearGradient(colors: [HexColor("#D4488B"), HexColor("#FF2876")], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static LinearGradient lite = LinearGradient(colors: [HexColor("#D8D3D3"), HexColor("#EE6C6C")], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static LinearGradient advancedSearch = LinearGradient(colors: [HexColor("#dd6161"), HexColor("#ea8686")], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static LinearGradient gold = LinearGradient(colors: [HexColor("#FFFFFF"), HexColor("#e0dbc0"), HexColor("#C7BE8E")], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static LinearGradient semiTransparentBlack = LinearGradient(colors: [Colors.transparent, HexColor("#181717").withOpacity(.7)], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static LinearGradient semiTransparentWhite =
      LinearGradient(colors: [HexColor("#ffffff").withOpacity(0), HexColor("#ffffff").withOpacity(1)], begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [0.2, .8]);
}
