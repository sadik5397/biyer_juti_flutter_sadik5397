import 'package:biyer_juti/component/dropdown_button.dart';
import 'package:biyer_juti/theme/colors.dart';
import 'package:flutter/material.dart';

class InformationTileDropDown extends StatelessWidget {
  const InformationTileDropDown({super.key, this.value, required this.title, required this.options});

  final String title;
  final List<String> options;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          SizedBox(width: MediaQuery.of(context).size.width / 3, child: Text(title, style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.bold))),
          Text(" :  ", style: TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(child: ThemeDropDownButton.inline(fontSize:14, labelColor: ThemeColor.navyBlue, useBorder: true, iconRightSide: true, title: title, options: options, value: null, onChanged: (Object? value) {}))
        ]));
  }
}

//TextStyle(color: ThemeColor.secondary, fontSize: 14, fontWeight: FontWeight.normal)
