import 'package:biyer_juti/theme/colors.dart';
import 'package:flutter/material.dart';

class InformationTile extends StatelessWidget {
  const InformationTile({super.key, this.value, required this.title});

  final String title;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          SizedBox(width: MediaQuery.of(context).size.width / 3, child: Text(title, style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.bold))),
          Text(" :  ", style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(child: Text(value.toString(), style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.normal)))
        ]));
  }
}
