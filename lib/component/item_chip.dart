import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ItemChip extends StatelessWidget {
  const ItemChip({super.key, required this.label, required this.onDelete});
  final String label;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
      backgroundColor: HexColor("243757").withOpacity(.9),
      visualDensity: VisualDensity.compact,
      side: BorderSide.none,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      deleteIcon: const Icon(FeatherIcons.x, color: Colors.white, size: 12),
      onDeleted: onDelete
    );
  }
}
