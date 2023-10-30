import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class InformationTile extends StatelessWidget {
  const InformationTile({super.key, this.value, required this.title});

  final String title;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          SizedBox(width: MediaQuery.of(context).size.width / 3, child: Text(title, style: TextStyle(color: HexColor("#661010"), fontSize: 14, fontWeight: FontWeight.bold))),
          Text(" :  ", style: TextStyle(color: HexColor("#661010"), fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(child: Text(value.toString(), style: TextStyle(color: HexColor("#661010"), fontSize: 14, fontWeight: FontWeight.normal)))
        ]));
  }
}
