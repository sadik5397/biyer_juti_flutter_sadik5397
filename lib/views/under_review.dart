import 'package:biyer_juti/component/app_bar.dart';
import 'package:biyer_juti/component/hyperlink.dart';
import 'package:biyer_juti/component/section_header.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/gap.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:biyer_juti/views/sign_in.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../api/dummy_daya.dart';
import '../component/email_verification_status.dart';
import '../component/video_card.dart';

class UnderReview extends StatefulWidget {
  const UnderReview({super.key});

  @override
  State<UnderReview> createState() => _UnderReviewState();
}

class _UnderReviewState extends State<UnderReview> {
  bool verificationSent = false;
  bool emailVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.lightPinkBackground,
        appBar: ThemeAppBar.blank(
            action: Padding(
          padding: ThemePadding.px3,
          child: IconButton(onPressed: () => route(context, const SignIn()), icon: const Icon(FeatherIcons.logOut, size: 20)),
        )),
        body: ListView(padding: ThemePadding.px6, children: [
          Image.asset("assets/logo-wide.png", height: 75),
          const SectionHeader(label: "Under Review", topGap: false),
          Gap.gy4,
          Text(
              "Thank you for signing up. To ensure that all the users are real and also to maintain the standard of our website, we review each profile before activating the same. This review process may take up to 4 days. You will receive confirmation sms and/or email after your profile is activated. Thank you.",
              style: TextStyle(color: ThemeColor.primary),
              textAlign: TextAlign.center),
          Gap.gy4,
          Text(
              "সাইন আপ করার জন্য আপনাকে ধন্যবাদ। সমস্ত ব্যবহারকারীর সত্যতা নিশ্চিত করার জন্য এবং আমাদের ওয়েবসাইটের মান বজায় রাখার জন্য, আমরা প্রতিটি প্রোফাইল সক্রিয় করার আগে পর্যালোচনা করি। এই পর্যালোচনা প্রক্রিয়াটি ৪ (চার) দিন পর্যন্ত সময় নিতে পারে। আপনার প্রোফাইল সক্রিয় হওয়ার পরে আপনি নিশ্চিতকরণ এসএমএস এবং / অথবা ইমেল পাবেন। ধন্যবাদ।",
              style: TextStyle(color: ThemeColor.primary),
              textAlign: TextAlign.center),
          Gap.gy6,
          SectionHeader(label: "Email Verification Status", topGap: false, fontSize: 20, color: ThemeColor.primary),
          EmailVerificationStatus(status: emailVerified),
          if (!emailVerified) Gap.gy2,
          if (!emailVerified)
            Hyperlink(
                child: Container(
                    alignment: Alignment.center,
                    padding: ThemePadding.p2,
                    child: Text(verificationSent ? "Verification link sent" : "Send verification link",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: verificationSent ? ThemeColor.navyBlue : ThemeColor.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: verificationSent ? TextDecoration.none : TextDecoration.underline))),
                onTap: () => setState(() => verificationSent = true)),
          if (verificationSent) Gap.gy2,
          if (verificationSent) Text("Please check your email and click on the verification link to verify your email address.", style: TextStyle(color: ThemeColor.primary), textAlign: TextAlign.center),
          Gap.gy6,
          Gap.gy6,
          SectionHeader(label: "Learn More", topGap: false, fontSize: 20, color: ThemeColor.primary),
          SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: List.generate(5, (index) => VideoCard(videoID: DummyData.youtubeVideoIDs[index])))),
          Gap.gy6,
          Gap.gy6,
        ]));
  }
}
