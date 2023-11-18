import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailVerificationStatus extends StatelessWidget {
  const EmailVerificationStatus({super.key, required this.status});

  final bool status;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(!status ? "assets/svg/email_not_verified.svg" : "assets/svg/email_verified.svg", height: 40);
  }
}
