import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileChip extends StatelessWidget {
  const ProfileChip({super.key, required this.labels});

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
                children: List.generate(
                    labels.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Chip(label: Text(labels[index], style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)), backgroundColor: HexColor("#661010")),
                        )))));
  }
}
