import 'package:biyer_juti/component/text_field.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:flutter/material.dart';

class InformationTileEdit extends StatelessWidget {
  const InformationTileEdit({super.key, this.value, required this.title});

  final String title;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          SizedBox(width: MediaQuery.of(context).size.width / 3, child: Text(title, style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.bold))),
          Text(" :  ", style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(child: ThemeTextField.inline(labelText: title, controller: TextEditingController(text: value.toString())))
        ]));
  }
}