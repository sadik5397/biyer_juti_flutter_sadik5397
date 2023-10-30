import 'package:biyer_juti/component/profile_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F7),
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(16).copyWith(top: 32),
        children: [Search(), ...List.generate(10, (index) => ProfileCard(index: index))],
      ),
    );
  }
}

Container Search() {
  return Container(
    padding: EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(color: Color(0xfff05455), borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 20, offset: const Offset(0, 4))]),
    width: double.maxFinite,
    child: Column(
      children: [
        Text("Find Your Life Partner", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Padding(padding: const EdgeInsets.all(16), child: Text("Select Preferred Age", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))),
        Slider(value: 0, onChanged: (value) {}, activeColor: Colors.white),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: StadiumBorder(), elevation: 0),
            onPressed: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Select Religion", style: TextStyle(color: Color(0xffA81B1B), fontSize: 14)),
              Icon(Icons.arrow_drop_down_rounded, size: 20, color: Color(0xffA81B1B)),
            ])),
      ],
    ),
  );
}
