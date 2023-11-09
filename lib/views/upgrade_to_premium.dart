import 'package:biyer_juti/component/payment_gateway_button.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';
import '../component/app_bar.dart';
import '../component/video_card.dart';

class UpgradeToPremium extends StatefulWidget {
  const UpgradeToPremium({super.key});

  @override
  State<UpgradeToPremium> createState() => _UpgradeToPremiumState();
}

class _UpgradeToPremiumState extends State<UpgradeToPremium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.px4, children: [
          const SectionHeader(label: "Upgrade To Premium"),
          const Text("Upgrade to premium profile costs Tk. 1000\n(One Thousand Taka Only)", textAlign: TextAlign.center),
          Gap.gy6,
          Row(children: [PaymentGatewayButton.bKash(onTap: () {}), Gap.gx4, PaymentGatewayButton.sslCommerz(onTap: () {})]),
          Gap.gy6,
          Gap.gy6,
          const Text("All available payment options", textAlign: TextAlign.center),
          Gap.gy3,
          Image.asset("assets/sslcommerz_paywith.png", fit: BoxFit.fitWidth),
          Gap.gy6,
          Gap.gy6,
          const Text("Learn More About Biyer Juti", textAlign: TextAlign.center),
          Gap.gy3,
          SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: List.generate(5, (index) => VideoCard(onTap: () {}, image: "https://picsum.photos/720/480?random=$index")))),
          Gap.gy6,
          Gap.gy6
        ]));
  }
}
