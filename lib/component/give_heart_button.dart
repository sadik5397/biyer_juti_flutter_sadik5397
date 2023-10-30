import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GiveHeartButton extends StatefulWidget {
  const GiveHeartButton({super.key, required this.onTap, required this.hearted, required this.matched});

  final VoidCallback onTap;
  final bool hearted;
  final bool matched;

  @override
  State<GiveHeartButton> createState() => _GiveHeartButtonState();
}

class _GiveHeartButtonState extends State<GiveHeartButton> {
  late bool hearted = widget.hearted;
  late bool matched = widget.matched;

  @override
  Widget build(BuildContext context) {
    return matched
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0), gradient: LinearGradient(colors: [HexColor("#D4488B"), HexColor("#FF2876")], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: const Padding(
                padding: EdgeInsets.all(12),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(padding: EdgeInsets.only(right: 8), child: Icon(Icons.compare_arrows_rounded, size: 21, color: Colors.white)),
                  Text("Matched", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white))
                ])))
        : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                gradient: hearted ? null : LinearGradient(colors: [HexColor("#D96565"), HexColor("#B91A1A")], begin: Alignment.centerLeft, end: Alignment.centerRight),
                border: hearted ? Border.all(color: HexColor("#B91A1A"), strokeAlign: BorderSide.strokeAlignOutside) : null),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: () {
                      setState(() => hearted = !hearted);
                      widget.onTap.call();
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(hearted ? Icons.favorite_border_rounded : Icons.favorite_rounded, size: 21, color: hearted ? HexColor("#B91A1A") : Colors.white)),
                          Text(hearted ? "Heart Given" : "Give Heart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: hearted ? HexColor("#B91A1A") : Colors.white))
                        ])))));
  }
}
