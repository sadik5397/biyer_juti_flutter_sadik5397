import 'package:biyer_juti/component/full_screen_gallery.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../util/global_function.dart';
import '../util/page_navigation.dart';
import 'full_screen_image.dart';

class ProfileCarouselImage extends StatelessWidget {
  const ProfileCarouselImage({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: ThemeBorderRadius.r6,
      child: CarouselSlider.builder(
          options: CarouselOptions(
              height: 300,
              viewportFraction: 0.9999,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              autoPlayCurve: Curves.easeInOutCirc,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal),
          itemCount: images.isEmpty ? 1 : images.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => InkWell(
              onTap: () => route(context, images.isEmpty ? FullScreenImage(imageUrl: DefaultImage.placeholderImage) : FullScreenGallery(imageList: images, pageIndex: itemIndex)),
              child:
                  Hero(tag: images[itemIndex], child: CachedNetworkImage(imageUrl: images.isEmpty ? DefaultImage.placeholderImage : images[itemIndex], width: double.infinity, height: 300, fit: BoxFit.cover)))),
    );
  }
}
