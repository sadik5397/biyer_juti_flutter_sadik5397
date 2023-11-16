import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/colors.dart';

enum RequestState { none, requestContact, requestPending, acceptContact, payNowForMobileNumber, contactInfo }

class RequestButton extends StatelessWidget {
  const RequestButton({super.key, required this.onTap, required this.state, this.mobileNumber});

  final VoidCallback onTap;
  final RequestState state;
  final String? mobileNumber;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
            margin: state == RequestState.contactInfo ? ThemePadding.pr2 : null,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: ThemeBorderRadius.r6,
                border: state == RequestState.requestPending || state == RequestState.contactInfo ? Border.all(color: ThemeColor.primary, strokeAlign: BorderSide.strokeAlignOutside) : null,
                color: state == RequestState.requestContact
                    ? HexColor("#4286F4")
                    : state == RequestState.requestPending
                        ? HexColor("#EBEDF0")
                        : state == RequestState.acceptContact
                            ? ThemeColor.primary
                            : state == RequestState.payNowForMobileNumber
                                ? HexColor("#42B77D")
                                : ThemeColor.lightRedBackground),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    borderRadius: ThemeBorderRadius.r6,
                    onTap: () => onTap.call(),
                    child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: ThemePadding.p3,
                        child: Text(
                            state == RequestState.requestContact
                                ? "Request Contact Number"
                                : state == RequestState.requestPending
                                    ? "Request Pending"
                                    : state == RequestState.acceptContact
                                        ? "Accept Contact Request"
                                        : state == RequestState.payNowForMobileNumber
                                            ? "Pay Now for Mobile Number"
                                            : mobileNumber ?? "",
                            style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: state == RequestState.requestPending || state == RequestState.contactInfo ? ThemeColor.primary : Colors.white)))))),
      ),
      if (state == RequestState.contactInfo)
        FloatingActionButton(shape: const CircleBorder(), onPressed: () async => await launchUrl(Uri.parse("tel:$mobileNumber")), mini: true, elevation: 0, backgroundColor: ThemeColor.primary, child: const Icon(FeatherIcons.phone, size: 16, color: Colors.white)),
      if (state == RequestState.contactInfo)
        FloatingActionButton(shape: const CircleBorder(), onPressed: () async =>   await Clipboard.setData(ClipboardData(text: mobileNumber.toString()))
            , mini: true, elevation: 0, backgroundColor: ThemeColor.primary, child: const Icon(FeatherIcons.copy, size: 18, color: Colors.white)),
    ]);
  }
}
