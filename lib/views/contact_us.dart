import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/home.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../component/app_bar.dart';
import '../component/button.dart';
import '../component/text_field.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4 * 2, children: [
          const SectionHeader(label: "Contact Us", topGap: false),
          const Text("Please let us know how we can help", textAlign: TextAlign.center),
          Gap.gy6,
          ThemeTextField.primary(labelText: "Name", controller: TextEditingController(), required: true, keyboardType: TextInputType.name, autofillHints: AutofillHints.name, autoFocus: true),
          ThemeTextField.primary(labelText: "Phone Number", controller: TextEditingController(), keyboardType: TextInputType.phone, autofillHints: AutofillHints.telephoneNumber),
          ThemeTextField.primary(labelText: "Email", controller: TextEditingController(), keyboardType: TextInputType.emailAddress, autofillHints: AutofillHints.email),
          ThemeTextField.primary(labelText: "Message", controller: TextEditingController(), keyboardType: TextInputType.text, maxLines: 8),
          Gap.gy6,
          const Text("NB: You will receive our reply in your email\nwithin 2 working days.", textAlign: TextAlign.center),
          Gap.gy6,
          Row(children: [
            ThemeButton.expandedPill(title: "Cancel", onTap: () => routeBack(context), icon: FeatherIcons.x, dark: true, color: HexColor("#5d6b82")),
            Gap.gx2,
            ThemeButton.expandedPill(title: "Send", onTap: () => route(context, const Home()), icon: FeatherIcons.send, dark: true, color: ThemeColor.secondary)
          ]),
          Gap.gy6
        ]));
  }
}
