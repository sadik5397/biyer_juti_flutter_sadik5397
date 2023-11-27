import 'package:biyer_juti/component/button.dart';
import 'package:biyer_juti/component/profile_carosel_image.dart';
import 'package:biyer_juti/component/profile_chip.dart';
import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../component/app_bar.dart';
import '../component/information_tile_detail_edit.dart';
import '../component/information_tile_edit.dart';
import '../component/profile_information_sub_header.dart';
import '../component/section_header.dart';
import '../theme/gap.dart';
import '../util/global_function.dart';

class EditMyProfile extends StatefulWidget {
  const EditMyProfile({super.key, required this.id});

  final int id;

  @override
  State<EditMyProfile> createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(ThemePadding.value * 6, ThemePadding.value * 8, ThemePadding.value * 6, ThemePadding.value * 24),
            child: Column(children: [
              ProfileCarouselImage(images: List.generate(6, (index) => "https://picsum.photos/1024/1024?random=${randomNumber(20)}")),
              const ProfileChip(labels: ["27  Years old", "Dhaka, Bangladesh", "Private Service Holder"]),
              Container(padding: ThemePadding.p4, decoration:BoxDecoration(borderRadius: ThemeBorderRadius.r6, color: ThemeColor.jetBlack.withOpacity(.5)), child: Text("   Your are now editing your profile   ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              Column(children: [
                ...personalInformation,
                ...educationInformation,
                ...professionInformation,
                ...familyInformation,
                ...detailInformation,
                Gap.gy4,
                Row(children: [
                  ThemeButton.expandedPill(title: "Cancel", onTap: () {},  dark: true, color: HexColor("#8993a4")),
                  Gap.gx4,
                  ThemeButton.expandedPill(title: "Save Profile", onTap: () {}, dark: true, color: ThemeColor.superRed)
                ])
              ])
            ])));
  }

  List<Widget> personalInformation = [
    const SectionHeader(label: "Personal Information"),
    const InformationTileEdit(title: "User ID", value: "BJT 205011203"),
    const InformationTileEdit(title: "Citizenship", value: "Bangladeshi"),
    const InformationTileEdit(title: "Gender", value: "Female"),
    const InformationTileEdit(title: "Age", value: "27"),
    const InformationTileEdit(title: "Religion", value: "Islam, Sunni"),
    const InformationTileEdit(title: "Height", value: "5 feet & 10 inches"),
    const InformationTileEdit(title: "Marital Status", value: "Never Married"),
    const InformationTileEdit(title: "Present address", value: "Gulshan, Dhaka, Bangladesh. PO: 1203"),
    const InformationTileEdit(title: "Hometown", value: "Kishoreganj")
  ];
  List<Widget> educationInformation = [
    const SectionHeader(label: "Education Information"),
    ...[
      const ProfileInformationSubHeader(label: "Education Qualification 1"),
      const InformationTileEdit(title: "Degree", value: "BSc Engineering"),
      const InformationTileEdit(title: "Subject", value: "Computer Science (CSE)"),
      const InformationTileEdit(title: "Passing Year", value: 2019),
      const InformationTileEdit(title: "Institution name", value: "BUET"),
      const InformationTileEdit(title: "Country", value: "Bangladesh")
    ],
    ...[
      const ProfileInformationSubHeader(label: "Education Qualification 2"),
      const InformationTileEdit(title: "Degree", value: "MSc"),
      const InformationTileEdit(title: "Subject", value: "Computer Science (CSE)"),
      const InformationTileEdit(title: "Passing Year", value: 2022),
      const InformationTileEdit(title: "Institution name", value: "BUET"),
      const InformationTileEdit(title: "Country", value: "Bangladesh")
    ],
  ];
  List<Widget> professionInformation = [
    const SectionHeader(label: "Profession Information"),
    ...[
      const ProfileInformationSubHeader(label: "Professional Qualification 1"),
      const InformationTileEdit(title: "Industry", value: "Private Sector"),
      const InformationTileEdit(title: "Designation", value: "Senior Product Manager"),
      const InformationTileEdit(title: "Organization Name", value: "Neta Inc.")
    ],
  ];
  List<Widget> familyInformation = [
    const SectionHeader(label: "Family Information"),
    const InformationTileEdit(title: "Father's profession", value: "Retired Private Service Holder"),
    const InformationTileEdit(title: "Father's hometown", value: "Dhaka"),
    const InformationTileEdit(title: "Mother's profession", value: "Home Maker"),
    const InformationTileEdit(title: "Mother's hometown", value: "Munshiganj"),
    const InformationTileEdit(title: "Number Of Brothers", value: 3),
    const InformationTileEdit(title: "Number of Sisters", value: 4)
  ];
  List<Widget> detailInformation = [
    const InformationTileDetailEdit(
        title: "Family Details",
        value:
            "One of my favorite pastimes is hiking, and I love nothing more than being out in nature, breathing in fresh air and taking in the breathtaking views. When I am not hiking, you can find me playing basketball, which is a great way to stay active and competitive. Another one of my hobbies is cooking, and I love experimenting with new recipes and ingredients to create delicious and healthy meals."),
    const InformationTileDetailEdit(
        title: "About Myself (BIO)",
        value:
            "One of my favorite pastimes is hiking, and I love nothing more than being out in nature, breathing in fresh air and taking in the breathtaking views. When I am not hiking, you can find me playing basketball, which is a great way to stay active and competitive. Another one of my hobbies is cooking, and I love experimenting with new recipes and ingredients to create delicious and healthy meals."),
  ];
}
