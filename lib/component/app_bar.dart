import 'package:biyer_juti/component/hyperlink.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/upgrade_to_premium.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/gap.dart';
import '../util/menu.dart';

class ThemeAppBar {
  static AppBar primary({bool? hideBack, bool premium = false}) {
    String imageUrl = "https://picsum.photos/64/64";
    return AppBar(
        title: Image.asset("assets/logo-wide.png", height: 48),
        toolbarHeight: 72,
        actions: [
          Padding(
              padding: ThemePadding.p2.copyWith(right: ThemePadding.value * 4, left: ThemePadding.value * 4),
              child: PopupMenuButton(
                  padding: EdgeInsets.zero,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Hero(tag: imageUrl, child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(imageUrl), radius: premium ? 16 : 12)),
                      Gap.gx2,
                      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text("MUSTAKIM", style: TextStyle(color: ThemeColor.secondary, fontWeight: FontWeight.bold, fontSize: 14)),
                        if (premium) Text("PREMIUM", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.bold, fontSize: 10))
                      ]),
                      Gap.gx2,
                      const Icon(FeatherIcons.chevronDown, size: 16)
                    ]),
                    Gap.gy1,
                    if (!premium) Hyperlink(onTap: () => globalRoute(const UpgradeToPremium()), child: SvgPicture.asset("assets/svg/get_premium.svg", height: 18))
                  ]),
                  itemBuilder: (BuildContext context) => appMenu(context)))
        ],
        titleSpacing: 0,
        foregroundColor: ThemeColor.primary,
        scrolledUnderElevation: .5,
        leadingWidth: Gap.value * 14,
        automaticallyImplyLeading: hideBack != null ? !hideBack : true);
  }

  static AppBar blank({Widget? action}) => AppBar(
      surfaceTintColor: Colors.transparent,
      foregroundColor: ThemeColor.primary,
      backgroundColor: Colors.transparent,
      bottomOpacity: 0,
      elevation: 0,
      actions: action == null ? null : [action],
      scrolledUnderElevation: 0);
}
