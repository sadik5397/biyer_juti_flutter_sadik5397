import 'package:biyer_juti/theme/colors.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';

class ProfileChip extends StatelessWidget {
  const ProfileChip({super.key, required this.labels});

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
            padding: ThemePadding.py4,
            child: Row(
                children: List.generate(
                    labels.length,
                    (index) => Padding(
                          padding: ThemePadding.px1,
                          child: Chip(
                              elevation: 0,
                              shape: const StadiumBorder(side: BorderSide(color: Colors.transparent, width: 0)),
                              label: Text(labels[index], style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                              backgroundColor: ThemeColor.secondary),
                        )))));
  }
}
