import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/views/sign_in.dart';
import 'package:biyer_juti/views/welcome.dart';
import 'package:flutter/material.dart';

import '../util/page_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool triggerAnimation = false;

  Future defaultInit() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() => triggerAnimation = true);
    await Future.delayed(const Duration(seconds: 2)); //todo: Write all the pre-initialization functions here
    // ignore: use_build_context_synchronously
    route(context, const Welcome());
  }

  @override
  void initState() {
    defaultInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        body: Center(
            child: Stack(alignment: Alignment.center, children: [
          Image.asset("assets/splash_center_gradient.png"),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.min, children: [
            AnimatedContainer(
                curve: Curves.easeOutQuart,
                duration: const Duration(seconds: 1),
                width: triggerAnimation ? MediaQuery.of(context).size.width * .7 : 0,
                height: triggerAnimation ? MediaQuery.of(context).size.width * .7 : 0,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/biyer_juti_backdrop.jpg"), fit: BoxFit.cover), shape: BoxShape.circle)),
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            Image.asset("assets/logo-wide.png", width: 250),
            Gap.gy4,
            Padding(padding: ThemePadding.px6 * 3, child: LinearProgressIndicator(color: ThemeColor.primary, minHeight: 2)),
          ])
        ])));
  }
}
