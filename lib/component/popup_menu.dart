import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/gap.dart';

PopupMenuItem menuItem({required String label, required IconData icon}) =>
    PopupMenuItem(child: Row(children: [Icon(icon, size: 16), Gap.gx2, Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: ThemeColor.navyBlue))]));
