import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/give_heart_button.dart';
import 'package:biyer_juti/component/profile_carosel_image.dart';
import 'package:biyer_juti/component/profile_chip.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:biyer_juti/util/page_navigation.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../component/bottom_navigation.dart';
import '../component/information_tile.dart';
import '../component/information_tile_detail.dart';
import '../component/profile_information_sub_header.dart';
import '../component/section_header.dart';
import '../util/global_function.dart';
import 'edit_my_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, this.myProfile = false});

  final bool myProfile;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(hideBack: widget.myProfile),
        bottomNavigationBar: widget.myProfile ? const ThemeNavigation(currentIndex: 3) : null,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(ThemePadding.value * 6, ThemePadding.value * 8, ThemePadding.value * 6, ThemePadding.value * 24),
            child: Column(children: [
              ProfileCarouselImage(images: List.generate(6, (index) => "https://picsum.photos/1024/1024?random=${randomNumber(20)}")),
              const ProfileChip(labels: ["27  Years old", "Dhaka, Bangladesh", "Private Service Holder"]),
              if (!widget.myProfile) GiveHeartButton(hearted: false, matched: false, onTap: () {}),
              if (widget.myProfile) ThemeButton.edit(title: "Edit Profile", onTap: () => route(context, const EditMyProfile(id: 0)), padding: ThemePadding.px6 * 4, icon: FeatherIcons.edit3),
              Column(children: [
                ...personalInformation,
                ...educationInformation,
                ...professionInformation,
                ...familyInformation,
                ...detailInformation,
              ])
            ])));
  }

  List<Widget> personalInformation = [
    const SectionHeader(label: "Personal Information"),
    const InformationTile(title: "User ID", value: "BJT 205011203", bold: true),
    const InformationTile(title: "Citizenship", value: "Bangladeshi"),
    const InformationTile(title: "Gender", value: "Female"),
    const InformationTile(title: "Age", value: "27"),
    const InformationTile(title: "Religion", value: "Islam, Sunni"),
    const InformationTile(title: "Height", value: "5 feet & 10 inches"),
    const InformationTile(title: "Marital Status", value: "Never Married"),
    const InformationTile(title: "Present address", value: "Gulshan, Dhaka, Bangladesh. PO: 1203"),
    const InformationTile(title: "Hometown", value: "Kishoreganj")
  ];
  List<Widget> educationInformation = [
    const SectionHeader(label: "Education Information"),
    ...[
      const ProfileInformationSubHeader(label: "Education Qualification 1"),
      const InformationTile(title: "Degree", value: "BSc Engineering"),
      const InformationTile(title: "Subject", value: "Computer Science (CSE)"),
      const InformationTile(title: "Passing Year", value: 2019),
      const InformationTile(title: "Institution name", value: "BUET"),
      const InformationTile(title: "Country", value: "Bangladesh")
    ],
    ...[
      const ProfileInformationSubHeader(label: "Education Qualification 2"),
      const InformationTile(title: "Degree", value: "MSc"),
      const InformationTile(title: "Subject", value: "Computer Science (CSE)"),
      const InformationTile(title: "Passing Year", value: 2022),
      const InformationTile(title: "Institution name", value: "BUET"),
      const InformationTile(title: "Country", value: "Bangladesh")
    ],
  ];
  List<Widget> professionInformation = [
    const SectionHeader(label: "Profession Information"),
    ...[
      const ProfileInformationSubHeader(label: "Professional Qualification 1"),
      const InformationTile(title: "Industry", value: "Private Sector"),
      const InformationTile(title: "Designation", value: "Senior Product Manager"),
      const InformationTile(title: "Organization Name", value: "Neta Inc.")
    ],
  ];
  List<Widget> familyInformation = [
    const SectionHeader(label: "Family Information"),
    const InformationTile(title: "Father's profession", value: "Retired Private Service Holder"),
    const InformationTile(title: "Father's hometown", value: "Dhaka"),
    const InformationTile(title: "Mother's profession", value: "Home Maker"),
    const InformationTile(title: "Mother's hometown", value: "Munshiganj"),
    const InformationTile(title: "Number Of Brothers", value: 3),
    const InformationTile(title: "Number of Sisters", value: 4)
  ];
  List<Widget> detailInformation = [
    const InformationTileDetail(
        title: "Family Details",
        value:
            "One of my favorite pastimes is hiking, and I love nothing more than being out in nature, breathing in fresh air and taking in the breathtaking views. When I am not hiking, you can find me playing basketball, which is a great way to stay active and competitive. Another one of my hobbies is cooking, and I love experimenting with new recipes and ingredients to create delicious and healthy meals."),
    const InformationTileDetail(
        title: "About Myself (BIO)",
        value:
            "One of my favorite pastimes is hiking, and I love nothing more than being out in nature, breathing in fresh air and taking in the breathtaking views. When I am not hiking, you can find me playing basketball, which is a great way to stay active and competitive. Another one of my hobbies is cooking, and I love experimenting with new recipes and ingredients to create delicious and healthy meals."),
  ];
}
