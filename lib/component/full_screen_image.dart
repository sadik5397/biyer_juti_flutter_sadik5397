import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Opacity(opacity: .15, child: CachedNetworkImage(imageUrl: imageUrl, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover)),
      Padding(
        padding: ThemePadding.p4,
        child: ClipRRect(
            borderRadius: ThemeBorderRadius.r4, child: CachedNetworkImage(imageUrl: imageUrl, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.contain)),
      )
    ]);
  }
}
