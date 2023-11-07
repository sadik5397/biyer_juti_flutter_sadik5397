import 'package:biyer_juti/theme/gap.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/padding.dart';
import 'button.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  int otpLength = 6;

  int eta = 30;
  late List<TextEditingController> controller = List.generate(otpLength, (index) => TextEditingController());
  late List<FocusNode> focus = List.generate(otpLength, (index) => FocusNode());

  startTimer() async => await Future.delayed(const Duration(seconds: 1)).then((value) => eta > 0 ? setState(() => eta--) : null).then((value) => eta > 0 ? startTimer() : null);

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Enter Code"),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              otpLength,
              (index) => Padding(
                  padding: ThemePadding.px2,
                  child: SizedBox(
                      width: 24,
                      child: TextField(
                          controller: controller[index],
                          focusNode: focus[index],
                          style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.bold),
                          cursorColor: ThemeColor.primary,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          onChanged: (value) => FocusScope.of(context).nextFocus(),
                          buildCounter: null,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeColor.primary, width: 2)),
                              counterText: "",
                              border: UnderlineInputBorder(borderSide: BorderSide(color: ThemeColor.primary)))))))),
      Gap.gy4,
      Text("Resend Code in $eta Seconds"),
      Gap.gy2,
      ThemeButton.text(label: "Resend Now", color: ThemeColor.secondary, weight: FontWeight.bold, onTap: () {}),
    ]);
  }
}
