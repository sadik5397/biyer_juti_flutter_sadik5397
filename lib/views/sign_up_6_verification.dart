import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/photo_uploader.dart';
import 'package:biyer_juti/component/progress.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/views/under_review.dart';
import 'package:flutter/material.dart';

import '../component/custom_information_section.dart';
import '../component/custom_toggle_selection.dart';
import '../util/page_navigation.dart';

class SignUp6Verification extends StatefulWidget {
  const SignUp6Verification({super.key});

  @override
  State<SignUp6Verification> createState() => _SignUp6VerificationState();
}

class _SignUp6VerificationState extends State<SignUp6Verification> {
  List<String> sideNames = ["Front Side", "Back Side"];
  late List<String?> base64bothSides = List.generate(sideNames.length, (index) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        appBar: ThemeAppBar.blank(context: context, useNewAppBar: true),
        body: ListView(padding: ThemePadding.px6, children: [
          Image.asset("assets/logo-wide.png", height: 75),
          SectionHeader(label: "Verification", topGap: false, color: ThemeColor.primary),
          Gap.gy4,
          Text("This section is for verification only. Other users will not see this information.", style: TextStyle(color: ThemeColor.primary), textAlign: TextAlign.center),
          Text("এই বিভাগটি শুধুমাত্র যাচাইকরণের জন্য। অন্য ব্যবহারকারীরা এই তথ্য দেখতে পাবেন না।", style: TextStyle(color: ThemeColor.primary), textAlign: TextAlign.center),
          Gap.gy6,
          const CustomToggleSelection(transparent: true, label: "Verification Method *", options: ["NID Card", "Passport"]),
          Gap.gy4,
          CustomInformationSection(transparent: false, header: "Upload NID or Passport’s Images", children: [
            Gap.gy6,
            // Text("Additional Photos (Optional)", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            // Gap.gy4,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    base64bothSides.length,
                    (index) => PhotoUploader.base64(
                        useGradientBackground: true,
                        useSolidColor: true,
                        backgroundColor: ThemeColor.secondary,
                        size: 120,
                        base64img: base64bothSides[index],
                        onDelete: () => setState(() => base64bothSides[index] = null),
                        onTap: () async => await PhotoUploader.popup(
                            context: context,
                            onCamera: () async {
                              base64bothSides[index] = await PhotoUploader.getImageBase64(fromCamera: true);
                              setState(() {});
                            },
                            onGallery: () async {
                              base64bothSides[index] = await PhotoUploader.getImageBase64();
                              setState(() {});
                            })))),
            Gap.gy2,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(sideNames.length, (index) => Text(sideNames[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ThemeColor.navyBlue)))),
            Gap.gy3
          ]),
          Gap.gy6,
          Gap.gy6,
          Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "SUBMIT", bold: true, onTap: () => routeNoBack(context, const UnderReview()), color: ThemeColor.superRed)),
          const Progress(progress: 7, outOf: 7),
          Gap.gy6
        ]));
  }
}
