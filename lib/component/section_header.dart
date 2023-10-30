import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16).copyWith(top: 48), child: Text(label, style: TextStyle(color: HexColor("#661010"), fontWeight: FontWeight.bold, fontSize: 24)));
  }
}
