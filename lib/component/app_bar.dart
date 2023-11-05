import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/gap.dart';
import '../util/menu.dart';

class ThemeAppBar {
  static AppBar primary({bool? hideBack, bool premium = false}) => AppBar(
      title: Image.asset("assets/logo-wide.png", height: 48),
      toolbarHeight: 72,
      actions: [
        Padding(
            padding: ThemePadding.p2.copyWith(right: ThemePadding.value * 4, left: ThemePadding.value * 4),
            child: PopupMenuButton(
                padding: EdgeInsets.zero,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    CircleAvatar(backgroundImage: const CachedNetworkImageProvider("https://picsum.photos/64/64"), radius: premium ? 16 : 12),
                    Gap.gx2,
                    Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text("MUSTAKIM", style: TextStyle(color: ThemeColor.secondary, fontWeight: FontWeight.bold, fontSize: 14)),
                      if (premium) Text("PREMIUM", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.bold, fontSize: 10))
                    ]),
                    Gap.gx2,
                    const FaIcon(FontAwesomeIcons.angleDown, size: 16)
                  ]),
                  Gap.gy1,
                  if (!premium) SvgPicture.asset("assets/svg/get_premium.svg", height: 18)
                ]),
                itemBuilder: (BuildContext context) => appMenu))
      ],
      titleSpacing: 0,
      foregroundColor: ThemeColor.primary,
      scrolledUnderElevation: .5,
      leadingWidth: Gap.value * 14,
      automaticallyImplyLeading: hideBack != null ? !hideBack : true);
  static AppBar blank =
      AppBar(surfaceTintColor: Colors.transparent, foregroundColor: ThemeColor.primary, backgroundColor: Colors.transparent, bottomOpacity: 0, elevation: 0, scrolledUnderElevation: 0);
}
