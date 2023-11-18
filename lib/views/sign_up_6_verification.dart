import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/photo_uploader.dart';
import 'package:biyer_juti/component/progress.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

import '../component/custom_information_section.dart';

class SignUp6Verification extends StatefulWidget {
  const SignUp6Verification({super.key});

  @override
  State<SignUp6Verification> createState() => _SignUp6VerificationState();
}

class _SignUp6VerificationState extends State<SignUp6Verification> {
  String? base64ProfilePicture;
  List<String?> base64AdditionalPictures = List.generate(3, (index) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        appBar: ThemeAppBar.blank(),
        body: ListView(padding: ThemePadding.px6, children: [
          Image.asset("assets/logo-wide.png", height: 75),
          const SectionHeader(label: "Photograph", topGap: false),
          Gap.gy2,
          CustomInformationSection(header: "Upload Photo", children: [
            Gap.gy4,
            Text("Please  upload the most recent\nphotographs of yours.", style: TextStyle(color: ThemeColor.primary), textAlign: TextAlign.center),
            Gap.gy4,
            Gap.gy4,
            Text("Profile Photo *", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            Gap.gy4,
            PhotoUploader.base64(
                size: 160,
                base64img: base64ProfilePicture,
                onDelete: () => setState(() => base64ProfilePicture = null),
                onTap: () async => await PhotoUploader.popup(
                    context: context,
                    onCamera: () async {
                      base64ProfilePicture = await PhotoUploader.getImageBase64(fromCamera: true);
                      setState(() {});
                    },
                    onGallery: () async {
                      base64ProfilePicture = await PhotoUploader.getImageBase64();
                      setState(() {});
                    })),
            Gap.gy6,
            Text("Additional Photos (Optional)", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            Gap.gy4,
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    base64AdditionalPictures.length,
                    (index) => PhotoUploader.base64(
                        size: 80,
                        base64img: base64AdditionalPictures[index],
                        onDelete: () => setState(() => base64AdditionalPictures[index] = null),
                        onTap: () async => await PhotoUploader.popup(
                            context: context,
                            onCamera: () async {
                              base64AdditionalPictures[index] = await PhotoUploader.getImageBase64(fromCamera: true);
                              setState(() {});
                            },
                            onGallery: () async {
                              base64AdditionalPictures[index] = await PhotoUploader.getImageBase64();
                              setState(() {});
                            })))),
            Gap.gy2
          ]),
          Gap.gy4,
          Gap.gy4,
          Gap.gy4,
          Padding(padding: ThemePadding.px6 * 4, child: ThemeButton.primary(title: "NEXT", onTap: () {}, color: ThemeColor.primary)),
          const Progress(progress: 6, outOf: 7),
          Gap.gy6
        ]));
  }
}
