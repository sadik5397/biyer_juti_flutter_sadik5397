import 'package:biyer_juti/component/pagination.dart';
import 'package:biyer_juti/component/profile_card.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/theme/shadow.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 8), children: [
          search(),
          ...List.generate(40, (index) => ProfileCard(index: index, online: index % 3 == 0, premium: index % 4 == 0, hearted: index % 2 == 0, match: index % 5 == 0)),
          const Pagination(),
        ]));
  }
}

Container search() {
  return Container(
    padding: ThemePadding.p4,
    margin: ThemePadding.pb5,
    decoration: BoxDecoration(gradient: ThemeGradient.primary, borderRadius: ThemeBorderRadius.r6, boxShadow: ThemeShadow.primary),
    width: double.maxFinite,
    child: Column(
      children: [
        const Text("Find Your Life Partner", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Padding(padding: ThemePadding.p4, child: const Text("Select Preferred Age", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))),
        Slider(value: 0, onChanged: (value) {}, activeColor: Colors.white),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: const StadiumBorder(), elevation: 0),
            onPressed: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Select Religion", style: TextStyle(color: ThemeColor.secondary, fontSize: 14)),
              Icon(Icons.arrow_drop_down_rounded, size: 20, color: ThemeColor.secondary),
            ])),
      ],
    ),
  );
}
