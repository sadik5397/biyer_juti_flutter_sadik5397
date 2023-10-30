import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class InformationTileDetail extends StatelessWidget {
  const InformationTileDetail({super.key, this.value, required this.title});

  final String title;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(padding: const EdgeInsets.only(bottom: 8), child: Text('$title  :', style: TextStyle(color: HexColor("#661010"), fontSize: 14, fontWeight: FontWeight.bold))),
          Row(children: [
            Container(color: HexColor("#243757"), height: 120, width: 1, margin: const EdgeInsets.only(right: 16)),
            Expanded(child: Text(value.toString(), style: TextStyle(color: HexColor("#661010"), fontSize: 14, fontWeight: FontWeight.normal), textAlign: TextAlign.justify))
          ])
        ]));
  }
}
