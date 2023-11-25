import 'package:biyer_juti/api/dummy_daya.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/global_function.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
    return Padding(
      padding: ThemePadding.pb4,
      child: Material(
        shadowColor: Colors.black.withOpacity(.35),
        color: read ? Colors.white : HexColor("#cd7b7b"),
        borderRadius: ThemeBorderRadius.r6,
        elevation: 20,
        child: InkWell(
            borderRadius: ThemeBorderRadius.r6,
            onTap: () {
              if (!read) setState(() => read = !read);
              if (!read) widget.onTap.call();
            },
            child: Padding(
                padding: ThemePadding.p4,
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ClipRRect(borderRadius: ThemeBorderRadius.r6 * 24, child: CachedNetworkImage(imageUrl: "https://picsum.photos/400/410?random=${randomNumber(90)}", width: 60, height: 60, fit: BoxFit.cover)),
                  Gap.gx4,
                  Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(DummyData.randomNameList(50)[widget.index], style: TextStyle(color: read ? ThemeColor.secondary : Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("DD-MM-YYYY", style: TextStyle(color: read ? ThemeColor.jetBlack.withOpacity(.5) : Colors.white, fontSize: 10))
                    ]),
                    Gap.gy1,
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consectetur lacinia magna, vitae convallis sem.",
                        style: TextStyle(color: read ? ThemeColor.secondary : Colors.white, fontSize: 12)),
                  ]))
                ]))),
      ),
    );
  }
}
