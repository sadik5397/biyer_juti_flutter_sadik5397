import 'package:biyer_juti/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/gap.dart';

class ThemeAppBar {
  static AppBar primary = AppBar(
    title: Image.asset("assets/logo-wide.png", height: 48),
    actions: [SvgPicture.asset("assets/svg/get_premium.svg", height: 20), Gap.gx4],
    titleSpacing: Gap.value * 2,
    // toolbarHeight: 100,
  );
  static AppBar blank = AppBar(surfaceTintColor: Colors.transparent, backgroundColor: Colors.transparent, foregroundColor: ThemeColor.primary);
}
