import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/theme/shadow.dart';
import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import 'pop_up_dialogue.dart';
import 'hyperlink.dart';

class PaymentGatewayButtonCard extends StatelessWidget {
  const PaymentGatewayButtonCard({super.key, required this.image, required this.onTap});

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Hyperlink(
            onTap: () => showDialog(context: context, builder: (BuildContext context) => PopUpDialogues.proceedToPayment(context: context, onSubmit: onTap)),
            child: Container(
                padding: ThemePadding.p6,
                decoration: BoxDecoration(color: Colors.white, borderRadius: ThemeBorderRadius.r4, boxShadow: ThemeShadow.primary),
                height: 180,
                child: Image.asset(image, fit: BoxFit.fitWidth))));
  }
}

class PaymentGatewayButton {
  static PaymentGatewayButtonCard bKash({required VoidCallback onTap}) => PaymentGatewayButtonCard(image: "assets/bkash.png", onTap: onTap);

  static PaymentGatewayButtonCard sslCommerz({required VoidCallback onTap}) => PaymentGatewayButtonCard(image: "assets/sslcommerz.png", onTap: onTap);
}
