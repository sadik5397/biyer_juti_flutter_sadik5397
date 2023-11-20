import 'package:biyer_juti/component/full_screen_image.dart';
import 'package:flutter/material.dart';

class FullScreenGallery extends StatefulWidget {
  const FullScreenGallery({Key? key, required this.imageList, required this.pageIndex}) : super(key: key);
  final List<String> imageList;
  final int pageIndex;

  @override
  State<FullScreenGallery> createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<FullScreenGallery> {
  late PageController controller = PageController(initialPage: widget.pageIndex, viewportFraction: 0.8, keepPage: false);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.imageList[widget.pageIndex],
      child: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: List.generate(widget.imageList.length, (index) => FullScreenImage(imageUrl: widget.imageList[index])),
      ),
    );
  }
}
