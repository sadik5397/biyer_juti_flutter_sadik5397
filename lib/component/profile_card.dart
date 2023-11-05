import 'package:biyer_juti/component/hyperlink.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/theme/shadow.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'give_heart_button_small.dart';
import 'request_button.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.id, required this.online, required this.premium, required this.hearted, required this.match, this.requestState = RequestState.none});

  final int id;
  final bool online;
  final bool premium;
  final bool hearted;
  final bool match;
  final RequestState requestState;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: ThemePadding.pb5,
        child: Container(
            decoration: BoxDecoration(gradient: online ? ThemeGradient.lite : null, color: online ? null : Colors.white, borderRadius: ThemeBorderRadius.r6 * 1.15, boxShadow: ThemeShadow.primary),
            child: Container(
                margin: ThemePadding.p1,
                padding: ThemePadding.p4,
                decoration: BoxDecoration(color: Colors.white, borderRadius: ThemeBorderRadius.r6),
                width: double.maxFinite,
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    ClipRRect(
                        borderRadius: ThemeBorderRadius.r3,
                        child: Hyperlink(
                          onTap: () => route(context, const Profile()),
                          child: Stack(children: [
                            CachedNetworkImage(imageUrl: "https://picsum.photos/400/410?random=$id", width: 144, height: 160, fit: BoxFit.cover),
                            Positioned.fill(child: Container(decoration: BoxDecoration(gradient: ThemeGradient.semiTransparentBlack))),
                            if (premium) SvgPicture.asset("assets/svg/gold_crown.svg", width: 48, height: 48),
                            Positioned.fill(
                                child: Padding(
                                    padding: ThemePadding.pb4,
                                    child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                      Text("87% Match", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: HexColor("#FC6161"))),
                                      Gap.gy1,
                                      const Text("25 Years | Dhaka", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                                    ])))
                          ]),
                        )),
                    Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text("BJT 205011203", style: TextStyle(color: ThemeColor.secondary, fontWeight: FontWeight.bold, fontSize: 18)),
                      Gap.gy2,
                      GiveHeartButtonSmall(onTap: () {}, hearted: hearted, matched: match),
                      Gap.gy3,
                      Text("Service Holder", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.normal, fontSize: 15)),
                      Gap.gy2,
                      Text("Religion: Islam; Sunni", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.normal, fontSize: 15)),
                      Gap.gy2,
                      Hyperlink(
                          borderRadius: ThemeBorderRadius.r1,
                          onTap: () => route(context, const Profile()),
                          child: Text("View Full Profile", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.normal, fontSize: 15, decoration: TextDecoration.underline)))
                    ])
                  ]),
                  if (requestState != RequestState.none) Padding(padding: ThemePadding.pt4, child: RequestButton(onTap: () {}, state: requestState, mobileNumber: "01515644470"))
                ]))));
  }
}
