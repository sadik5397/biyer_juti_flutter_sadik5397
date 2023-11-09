import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:flutter/material.dart';

class PopUpDialogues {
  static AlertDialog proceedToPayment({required BuildContext context, required VoidCallback onSubmit}) {
    return AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(child: SectionHeader(label: "Upgrade to Premium", topGap: false)),
        buttonPadding: EdgeInsets.zero,
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("By upgrading your profile to premium version, you can access unlimited hearts, contact numbers and other exciting features.",
              style: TextStyle(color: ThemeColor.navyBlue, fontWeight: FontWeight.bold, fontSize: 14)),
          Gap.gy4,
          CheckboxListTile(
              value: false,
              onChanged: (value) {},
              visualDensity: VisualDensity.compact,
              controlAffinity: ListTileControlAffinity.leading,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              title: Text("I understand and agree with the Terms & Conditions, Privacy Policy & Refund Policy.", style: TextStyle(fontSize: 12, color: ThemeColor.jetBlack.withOpacity(.8))))
        ]),
        actions: [ThemeButton.pill(title: "Proceed to payment", onTap: onSubmit, dark: true)]);
  }
}
