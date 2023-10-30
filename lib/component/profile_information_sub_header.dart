import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileInformationSubHeader extends StatelessWidget {
  const ProfileInformationSubHeader({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 3),
        decoration: BoxDecoration(color: HexColor("#DBA2A2"), borderRadius: BorderRadius.circular(16)),
        child: Text(label, style: TextStyle(color: HexColor("#661010"), height: 0, fontSize: 12, fontWeight: FontWeight.bold)));
  }
}
