import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/border_radius.dart';
import '../theme/padding.dart';
import '../theme/shadow.dart';
import 'hyperlink.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.image, required this.onTap});

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: ThemePadding.px2,
        child: Hyperlink(
            onTap: () {},
            child: Container(
                alignment: Alignment.center,
                width: 300,
                height: 300 / (16 / 9),
                decoration: BoxDecoration(boxShadow: ThemeShadow.primary, borderRadius: ThemeBorderRadius.r4, image: DecorationImage(image: CachedNetworkImageProvider(image), fit: BoxFit.fitWidth)),
                child: SvgPicture.asset("assets/svg/play.svg", width: 64, height: 64))));
  }
}
