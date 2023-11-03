import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/theme/shadow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({super.key, required this.index, required this.onTap});

  final int index;
  final VoidCallback onTap;

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool read = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: read ? Colors.white : ThemeColor.lightRed.withOpacity(.4), borderRadius: ThemeBorderRadius.r6, boxShadow: ThemeShadow.primary),
        margin: ThemePadding.pb4,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: ThemeBorderRadius.r6,
                onTap: () {
                  if (!read) setState(() => read = !read);
                  if (!read) widget.onTap.call();
                },
                child: Padding(
                    padding: ThemePadding.p4,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      ClipRRect(borderRadius: ThemeBorderRadius.r6 * 24, child: CachedNetworkImage(imageUrl: "https://picsum.photos/400/410?random=${widget.index}", width: 60, height: 60, fit: BoxFit.cover)),
                      Gap.gx4,
                      Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Notification Title", style: TextStyle(color: ThemeColor.secondary, fontWeight: FontWeight.bold, fontSize: 16)), Text("DD-MM-YYYY", style: TextStyle(color: ThemeColor.jetBlack.withOpacity(.5), fontSize: 10))]),
                        Gap.gy1,
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur lacinia magna, vitae convallis sem.", style: TextStyle(color: ThemeColor.secondary, fontSize: 12)),
                      ]))
                    ])))));
  }
}
